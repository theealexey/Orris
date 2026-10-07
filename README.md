# Orris

Native multi-account email client for iPhone, iPad, and macOS, built with SwiftUI.

## Status

Early active development. The repository contains the native multi-platform
application foundation and the initial Orris visual reference board. Mail
functionality has not been implemented yet.

## Platforms

- iPhone — iOS 26+
- iPad — iPadOS 26+
- Mac — native macOS 15+

Orris is SwiftUI-first. The Mac app is a native macOS application; Mac Catalyst
is not used. The macOS minimum is the current development baseline and is not
necessarily the final shipping target.

## Current Implementation

- One native multiplatform Xcode application target supports iPhone, iPad, and
  macOS.
- Swift 6 configuration with a shared Orris scheme and Debug/Release
  configurations.
- Explicit iOS and macOS SwiftUI presentation roots.
- A DEBUG-only Orris Design Board with system-typography hierarchy, three
  representative flat mail-row specimens, and light/dark reference coverage.
- The board demonstrates native Liquid Glass for chrome where supported and a
  native material fallback for macOS versions below 26; mail rows remain
  non-glass.

There is no Inbox or production navigation yet. Accounts, authentication,
provider connections, mail reading and sending, search, sync, and persistence
are not implemented.

## Product Direction

Orris is planned as an independent, multi-account, multi-provider email client
for Apple platforms. Initial provider targets are:

- Gmail
- Microsoft Outlook / Microsoft 365
- Yandex Mail
- Mail.ru

These integrations are planned, not implemented. iCloud Mail and generic
IMAP/SMTP are future possibilities, not current commitments.

## Design Principles

- Content over chrome, with dense, flat mail lists.
- A clear sender / subject / preview hierarchy and fast triage.
- Restrained contextual surfaces and minimal branding.
- Native Apple interaction, adapted for each platform.
- Liquid Glass primarily for application chrome, not mail content.
- Equal light and dark appearance quality.

## Architecture Direction

The following is the intended dependency direction, not a claim that these
layers already exist:

```text
Presentation
    ↓
ViewModel
    ↓
Use Case
    ↓
Repository Contract
    ↓
Infrastructure / Persistence
```

Domain should remain framework- and provider-independent. Presentation should
not depend on provider DTOs, network internals, SwiftData records, Keychain
implementation, or provider tokens. SwiftData is intended for local
cache/persistence; remote providers remain authoritative for mail state.
Secrets belong in Keychain. Provider-specific actions and semantics remain
capability-aware rather than being flattened into a false common model.

## Technology

- Swift 6 and SwiftUI
- Xcode 26+
- Structured concurrency as the implementation direction
- SwiftData planned for local cache and persistence

## Development

Active integration branch: `develop/0.1.0`.

Work is organized on task branches with supplied ORR ticket identifiers,
verified before integration, and fast-forward integrated when accepted.
Completed local task branches are removed. `main` and `v<version>` tags are
reserved for explicitly approved releases.
