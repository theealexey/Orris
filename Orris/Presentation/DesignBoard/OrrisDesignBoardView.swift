#if DEBUG
import SwiftUI

struct OrrisDesignBoardView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Orris")
                        .font(.title.weight(.semibold))
                    Text("Design Board")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 16) {
                    BoardSectionHeading(title: "Typography / Hierarchy")
                    BoardTypographySpecimen()
                }

                VStack(alignment: .leading, spacing: 8) {
                    BoardSectionHeading(title: "Mail List Density")
                    BoardDensitySpecimen()
                }

                VStack(alignment: .leading, spacing: 16) {
                    BoardSectionHeading(title: "Application Chrome")
                    BoardChromeSpecimen()
                }

                VStack(alignment: .leading, spacing: 16) {
                    BoardSectionHeading(title: "Light / Dark Appearance")
                    BoardAppearanceSpecimen()
                }

                VStack(alignment: .leading, spacing: 12) {
                    BoardSectionHeading(title: "Rhythm / Constraints")
                    Text("4 · 8 · 12 · 16 · 24 · 32")
                        .font(.subheadline)
                        .monospacedDigit()
                    Text("Dense rows · Flat content · Glass = chrome\nSystem type · Semantic color")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .frame(maxWidth: 760, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.vertical, 24)
            .frame(maxWidth: .infinity)
        }
        .clipped()
    }
}

private struct BoardSectionHeading: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.caption.weight(.semibold))
            .foregroundStyle(.secondary)
            .accessibilityAddTraits(.isHeader)
    }
}

private struct BoardTypographySpecimen: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .firstTextBaseline, spacing: 12) {
                Text("Sender Name")
                    .font(.subheadline.weight(.semibold))
                Spacer(minLength: 8)
                Text("10:42")
                    .font(.caption)
                    .monospacedDigit()
                    .foregroundStyle(.secondary)
                    .fixedSize()
            }
            Text("Subject line")
                .font(.subheadline)
            Text("Preview text")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}

// Immutable board fixtures, not production mail models.
private struct BoardMailSample: Sendable {
    let initials: String
    let sender: String
    let subject: String
    let preview: String
    let time: String
    let isUnread: Bool
    let hasAttachment: Bool
}

private enum BoardSamples {
    static let unread = BoardMailSample(
        initials: "SN", sender: "Studio Notes", subject: "A few ideas for Friday",
        preview: "The latest notes are ready for a quick review.", time: "10:42",
        isUnread: true, hasAttachment: false
    )
    static let read = BoardMailSample(
        initials: "FT", sender: "Field Team", subject: "Next week's outline",
        preview: "Here is the plan we discussed this morning.", time: "09:18",
        isUnread: false, hasAttachment: false
    )
    static let attachment = BoardMailSample(
        initials: "PA", sender: "Paper Archive", subject: "Reference pages",
        preview: "The document is attached for your records.", time: "Yesterday",
        isUnread: false, hasAttachment: true
    )
}

private struct BoardDensitySpecimen: View {
    var body: some View {
        VStack(spacing: 0) {
            BoardMailRow(sample: BoardSamples.unread)
            Divider().padding(.leading, 48)
            BoardMailRow(sample: BoardSamples.read)
            Divider().padding(.leading, 48)
            BoardMailRow(sample: BoardSamples.attachment)
        }
    }
}

private struct BoardMailRow: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    let sample: BoardMailSample

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text(sample.initials)
                .font(.caption.weight(.medium))
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                .frame(width: 36, height: 36)
                .background(.quaternary, in: .circle)
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 3) {
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    HStack(spacing: 6) {
                        if sample.isUnread {
                            Circle()
                                .fill(.primary)
                                .frame(width: 6, height: 6)
                                .accessibilityHidden(true)
                        }
                        Text(sample.sender)
                            .font(.subheadline)
                            .fontWeight(sample.isUnread ? .semibold : .medium)
                            .lineLimit(dynamicTypeSize.isAccessibilitySize ? nil : 1)
                    }
                    .layoutPriority(1)
                    Spacer(minLength: 4)
                    Text(sample.time)
                        .font(.caption)
                        .monospacedDigit()
                        .foregroundStyle(.secondary)
                        .fixedSize()
                }
                Text(sample.subject)
                    .font(.subheadline)
                    .lineLimit(dynamicTypeSize.isAccessibilitySize ? nil : 1)
                Text(sample.preview)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(dynamicTypeSize.isAccessibilitySize ? nil : 1)
                if sample.hasAttachment {
                    Label("1 attachment", systemImage: "paperclip")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(.vertical, 10)
        .accessibilityElement(children: .combine)
        .accessibilityValue(sample.isUnread ? "Unread" : "Read")
    }
}

private struct BoardChromeSpecimen: View {
    var body: some View {
        if #available(iOS 26.0, macOS 26.0, *) {
            GlassEffectContainer(spacing: 8) {
                VStack(alignment: .leading, spacing: 12) {
                    BoardSearchChrome()
                        .glassEffect(.regular, in: .capsule)
                    BoardActionChrome()
                        .glassEffect(.regular, in: .capsule)
                }
            }
        } else {
            // Only the chrome specimens need material on macOS 15–25.
            VStack(alignment: .leading, spacing: 12) {
                BoardSearchChrome()
                    .background(.regularMaterial, in: .capsule)
                BoardActionChrome()
                    .background(.regularMaterial, in: .capsule)
            }
        }
    }
}

private struct BoardSearchChrome: View {
    var body: some View {
        Label("Search mail", systemImage: "magnifyingglass")
            .font(.subheadline)
            .foregroundStyle(.secondary)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
    }
}

private struct BoardActionChrome: View {
    var body: some View {
        HStack(spacing: 28) {
            Label("Mailboxes", systemImage: "tray")
            Label("Filter", systemImage: "line.3.horizontal.decrease")
            Label("Compose", systemImage: "square.and.pencil")
        }
        .labelStyle(.iconOnly)
        .font(.body)
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }
}

private struct BoardAppearanceSpecimen: View {
    var body: some View {
        ViewThatFits(in: .horizontal) {
            HStack(alignment: .top, spacing: 16) {
                BoardAppearancePanel(title: "Light", scheme: .light)
                    .frame(minWidth: 280)
                BoardAppearancePanel(title: "Dark", scheme: .dark)
                    .frame(minWidth: 280)
            }
            VStack(spacing: 16) {
                BoardAppearancePanel(title: "Light", scheme: .light)
                BoardAppearancePanel(title: "Dark", scheme: .dark)
            }
        }
    }
}

private struct BoardAppearancePanel: View {
    let title: String
    let scheme: ColorScheme

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.subheadline.weight(.semibold))
            BoardMailRow(sample: BoardSamples.unread)
            Divider()
            BoardChromeSpecimen()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(.background)
        .border(.quaternary)
        .environment(\.colorScheme, scheme)
    }
}
#endif
