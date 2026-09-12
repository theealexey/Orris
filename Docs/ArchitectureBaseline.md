# Orris — Architecture Baseline

Status: Phase 0 conceptual baseline
Date: 2026-09-12
This document defines boundaries for future work. It creates no Swift types,
targets, packages, providers, persistence records, or UI.

## 1. Decision summary

Orris will be a Swift 6+, SwiftUI-first, native iPhone/iPad/macOS product.
Business behavior is shared where it is genuinely the same; platform
Presentation is composed separately where its interaction model differs.
Native macOS is a first-class application, not a Catalyst target.

The baseline intentionally avoids a BaseViewModel, BaseRepository,
BaseUseCase, service locator, global mutable singleton, giant environment
object, protocol forest, or wrapper that merely forwards another API.

## 2. Dependency direction

~~~text
Presentation
    ↓
ViewModel
    ↓
Use case
    ↓
Repository contract
    ↓
Provider infrastructure and persistence
~~~

Cross-cutting design primitives remain narrow and semantic. Domain never
imports SwiftUI, UIKit, AppKit, SwiftData, WebKit, provider SDKs, provider
DTOs, IMAP/SMTP wire structures, Keychain implementations, or URLSession
details.

## 3. Initial folder/module strategy

Phase 0 intentionally creates no application structure. At M1, start with
clear folders inside the application project rather than premature package
fragmentation:

~~~text
Orris
├── App                 app root and composition root
├── Domain              provider-neutral models and policies
├── UseCases            product operations with real coordination logic
├── RepositoryContracts provider-neutral dependency contracts
├── Infrastructure      provider adapters, auth, network, MIME as later needed
├── Persistence         SwiftData records, mapping, local file cache
├── Sync                refresh and pending-operation orchestration
├── DesignSystem        small shared semantic primitives only
├── Presentation
│   ├── iOS
│   ├── iPadOS
│   └── macOS
└── Tests
~~~

Folders state responsibilities; they do not promise one framework or one
module per folder. Extract a module only after a compiler-enforced boundary,
build-time need, or independently testable responsibility justifies it.

## 4. Layer responsibilities

| Layer | Owns | Does not own |
| --- | --- | --- |
| Domain | Provider-neutral mail concepts, capabilities, product rules, value semantics. | UI strings, platform frameworks, persistence records, transport. |
| UseCases | Product-level coordination such as loading a mailbox or executing an action. | UI layout, DTO mapping, direct ModelContext use. |
| RepositoryContracts | Narrow capabilities the product needs. | Provider-specific APIs or one proxy contract per method. |
| Infrastructure | Gmail/Graph/IMAP/SMTP/auth/MIME/provider mappings when later introduced. | Presentation decisions. |
| Persistence | SwiftData records, local metadata/cache, file-cache ownership, mapping. | Provider authority or SwiftUI state. |
| Sync | Refresh scheduling, cursors, reconciliation, retry, pending-operation lifecycle. | Screens and provider DTO leakage. |
| Presentation | Screen composition, navigation, formatting, accessibility, platform interaction state. | Tokens, records, provider DTOs, network and storage implementation. |

## 5. Shared behavior and Presentation boundary

Share Domain, use cases, contracts, sync policies, and a ViewModel only when
its state describes the same product behavior on all platforms. Do not force a
single View across a compact iPhone flow and a persistent desktop split view.

Use explicit iOS, iPadOS, and macOS composition for substantially different
layouts. Small conditional adaptations are acceptable; a large file dominated
by operating-system compiler branches is a sign that composition should be
separated.

Presentation may see domain state, presentation formatting, navigation state,
accessibility state, and platform interaction state. It must not see provider
DTOs, SwiftData models, Keychain objects, MIME, SMTP, URLSession internals, or
authentication tokens.

## 6. Provider strategy and capabilities

Provider differences are a product fact, not an edge case. Future provider
adapters map their own semantics into provider-neutral product models and a
capability description. ProviderCapabilities is a conceptual availability
model, not a promise that each action exists.

Candidate capability categories for later validation:

- native thread semantics;
- labels;
- folders;
- archive;
- move;
- spam;
- star/flag;
- drafts;
- server search;
- provider-supported filters;
- push-like updates;
- scheduled send;
- server-side snooze;
- native categories.

The UI asks the product layer what is possible for the selected account or
selection; it never checks for Gmail, Graph, IMAP, or SMTP directly.

Filtering follows the same rule: the product contract describes supported
local and server predicates and the scope of their result. Presentation does
not imply that every provider can execute every filter remotely.

| Provider family | Architectural implication |
| --- | --- |
| Gmail | Native threads, labels, Gmail-specific history/sync primitives, and archive-like semantics require a Gmail adapter. Do not recast these as universal folders. |
| Microsoft Graph | Folders, categories, and conversation behavior require Graph-specific mapping and validation. |
| IMAP/SMTP-oriented providers such as Yandex/Mail.ru | Mailboxes, flags, UIDs, server capability discovery, SMTP send, and thread derivation can differ materially from Gmail. |

Exact scopes, API limits, push/sync primitives, categories, scheduling, and
provider contracts must be verified in the provider vertical-slice milestone.

## 7. SwiftData and local storage

SwiftData is a local persistence/cache technology. A provider remains
authoritative for server mail state. Each device owns an independent cache; no
CloudKit replication is introduced merely because the product runs on several
Apple devices.

Expected future persistence responsibilities:

- account and mailbox metadata;
- thread/message metadata and snippets;
- sync cursors and sync diagnostics;
- drafts and pending local operations;
- attachment metadata and local-cache references;
- limited search/index metadata where justified.

SwiftData record types stay inside Persistence. The mapping boundary is:

~~~text
SwiftData record → persistence mapping → Domain model → ViewModel → SwiftUI
~~~

ModelContext is owned by persistence infrastructure or an explicitly isolated
storage boundary. It is not injected through SwiftUI environment as a global
core-application dependency and does not escape into view models.

### Attachments

SwiftData holds AttachmentMetadata and a local cache reference, never arbitrary
large attachment payloads by convenience. A file cache owns actual bytes,
download status, failures, access coordination, cleanup, and eviction. The
later retention policy and storage quota are unresolved product decisions.

### Credentials

Keychain owns refresh tokens and other sensitive credentials. Persistence may
store non-secret account metadata and key references only. Token acquisition,
refresh, revocation/expiry response, and removal cross the Keychain/auth
boundary without exposing tokens upward.

## 8. HTML mail and composing

Real-world HTML email requires a WebKit boundary rather than assuming SwiftUI
Text or AttributedString is sufficient.

~~~text
SwiftUI message screen → isolated HTML mail component → WebKit
~~~

Apple documentation available on the audit date confirms WebKit for SwiftUI
WebView and WebPage APIs in the installed iOS/macOS 26.2 SDK family. Exact
deployment target has not been selected; if it predates those APIs, a narrow
WebKit bridge must be evaluated rather than leaking WebKit through Domain.

The isolated component needs later validation for sanitization, remote-image
and tracking-pixel policy, JavaScript policy, content height, accessibility,
link handling/phishing defense, and content isolation.

Compose remains SwiftUI-first. Targeted UIKit or AppKit text interoperability
is permitted only when a concrete production-quality rich-text need cannot be
met by SwiftUI APIs. Orris does not build a custom word processor preemptively.

The verified reference hierarchy includes formatted text controls and
attachments. Therefore a future compose slice must validate rich formatting,
attachments, focus, and platform presentation before committing to a
TextEditor-only design or adding a bridge.

## 9. Concurrency and task ownership

Use structured Swift Concurrency with explicit ownership:

| Boundary | Direction |
| --- | --- |
| ViewModel | MainActor only for UI-owned state and transitions. |
| Use case | Async product operation; no blanket MainActor isolation. |
| Provider/network | Async boundary returning mapped, transferable values. |
| Persistence | Isolated storage access; records do not cross into Presentation. |
| Sync | A named owner coordinates refresh, reconciliation, retries, and cancellation. |

Feature-scoped view tasks belong to the feature and cancel when its relevant
lifetime ends. A sync task has an explicit app/account lifecycle and
cancellation path. Prefer async/await, async let, and task groups for
structured work. Do not use Task.detached, nonisolated unsafe workarounds, or
unchecked Sendable as default escape hatches.

Crossing an isolation boundary requires immutable Sendable values or a
well-defined actor boundary. Future project settings for default actor
isolation and strict concurrency must be explicitly inspected when M1 creates
the Xcode project; Phase 0 does not guess them.

## 10. Sync, offline, and pending operations

~~~text
Remote provider
       ↓
  provider adapter
       ↓
    sync engine
    ↙       ↘
local cache   provider updates
~~~

Sync owns cursors/history tokens where supported, incremental refresh, error
classification, reconciliation, and backoff/cancellation policy. It must
preserve provider truth over stale cache data.

Offline mode is a cache-and-pending-action state, not a claim of full
provider-independent offline mail. A pending local action records intent,
target, account, state, retry/error context, and reconciliation outcome. UI
reports pending, failed, and completed states accurately.

For an action with safe reversible feedback, the operation boundary must retain
the pre-action state and an Undo-window outcome until provider reconciliation
settles it. Batch actions return per-message outcomes rather than one
all-or-nothing visual result: partial success, failure, cancellation, and
retry are product states that Presentation can report honestly.

CloudKit is excluded because remote mail providers already coordinate server
mail state between devices. A second synchronization authority would add
conflicts without a demonstrated product need.

## 11. Backend exclusion

No Orris backend exists in this baseline. Later reconsider only if an
evidence-backed requirement needs guaranteed scheduled send,
provider-independent push, server-side automation, reliable background work,
or cross-provider infrastructure beyond provider capabilities. This would
require a separate security, privacy, operations, and cost decision.

Schedule Send remains deliberately unresolved. Prefer a validated
provider-native capability when available; do not represent an active-client
approximation as a delivery guarantee. A reliability promise beyond provider
capabilities is one of the explicit triggers for a later backend decision.

## 12. Native macOS model

The main desktop experience is expected to use a WindowGroup with a
NavigationSplitView or deliberate sidebar/list/detail composition when the
screen benefits from simultaneously visible context. The normal model is one
main workspace window with scene/window-scoped selection and restoration
behavior deliberately chosen in implementation.

- Settings belongs in a dedicated Settings scene.
- Compose is evaluated as a separate compose window by default; multiple
  compose windows are appropriate when each is tied to a distinct draft.
- Multiple main windows need a concrete use case before being enabled.
- Core actions must have discoverable toolbar, menu/context-menu, and
  keyboard paths, not swipe-only exposure.
- The iPhone may expose fast swipe triage and floating contextual chrome; iPad
  and macOS expose equivalent actions through selection-aware controls,
  toolbar/menu/context-menu, and keyboard paths appropriate to the platform.
- Commands route actions through focused/selection-aware presentation state;
  they do not reach into repositories.
- Multi-selection is owned by the relevant scene/view model boundary and
  represented as stable identifiers.
- Drag/drop is a Presentation capability with a product/use-case boundary;
  it must not leak platform transfer objects into Domain.
- AppKit interop is a narrow last resort for a proven SwiftUI limitation in
  window, responder chain, text, or panel behavior.

Current Apple documentation confirms WindowGroup and Settings scene APIs.
Exact window modifiers and deployment availability are deferred until M1's
deployment target is selected.

## 13. Design-system direction

The future DesignSystem may provide semantic typography, spacing, surfaces,
foregrounds, separators, icon/avatar metrics, inbox-row metrics, selected and
unread states, toolbar metrics, motion, haptics, accessibility, and Liquid
Glass chrome rules. It must not become a giant token inventory before real UI
requires it.

Installed SDK research confirms native Liquid Glass APIs in the iOS/macOS 26
family, including glassEffect. Use it only for supported application chrome
such as navigation, filters, account switcher, selection controls, compose
controls, and contextual chrome. Do not use it indiscriminately on email rows,
body content, attachments, whole backgrounds, or every card. At implementation,
availability handling follows the chosen deployment targets; no fake
blur/shadow imitation is specified here.

## 14. Architectural risks and validations

| Risk | Required validation |
| --- | --- |
| Gmail-centric abstractions fail on IMAP/SMTP providers. | Define and test a real provider vertical slice before freezing product contracts. |
| Local cache diverges from provider state. | Exercise cursors, retries, pending actions, failure recovery, and reconciliation. |
| HTML mail exposes privacy/security or sizing problems. | Threat model and test remote images, links, scripts, tracking, accessibility, and malformed content. |
| Rich compose needs exceed SwiftUI. | Build a bounded prototype before introducing UIKit/AppKit bridges. |
| Desktop becomes a mobile layout at large size. | Run macOS usability review for selection, shortcuts, menus, windows, resize, and multiple drafts. |
| Premature modules/protocols slow iteration. | Begin with responsibility folders and introduce boundaries only where an actual dependency needs one. |
| Incorrect concurrency defaults are assumed. | Inspect created target settings and compile under Swift 6 before adopting an isolation policy. |

## 15. Assumptions requiring validation

- Provider policies permit the chosen OAuth/API/IMAP/SMTP scopes and product
  behavior.
- A first shippable product can start with one provider without contaminating
  the provider-neutral model.
- WebKit API availability matches the deployment target chosen at M1.
- SwiftData meets cache/query/performance needs for real mailbox scale.
- Native SwiftUI surfaces cover most product interaction without broad UIKit or
  AppKit bridges.
