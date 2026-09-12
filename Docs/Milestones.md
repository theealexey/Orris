# Orris — Milestone Plan

Status: Phase 0 proposal
Principle: each milestone creates one demonstrable, testable vertical slice.
No milestone authorizes unrelated architecture, provider scope, or visual
imitation.

## M0 — Product and architecture baseline

- Goal: establish product truth, reference evidence, architecture boundaries,
  and delivery sequence.
- User-visible result: none; this is documentation.
- Technical scope: five Phase 0 documents, externally verified reference
  evidence, Git/version/task conventions, and local Git baseline.
- Excluded: Xcode project, Swift, UI, provider, persistence, integrations.
- Verification: documents exist, agree, and record evidence/unknowns honestly.
- Major risk: only supplied external captures, not a complete authorized
  multi-platform reference set, are available.
- Depends on: none.

## M1 — Multi-Platform Xcode Bootstrap

- Goal: create the smallest native iPhone/iPad/macOS Xcode project and verify
  it builds.
- User-visible result: minimal launchable platform shells only.
- Technical scope: targets, deployment-target decision, Swift 6 settings,
  app roots, build/test baseline, native macOS scene selection.
- Excluded: inbox, fake mail models beyond what a launch shell needs,
  persistence, providers, branding.
- Verification: clean build for all three platforms and a launch smoke check.
- Major risk: deployment-target choice changes availability of Liquid Glass and
  SwiftUI WebKit APIs.
- Depends on: M0.

## M2 — Static design board and narrow primitives

- Goal: make direction reviewable before product flows grow.
- User-visible result: static representative states for colors, type, spacing,
  row density, selection, unread/read, chrome, and accessibility stress.
- Technical scope: fake data, preview/static board, dense flat row hierarchy,
  light/dark parity, contextual chrome, and only the semantic primitives the
  board repeatedly proves necessary.
- Excluded: provider behavior, full inbox, final visual system, Notion
  imitation.
- Verification: light/dark, Dynamic Type, contrast, and iPhone/iPad/macOS
  design review against an authorized future reference set.
- Major risk: supplied evidence does not define every state, metric, or
  desktop/iPad adaptation.
- Depends on: M1 and authorized visual evidence.

## M3 — iPhone fake-data inbox

- Goal: prove compact mailbox triage with local fake data.
- User-visible result: a person can browse a dense flat inbox, scan
  sender/subject/preview/unread/timestamp hierarchy, select a thread, and
  reach contextual search and compose entry points.
- Technical scope: iPhone presentation, stable row identity, restrained
  separators, sender/service identity, floating chrome, touch swipe triage
  with non-gesture alternatives, view-model state, navigation, accessibility
  labels, fake domain fixtures.
- Excluded: provider integration, SwiftData, real actions, background sync.
- Verification: focused UI/state tests plus manual Dynamic Type, VoiceOver, and
  compact-device pass.
- Major risk: density and touch targets conflict without a real reference.
- Depends on: M2.

## M4 — Adaptive iPad inbox

- Goal: adapt the proven inbox behavior to iPad rather than enlarge iPhone UI.
- User-visible result: usable adaptive navigation with keyboard/pointer and
  appropriate split behavior.
- Technical scope: iPad composition, selection, size-class adaptation,
  keyboard/pointer paths, bounded drag/drop evaluation.
- Excluded: desktop window model, provider integration, persistent data.
- Verification: iPad simulator/manual resize, keyboard navigation, and
  selection tests.
- Major risk: one universal view hides platform-specific interaction debt.
- Depends on: M3.

## M5 — Native macOS mail shell

- Goal: establish desktop behavior before real data locks in a mobile model.
- User-visible result: sidebar/list/detail workspace, toolbar/menu/shortcut
  routes, dedicated Settings entry, and scene-scoped selection.
- Technical scope: native SwiftUI macOS scenes, split layout, Commands,
  keyboard shortcuts, context menus, window restoration decisions.
- Excluded: Catalyst, AppKit bridge without a proven need, provider data,
  multiple main windows.
- Verification: macOS build/launch, resize, keyboard, menu, pointer,
  multi-selection, and settings smoke pass.
- Major risk: desktop actions become touch-gesture dependent.
- Depends on: M3; may progress alongside M4 only after shared state is stable.

## M6 — Fake-data thread reader

- Goal: prove reading and navigation in each platform composition.
- User-visible result: open a thread, inspect messages, navigate back/next
  where appropriate, and discover placeholder actions.
- Technical scope: thread state, subject/participant/body hierarchy,
  capability-aware triage/reply actions, quoted-content visual strategy,
  action availability presentation, platform-specific reader composition.
- Excluded: real HTML rendering, attachments, provider mutations.
- Verification: focused state/UI tests and manual reading/selection review on
  all platforms.
- Major risk: future real HTML content invalidates assumptions.
- Depends on: M3, M4, and M5.

## M7 — Fake-data compose and drafts

- Goal: prove a small, reliable composing interaction.
- User-visible result: create/reply/forward draft states, address fields,
  Cc/Bcc, subject/body, discard confirmation, and a simulated send outcome.
- Technical scope: SwiftUI-first compose state, identity/address/subject/body
  hierarchy, bounded formatting and attachment-requirement validation,
  keyboard/focus behavior, platform-specific sheet/window presentation, fake
  draft lifecycle.
- Excluded: provider send, rich-text bridge, real attachments, cross-device
  draft sync.
- Verification: focused view-model tests, keyboard/focus tests, and manual
  iPhone/iPad/macOS compose review.
- Major risk: rich editing/attachments need force premature interop or scope
  growth before the requirement is proven.
- Depends on: M6.

## M8 — Account and mailbox navigation with fake data

- Goal: make multi-account product state explicit before persistence.
- User-visible result: switch account, choose supported mailbox/view, and see
  capability-aware action availability.
- Technical scope: provider-neutral account/mailbox models, compact
  account-switcher presentation, capability presentation, navigation state,
  fake providers with materially different behavior.
- Excluded: authentication, real provider clients, global service locator.
- Verification: state tests showing Gmail-like and folder-oriented capability
  differences; manual navigation pass.
- Major risk: false universal provider abstraction.
- Depends on: M3 through M7.

## M9 — Local SwiftData cache vertical slice

- Goal: replace temporary state with an isolated local cache for one bounded
  fake-data flow.
- User-visible result: a recent mailbox/draft state survives relaunch in the
  prototype.
- Technical scope: persistence records, domain mapping, migration posture,
  local draft and pending-operation model, attachment metadata/file-cache
  boundary.
- Excluded: real provider sync, secret storage, attachment binaries.
- Verification: persistence mapping tests, relaunch smoke test, and proof that
  records/ModelContext do not escape into Presentation.
- Major risk: treating cache as provider authority.
- Depends on: M8.

## M10 — Gmail read vertical slice

- Goal: connect one Gmail account and render a truthful provider-backed
  mailbox/thread read flow.
- User-visible result: authenticated account, inbox refresh, message list,
  thread reader, visible auth/sync error states.
- Technical scope: OAuth/auth boundary, Keychain ownership, Gmail adapter,
  Gmail-to-domain mapping, incremental sync discovery, cache reconciliation.
- Excluded: second provider, universal label/folder claim, all mutations,
  backend, CloudKit.
- Verification: sanctioned test account integration flow, token removal/expiry
  path, mapping/unit tests, sync cancellation/retry test, manual all-platform
  smoke.
- Major risk: provider policy, scope review, rate limits, and Gmail-specific
  semantics entering shared code.
- Depends on: M9.

## M11 — Gmail mutations and send

- Goal: complete a constrained real triage/compose loop for the first provider.
- User-visible result: supported archive/delete/read/star/label and
  compose/reply/forward actions with truthful pending, error, retry, and undo
  behavior where supportable.
- Technical scope: pending operations, reversible Undo feedback where safe,
  per-message batch outcomes/partial failures, reconciliation, draft/send
  lifecycle, provider capability checks, failure reporting.
- Excluded: scheduled send guarantee, AI, second provider, offline parity
  claims.
- Verification: test mailbox mutations, cancellation and recovery checks,
  provider-state reconciliation, manual desktop shortcut/menu paths.
- Major risk: optimistic UI hides provider failures.
- Depends on: M10.

## M12 — Search boundary

- Goal: make search behavior explicit and useful without leaking provider
  implementation.
- User-visible result: temporary search mode with query, Cancel, dense reused
  result rows, loading, no-results, and provider-boundary messaging.
- Technical scope: local/server search contract, lightweight contextual
  filters, account scope, cancellation, result mapping, privacy and error
  behavior.
- Excluded: unsupported cross-provider semantic equivalence and AI search.
- Verification: query/cancel/error tests and provider-backed manual search
  cases.
- Major risk: misleading results when local cache and server scope differ.
- Depends on: M10; mutation support is optional.

## M13 — Microsoft Graph vertical slice

- Goal: validate the provider-capability boundary with a genuinely different
  provider.
- User-visible result: connected Microsoft account can read a supported
  mailbox/thread and exposes only supported actions.
- Technical scope: Graph auth/adapter/mapping/sync investigation and
  provider-difference tests.
- Excluded: forced Gmail labels/archive/thread equivalence.
- Verification: sanctioned test tenant flow, capability tests, mapping tests,
  and all-platform smoke.
- Major risk: shared model already assumes Gmail behavior.
- Depends on: M10 and M12.

## M14 — Yandex and Mail.ru provider delivery

- Goal: add Russian-provider support using evidence-backed protocols and
  capability mapping.
- User-visible result: each accepted provider completes a separately verified
  account/read flow before adding actions.
- Technical scope: provider-by-provider auth, IMAP/SMTP or approved provider
  mechanism, mailbox/flag/thread capability mapping, localized error policy.
- Excluded: claiming identical provider behavior or shipping unverified
  configuration.
- Verification: separate approved test-account matrix for each provider,
  offline/error/capability tests, and manual platform smoke.
- Major risk: authentication policy, server variability, IMAP threading, and
  provider-specific limits.
- Depends on: M13.

## M15 — Attachments and HTML hardening

- Goal: make real message content safe and readable.
- User-visible result: bounded attachment download states and robust HTML mail
  rendering with predictable external-content behavior.
- Technical scope: WebKit component, content policy, remote-image/tracking
  protection, link handling, local file cache, eviction, failure states.
- Excluded: arbitrary attachment binary storage in SwiftData and a custom
  browser/editor.
- Verification: hostile/complex HTML fixtures, tracking/link tests,
  attachment cache/eviction tests, accessibility/manual render matrix.
- Major risk: privacy and security regressions.
- Depends on: M10.

## M16 — Offline and sync hardening

- Goal: make degraded-state behavior truthful and recoverable.
- User-visible result: useful cached reading, explicit pending actions, sync
  errors, account-unavailable state, and recovery after reconnect.
- Technical scope: cancellation, retry/backoff, reconciliation, stale cache
  policy, pending-operation recovery, storage-failure handling.
- Excluded: CloudKit and an Orris backend.
- Verification: deterministic network/auth/storage fault injection and
  cross-device provider-state reconciliation checks.
- Major risk: data loss or falsely reported completion.
- Depends on: M11, M13, M14, and M15 as applicable.

## M17 — Accessibility and platform polish

- Goal: make the shipped interaction accessible and native on each platform.
- User-visible result: robust Dynamic Type, VoiceOver, contrast, reduced
  motion, keyboard, menu, pointer, focus, resize, and window behavior.
- Technical scope: per-platform acceptance checks and only narrowly justified
  UIKit/AppKit interoperability.
- Excluded: a visual redesign without reference evidence.
- Verification: accessibility audit, keyboard/VoiceOver runs, macOS window and
  multi-compose checks, human visual acceptance.
- Major risk: late platform divergence.
- Depends on: M16.

## M18 — Security, performance, and release hardening

- Goal: establish a production release candidate.
- User-visible result: stable, secure, responsive email client within its
  validated provider scope.
- Technical scope: privacy/security review, credential lifecycle, log
  redaction, performance/instrumentation, migration/recovery, release
  checklist, supportability.
- Excluded: new providers, broad architecture rewrites, speculative features.
- Verification: threat model, build/test matrix, performance evidence,
  regression suite, release-candidate manual matrix.
- Major risk: adding last-minute scope instead of fixing evidence-backed
  release blockers.
- Depends on: M17.
