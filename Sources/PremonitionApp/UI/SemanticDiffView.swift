import PremonitionCore
import SwiftUI

struct SemanticDiffView: View {
    let presentation: DiffPresentation

    var body: some View {
        VStack(spacing: 0) {
            diffHeader
            Divider()
            ScrollView([.vertical, .horizontal]) {
                if presentation.isSummarized {
                    summary
                } else {
                    LazyVStack(alignment: .leading, spacing: 0) {
                        ForEach(Array(presentation.lines.enumerated()), id: \.offset) { _, line in
                            SemanticDiffLine(line: line)
                        }
                    }
                    .textSelection(.enabled)
                }
            }
            .frame(maxHeight: PremonitionDesign.diffMaximumHeight)
            .accessibilityLabel(Strings.patchPreview)
        }
        .background(PremonitionDesign.ColorRole.diffSurface)
        .clipShape(RoundedRectangle(cornerRadius: PremonitionDesign.Shape.section, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: PremonitionDesign.Shape.section, style: .continuous)
                .stroke(PremonitionDesign.ColorRole.outline, lineWidth: 1)
        }
    }

    private var diffHeader: some View {
        HStack(spacing: PremonitionDesign.Space.compact) {
            Image(systemName: "chevron.left.forwardslash.chevron.right")
                .foregroundStyle(.secondary)
                .accessibilityHidden(true)
            Text(presentation.primaryFile ?? Strings.patchPreview)
                .font(.caption.monospaced())
                .lineLimit(1)
                .truncationMode(.middle)
            Spacer()
            Text(presentation.changeSummary)
                .font(.caption.monospacedDigit())
                .accessibilityLabel(presentation.accessibleChangeSummary)
        }
        .padding(.horizontal, PremonitionDesign.Space.regular)
        .padding(.vertical, PremonitionDesign.Space.compact)
    }

    private var summary: some View {
        VStack(alignment: .leading, spacing: PremonitionDesign.Space.compact) {
            ForEach(presentation.files, id: \.path) { file in
                HStack {
                    Text(file.path).lineLimit(1).truncationMode(.middle)
                    Spacer()
                    Text(file.changeSummary).monospacedDigit()
                }
            }
            Text(Strings.largePatch).foregroundStyle(.secondary)
        }
        .font(.system(size: 11, design: .monospaced))
        .padding(PremonitionDesign.Space.regular)
        .textSelection(.enabled)
    }
}

private struct SemanticDiffLine: View {
    let line: DiffLinePresentation

    var body: some View {
        HStack(spacing: PremonitionDesign.Space.tight) {
            Rectangle().fill(gutter).frame(width: 2)
            Text(line.text.isEmpty ? " " : line.text)
                .font(.system(size: 11, design: .monospaced))
                .foregroundStyle(line.kind == .context ? .secondary : .primary)
                .fixedSize(horizontal: true, vertical: false)
        }
        .padding(.vertical, 1)
        .padding(.trailing, PremonitionDesign.Space.regular)
        .background(background)
        .accessibilityLabel(line.accessibilityDescription)
    }

    private var background: Color {
        switch line.kind {
        case .added: Color(nsColor: .systemGreen).opacity(0.12)
        case .removed: Color(nsColor: .systemRed).opacity(0.12)
        case .context, .header: .clear
        }
    }

    private var gutter: Color {
        switch line.kind {
        case .added: Color(nsColor: .systemGreen)
        case .removed: Color(nsColor: .systemRed)
        case .context, .header: .clear
        }
    }
}
