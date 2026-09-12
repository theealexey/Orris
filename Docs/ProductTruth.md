# Orris — Product Truth

Status: Phase 0 baseline
Date: 2026-09-12
Decision level: product direction, not implementation

## 1. Product statement

Orris is an independent, native email client for Apple platforms. It helps a
person triage, read, write, and manage email across multiple accounts and
providers with low chrome, high information density, and platform-native
interaction.

The product is not a branded or technical derivative of Notion Mail. Notion
Mail is a reference for selected interaction principles only; Orris has no
Notion account, workspace, API, Calendar, AI, database/page integration,
branding, copy, logo, or proprietary asset dependency.

## 2. User and problem

The target user has more than one email account or provider and needs to
process mail quickly without switching among provider-specific applications.
The core problems are fragmented account access, slow triage, inconsistent
cross-provider semantics, and weak desktop ergonomics in mobile-first mail
clients.

Orris prioritizes:

- fast triage;
- focused thread reading;
- reliable composing and replying;
- truthful exposure of provider differences;
- native interaction on the device in use.

## 3. Positioning

Minimalist universal email for the Apple ecosystem, with first-class direction
for both Western and Russian email providers.

Orris is SwiftUI-first, local-first where appropriate, multi-account, and
multi-provider. It should be restrained and content-first rather than a
dashboard, a card collection, or an imitation of Gmail, Outlook, Yandex Mail,
Mail.ru, Apple Mail, or Notion Mail.

The visual product direction is content over chrome: dense flat mail rows,
clear sender/subject/preview hierarchy, restrained separators, minimal cards,
and equal light/dark quality. On supported future platforms, native Liquid
Glass belongs to contextual chrome rather than email content. These are Orris
principles adapted from verified reference patterns, never a pixel-copy target.

## 4. Platforms

Supported from product inception:

| Platform | Product direction |
| --- | --- |
| iPhone | Touch-first, compact navigation, one primary surface when appropriate, native sheets and contextual actions. |
| iPad | Adaptive split composition where useful, touch ergonomics plus keyboard, pointer, drag/drop, and multi-selection. |
| macOS | A native SwiftUI desktop application with sidebar, list/detail workspaces, menus, keyboard shortcuts, toolbars, windows, and stable selection. |

Mac Catalyst is explicitly excluded. macOS must not be a stretched or
stack-navigation copy of the iPhone application.

Out of scope: watchOS, visionOS, Android, web, and a backend service in the
current product phase.

## 5. Provider direction

Initial provider direction, in priority order:

1. Gmail
2. Microsoft Outlook and Microsoft 365
3. Yandex Mail
4. Mail.ru

Future candidates, not commitments: iCloud Mail and generic IMAP/SMTP
accounts. Initial direction is not a claim that all providers ship in v1.

Provider-neutral product terms:

| Orris term | Meaning |
| --- | --- |
| account | A connected provider identity and its authorization state. |
| mailbox | A provider-backed message collection; it may map to a folder, label-derived view, or provider-native collection. |
| label | A tag-like classification only when the provider supports it. It is not a universal synonym for folder. |
| folder | A hierarchical mailbox only when the provider supports it. |
| thread | A product-level conversation representation; its semantics may be provider-native or derived. |
| message | One email message in a thread or standalone collection. |
| action | A user intention such as archive, move, delete, mark read, or star. Availability depends on provider capabilities. |

Gmail terminology and semantics must never be treated as universal.

## 6. V1 boundary

V1 is bounded around a reliable vertical mail experience, not feature volume:

- connect a supported provider;
- browse a mailbox and read a thread;
- compose, reply, and perform the supported mail actions;
- preserve sensible local cache, pending-operation, and authentication state;
- work coherently on iPhone, iPad, and native macOS;
- make unavailable provider actions visibly unavailable rather than simulating
  them.

V1 does not promise provider-independent feature parity, AI organization,
calendar scheduling, automation, custom rich-text authoring, a cloud sync
layer, or a custom Orris backend.

Schedule Send and reminder/snooze are capability-dependent product decisions,
not guaranteed v1 features. A provider-native implementation, an
active-client approximation, and a backend guarantee are different products.

## 7. Source-of-truth rules

- A remote mail provider is authoritative for remote mail state.
- Each device owns its local cache; SwiftData is not a competing remote source
  of truth.
- SwiftData holds cache, metadata, sync cursors, draft and pending-operation
  data as later defined by the persistence boundary.
- Authentication secrets and refresh tokens belong to Keychain, never
  UserDefaults, SwiftData, plain files, or source control.
- The visible UI is derived from product/domain models, never directly from
  provider DTOs or SwiftData records.
- A local optimistic action remains explicitly pending until its provider
  outcome is known.

## 8. Privacy and security direction

Orris should request only the provider permissions needed for the selected
capability and should keep credentials within the Keychain boundary. Remote
images, link opening, HTML rendering, tracking pixels, attachment caching,
diagnostics/analytics, and log redaction require explicit product and security
decisions before implementation.

No user email, credentials, or provider data is sent through an Orris service
in Phase 0. No monetization model is invented in this phase.

## 9. Explicit non-goals

Orris is not:

- a Notion product or integration;
- a Gmail-only client;
- a Microsoft-only client;
- an AI inbox organizer;
- a calendar client;
- a workspace/database/page product;
- a web or Catalyst application;
- a custom word processor;
- a CloudKit-based second mail synchronization system;
- a backend-first mail platform.

## 10. Future possibilities

Only a demonstrated product requirement may justify later work on:

- iCloud Mail or generic IMAP/SMTP;
- scheduled send with a reliable execution model;
- push-like provider updates;
- provider-independent automation;
- server-side background processing;
- a backend service;
- additional account-security controls;
- richer editing interoperability.

Each requires a separate product, privacy, operational, and technical
decision. They are not commitments made by this baseline.

## 11. Unresolved product decisions

The following remain intentionally unresolved:

1. Minimum supported iOS, iPadOS, and macOS releases.
2. Exact v1 provider order and account-count policy.
3. Whether unified inbox is in the first shippable provider slice or follows
   proven per-account navigation.
4. Which provider permissions are minimally sufficient for each integration.
5. Remote-image and tracking-pixel default policy.
6. Attachment cache size, retention, and user-visible storage controls.
7. Draft ownership and conflict behavior across devices.
8. Notification scope and provider/background constraints.
9. Search scope, server/local boundary, and privacy expectations.
10. Accessibility acceptance criteria and localization set for the first
    release.
11. Whether desktop compose opens a separate window by default after a real
    prototype evaluates it.

These questions must be decided by evidence in later milestones, not silently
encoded as implementation assumptions.
