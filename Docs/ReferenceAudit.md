# Orris — Notion Mail Reference Audit

Status: Phase 0 finalized evidence ledger
Audit date: 2026-09-12
Scope: Notion Mail is a reference for selected interaction principles only. It
is not an Orris integration target, provider, identity system, brand, or
content source.

## 1. Evidence rules

| Category | Meaning |
| --- | --- |
| VERIFIED_DOCS | Directly supported by a listed first-party Notion help source. It does not prove visual composition. |
| VERIFIED_EXTERNAL_MOBBIN | Independently inspected in a connected Mobbin environment and supplied to this task. Codex did not directly access these captures. |
| INFERRED | An Orris product/design conclusion drawn from verified evidence. It is not a claim about Notion Mail. |
| UNKNOWN | No adequate evidence is available; it must not be guessed or designed as if observed. |

The supplied external Mobbin evidence closes the earlier visual-reference gap
only for the listed patterns. Exact pixel measurements, motion, platform
coverage, and unlisted states remain UNKNOWN.

## 2. Sources and availability

| Source | Availability | Evidence class | Use |
| --- | --- | --- | --- |
| Mobbin app landing page: https://mobbin.com/apps/notion-mail-ios-1542f936-6677-4eae-890c-cbce751475a1 | Direct access unavailable without login; no account was used or requested. | None | Records the direct-access limitation only. |
| Supplied Mobbin reference 1: https://mobbin.com/screens/78f01a73-c90d-4830-a690-dc1fb9151650 | Evidence supplied by task author. | VERIFIED_EXTERNAL_MOBBIN | Inbox hierarchy and floating mobile chrome. |
| Supplied Mobbin reference 2: https://mobbin.com/screens/7a35d0c0-4ec2-4289-b21b-b7e4553a8cc2 | Evidence supplied by task author. | VERIFIED_EXTERNAL_MOBBIN | Labels list view. |
| Supplied Mobbin reference 3: https://mobbin.com/screens/42aaf818-ba8a-4444-b1ef-72507c77ee05 | Evidence supplied by task author. | VERIFIED_EXTERNAL_MOBBIN | Search mode. |
| Supplied Mobbin reference 4: https://mobbin.com/screens/8d860f3b-3967-4e29-978b-f4a386b11464 | Evidence supplied by task author. | VERIFIED_EXTERNAL_MOBBIN | Account switcher. |
| Supplied Mobbin reference 5: https://mobbin.com/screens/67e4d5f7-d923-411c-bf3d-4cf5bc44f0b6 | Evidence supplied by task author. | VERIFIED_EXTERNAL_MOBBIN | Thread/detail actions. |
| Supplied Mobbin reference 6: https://mobbin.com/screens/e94a065f-81e5-49cb-955f-3f6934f24ad2 | Evidence supplied by task author. | VERIFIED_EXTERNAL_MOBBIN | Mobile compose hierarchy. |
| Supplied Mobbin reference 7: https://mobbin.com/screens/1eb1c324-5a3e-429c-91a6-ee84d249599e | Evidence supplied by task author. | VERIFIED_EXTERNAL_MOBBIN | Schedule-send surface. |
| Supplied Mobbin reference 13: https://mobbin.com/screens/fd69e684-3af5-41fe-a460-3db38bf64f58 | Evidence supplied by task author. | VERIFIED_EXTERNAL_MOBBIN | Sent-row adaptation. |
| Supplied external references 8–12 | Evidence supplied by task author; no direct capture URL was provided. | VERIFIED_EXTERNAL_MOBBIN | Swipe triage, Undo, filter, multi-selection, light/dark. |
| Notion Mail overview: https://www.notion.com/help/get-started-with-notion-mail | Available. | VERIFIED_DOCS | Product scope, published platforms, Gmail direction. |
| Notion Mail settings: https://www.notion.com/help/notion-mail-settings | Available. | VERIFIED_DOCS | Settings categories, theme, thread-opening and account dependencies. |
| Notion Mail keyboard shortcuts: https://www.notion.com/help/notion-mail-keyboard-shortcuts | Available. | VERIFIED_DOCS | Published inbox, compose, and thread actions. |
| Notion Mail views, groups and filters: https://www.notion.com/help/views-groups-filters-and-properties | Available. | VERIFIED_DOCS | Filters, labels, multiple selection, Gmail-synced semantics. |

## 3. Verified external screen and pattern inventory

Codex directly observed zero Mobbin screens. The following are nevertheless
VERIFIED_EXTERNAL_MOBBIN because the task supplies independently inspected
findings.

| Ref | Surface or state | Verified observation |
| --- | --- | --- |
| R1 | Inbox | Dense, flat rows; leading sender/service identity; unread indicator; trailing timestamp; subject stronger than preview; restrained separators; content-dominant chrome; upper account/avatar control; lower navigation/menu, central search, and compose controls float above content. |
| R2 | Labels | A label/category selection sits near the top; it remains another dense mail-list view with consistent row language. |
| R3 | Search | Search replaces normal inbox header/navigation temporarily; a prominent top query field and Cancel action frame result rows that reuse the normal dense row. |
| R4 | Account switcher | A bottom sheet shows selected current mail address, Settings, and Connect another address. Notion-account switching is separate. |
| R5 | Thread/detail | Minimal detail: subject, sender/recipient relationship, then body; contextual menu and lower reply/forward/archive/destructive action area. Observed menu actions include labels, category, unread, trash, reminder, spam, and phishing. |
| R6 | Compose | Focused full-screen mobile compose with close, attachment, schedule, Send, From, To, Cc, Bcc, subject, body, keyboard-adjacent formatting controls, and media/attachments. |
| R7 | Schedule send | Contextual bottom sheet with fast dates and a custom date/time path. |
| R8 | Swipe triage | Swipe exposes strong contextual triage actions close to inbox content. |
| R9 | Undo | Temporary bottom Undo feedback follows selected trash, spam, and send actions. |
| R10 | Filter | Lightweight contextual filter offers at least All Emails and Unread Only; it is not a separate heavy screen. |
| R11 | Multi-selection | Selection changes inbox chrome, makes selected count prominent, adds circular row controls, and shows a floating contextual toolbar for read/unread, archive, trash, and label. |
| R12 | Appearance | Light and dark retain density, restrained contrast, unread hierarchy, floating controls, and minimal card usage. |
| R13 | Sent | The standard dense mail row is reused, with recipient replacing normal sender emphasis; timestamp remains trailing and subject/preview hierarchy remains consistent. |

## 4. Verified documented behavior

| ID | Behavior | Evidence |
| --- | --- | --- |
| D1 | Settings is reached from the sidebar and includes theme, thread-opening, and post-action navigation preferences. | VERIFIED_DOCS |
| D2 | Connected addresses can be connected/disconnected; disconnection asks for confirmation. | VERIFIED_DOCS |
| D3 | Views filter on message properties including read state, addresses, subject, date, and attachment presence. | VERIFIED_DOCS |
| D4 | Multiple selected messages can receive a label. | VERIFIED_DOCS |
| D5 | Published shortcuts expose open, reply, reply-all, forward, archive, spam, delete, unread, move, labels, next/previous, and undo actions. | VERIFIED_DOCS |
| D6 | Published compose shortcuts expose send, discard, Cc/Bcc, subject/recipient editing, formatting, and attachment addition. | VERIFIED_DOCS |
| D7 | Published shortcuts include account switching, search, compose, multi-selection, and mailbox navigation. | VERIFIED_DOCS |

## 5. Inbox, mailbox, and row baseline

### VERIFIED_EXTERNAL_MOBBIN

- Content dominates application chrome.
- Mail rows are dense and flat, not individual large rounded cards.
- The conceptual row hierarchy is:

~~~text
sender/service identity + unread state + timestamp
subject
preview
~~~

- Sender/service identity leads; timestamp trails.
- Subject has more visual weight than preview.
- Labels and Sent preserve the same row language, changing only the primary
  identity field where mailbox semantics require it.
- Filter remains a lightweight contextual surface.

### INFERRED Orris decision

Orris adopts this hierarchy and density, not exact geometry, copy, icons, or
materials. M3 must validate readable density, Dynamic Type, hit targets, and
localized text before treating it as final.

## 6. Search, account switching, and transient surfaces

| Pattern | Evidence | Orris decision |
| --- | --- | --- |
| Temporary search mode with top query and Cancel | VERIFIED_EXTERNAL_MOBBIN | ADAPT. Search is a mode over mail content; execution may be local, server, or hybrid according to provider capability. |
| Bottom-sheet mail account switcher with Settings and add-account action | VERIFIED_EXTERNAL_MOBBIN | ADAPT on compact touch presentation. It switches provider-connected Orris accounts only. |
| Contextual filter surface | VERIFIED_EXTERNAL_MOBBIN | ADAPT. Its available predicates are capability- and data-scope-aware. |
| Contextual action menus, sheets, and toolbars | VERIFIED_EXTERNAL_MOBBIN | ADAPT as transient action surfaces, not unnecessary navigation destinations. |
| Separate Notion-account switching | VERIFIED_EXTERNAL_MOBBIN | EXCLUDE. Orris has no Notion identity. |

## 7. Thread and mail-action baseline

### VERIFIED_EXTERNAL_MOBBIN

Thread/detail gives priority to subject, participants, and message body. It
keeps reply/forward/archive/destructive controls close to reading context and
also exposes a contextual action menu.

### INFERRED Orris decision

Orris shares an action intent, not a copied action inventory. Labels,
categories, reminder/snooze, spam, phishing reporting, archive, move, and
star are available only when the selected provider capability supports them.
Core actions must also be exposed through appropriate desktop/iPad menu,
toolbar, context-menu, and keyboard paths; no important action is swipe-only.

## 8. Compose and schedule-send baseline

### VERIFIED_EXTERNAL_MOBBIN

Mobile compose is focused and full-screen. The observed hierarchy includes
identity, addressing, subject, body, attachment/media, schedule, Send, and
formatting controls for bold, italic, underline, and strikethrough.

### INFERRED Orris decision

Orris adopts the hierarchy, not the exact editor. Future compose may begin
SwiftUI-first, but it must validate rich-text and attachment behavior before
locking itself to a trivial TextEditor-only experience. A UIKit/AppKit bridge
remains a narrow option only after a concrete production limitation is proven.

Schedule Send is PRODUCT DECISION / CAPABILITY-DEPENDENT. It is not a v1
promise: provider-native scheduling, an active-client limitation, and a future
backend reliability requirement are materially different execution models.

## 9. Gesture, selection, and Undo baseline

| Pattern | Evidence | Orris decision |
| --- | --- | --- |
| Swipe triage | VERIFIED_EXTERNAL_MOBBIN | ADAPT on touch platforms for fast execution; pair every important action with a discoverable non-gesture path. |
| Multi-selection chrome and floating contextual toolbar | VERIFIED_EXTERNAL_MOBBIN | ADAPT. Batch result reporting must support successes, failures, cancellation, and retry per selected message. |
| Temporary Undo feedback | VERIFIED_EXTERNAL_MOBBIN and VERIFIED_DOCS | ADAPT only when the provider action can be safely represented as pending/reversible. |

Conceptual future flow:

~~~text
user action → immediate UI state → pending/reversible operation
           → Undo window or provider reconciliation → truthful final outcome
~~~

This is a design/architecture constraint only; it does not create an operation
queue in Phase 0.

## 10. Light, dark, typography, density, and motion

### VERIFIED_EXTERNAL_MOBBIN

- Light and dark are first-class appearances.
- The same information hierarchy and dense flat-list direction survive both.
- Contrast remains restrained and cards remain minimal.
- Floating mobile controls remain part of the chrome layer, not content cards.

### INFERRED Orris decision

Orris uses one semantic system that adapts to appearance. Future floating
mobile search/compose/action chrome may use native Liquid Glass where the
chosen deployment target supports it. Glass is for chrome, filters,
selection/account controls, sheets/popovers, and thread actions—not every row,
body, attachment, or background. Orris must not reproduce a legacy material
appearance or custom blur/shadow approximation when native APIs are adequate.

### UNKNOWN

Exact font families, point sizes, row metrics, animation curve/duration,
haptics, accessibility behavior, and pixel values are not supplied.

## 11. Cross-platform classification

| Pattern | Class | Orris conclusion |
| --- | --- | --- |
| Provider-backed actions, pending state, Undo semantics | A — shared behavior | Share product intent and outcome semantics, not provider implementation. |
| Dense row, floating mobile chrome, bottom sheets, swipe triage, full-screen compose | B — iPhone presentation | Adapt to compact touch use; do not copy exact geometry. |
| Split layout, pointer/keyboard, drag/drop, multi-selection | C — iPad adaptation | Preserve touch ergonomics while adding discoverable non-swipe actions. |
| Sidebar/list/detail, Commands, toolbar, context menus, shortcuts, windows | D — macOS adaptation | Native SwiftUI desktop composition; do not reproduce mobile bottom-bar geometry. |
| Notion identity, Calendar, AI, workspace/pages/databases, branding/copy | E — Notion-specific and excluded | Must not enter Orris. |
| Search mode, account switcher, filters, labels, schedule, batch toolbar | F — useful concept requiring redesign | Adapt under provider capabilities and native platform conventions. |

## 12. Copy / adapt matrix

| Pattern | Reference | Classification | Orris decision | Reason |
| --- | --- | --- | --- | --- |
| Dense flat mail rows | R1, R2, R13 | ADAPT | Preserve dense flat list language. | Content-first triage, no large cards. |
| Sender/subject/preview hierarchy | R1, R13 | ADAPT | Preserve three-level hierarchy. | Fast scanning. |
| Bottom floating search/compose | R1 | ADAPT WITH NATIVE LIQUID GLASS | Reinterpret as supported native chrome. | Do not copy material/geometry. |
| Account-switch bottom sheet | R4 | ADAPT | Switch provider-connected accounts only. | Compact contextual account change. |
| Temporary search mode | R3 | ADAPT | Search over mail content with Cancel. | Avoid separate dashboard. |
| Multi-selection contextual toolbar | R11 | ADAPT | Capability-aware batch operations. | Explicit selection and close actions. |
| Undo feedback | R9 | ADAPT | Pending/reversible feedback where safe. | Immediate but truthful triage. |
| Swipe triage | R8 | ADAPT ON TOUCH PLATFORMS | Add non-gesture equivalents. | Fast touch workflow without hidden core actions. |
| Gmail labels/categories | R2, D3 | CAPABILITY-DEPENDENT | Map only when provider supports them. | Gmail semantics are not universal. |
| Schedule Send | R7 | PRODUCT DECISION / CAPABILITY-DEPENDENT | Defer guarantee decision. | Reliability depends on provider/client/backend model. |
| Reminder/Snooze | R5 | PRODUCT DECISION | Do not promise universally. | Provider semantics differ. |
| Notion-account switching | R4 | EXCLUDE | No Notion account model. | Orris independence. |
| Notion shutdown banner | R1 | EXCLUDE | Never reproduce. | Notion-specific copy/state. |
| Notion branding/logo/copy | All references | EXCLUDE | Independent brand later. | No Notion IP dependency. |
| Exact pixel geometry/material | All references | DO NOT COPY | Implement Orris-specific native layouts. | Reference, not clone. |

## 13. Notion-specific elements to exclude

- Notion account, workspace, Calendar, database/page, AI, automation, brand,
  logo, proprietary illustration, and product copy.
- Gmail-only labels/categories, archive, and thread semantics as a universal
  mail model.
- Notion meeting/scheduling and shutdown-specific product behavior.

The reusable principle is always stated separately from the Notion mechanism.

## 14. Remaining UNKNOWN items

The supplied evidence does not verify:

- onboarding, provider authentication, error, expiry, reconnect, and removal
  flows;
- loading, pagination, refresh, offline, storage failure, sync failure, and
  attachment-download states;
- pull-to-refresh, long press, context-menu composition, haptics, exact focus,
  accessibility, animation, or transition details;
- actual iPad and native macOS captures;
- attachment rendering, remote-image handling, HTML policy, quoted content,
  or draft autosave/retry;
- the exact provider search boundary, multi-provider account policy, and
  schedule-send execution model;
- exact visual tokens, pixel geometry, dimensions, and font metrics.

These are validation work for later vertical milestones, not gaps to fill by
guessing.
