import SwiftUI

public enum WatchSize: CaseIterable {
    case mm38
    case mm40
    case mm42
    case mm44

    var label: String {
        switch self {
        case .mm38: return "38mm"
        case .mm40: return "40mm"
        case .mm42: return "42mm"
        case .mm44: return "44mm"
        }
    }

    var backgroundImage: Image {
        switch self {
        case .mm38: return Image(uiImage: #imageLiteral(resourceName: "38mm.png"))
        case .mm40: return Image(uiImage: #imageLiteral(resourceName: "40mm.png"))
        case .mm42: return Image(uiImage: #imageLiteral(resourceName: "42mm.png"))
        case .mm44: return Image(uiImage: #imageLiteral(resourceName: "44mm.png"))
        }
    }

    var backgroundImageDimensions : CGSize {
        switch self {
        case .mm38: return CGSize(width: 216, height: 237)
        case .mm40: return CGSize(width: 231, height: 254)
        case .mm42: return CGSize(width: 236, height: 262)
        case .mm44: return CGSize(width: 253, height: 280)
        }
    }

    var statusBarHeight: CGFloat {
        switch self {
        case .mm38: return 19
        case .mm42: return 21
        case .mm40: return 28
        case .mm44: return 31
        }
    }

    var statusBarFontSize: CGFloat {
        switch self {
        case .mm38: return 14
        case .mm42: return 14
        case .mm40: return 16
        case .mm44: return 16
        }
    }

    var safeAreaMargin: CGFloat {
        switch self {
        case .mm38, .mm42: return 1
        case .mm40: return 8.5
        case .mm44: return 9.5
        }
    }

    var contentOffset: CGFloat {
        switch self {
        case .mm38, .mm42: return 33.5
        case .mm40, .mm44: return 28.5
        }
    }

    var dimensions: CGSize {
        switch self {
        case .mm38: return CGSize(width: 136, height: 170)
        case .mm40: return CGSize(width: 162, height: 197)
        case .mm42: return CGSize(width: 156, height: 195)
        case .mm44: return CGSize(width: 184, height: 224)
        }
    }
}

struct Watch<Content: View>: View {
    let content: Content
    let size: WatchSize
    let tintColor: Color
    let title: String
    let time: String

    init(
        size: WatchSize,
        tintColor: Color,
        title: String,
        time: String,
        @ViewBuilder content: () -> Content
    ) {
        self.size = size
        self.tintColor = tintColor
        self.title = title
        self.time = time
        self.content = content()
    }

    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                VStack(spacing: 0) {
                    statusBar
                    Color.black
                        .overlay(content)
                }
                    .frame(width: contentFrame.width, height: contentFrame.height)
                    .background(Color.black)
                    .offset(contentOffset)
                size.backgroundImage
                    .resizable()

            }
            .frame(width: watchFrame.width, height: watchFrame.height)
            Text(size.label)
        }.foregroundColor(.white)
    }

    private var statusBar: some View {
        HStack() {
            Text(title)
                .foregroundColor(tintColor)
            Spacer()
            Text(time).layoutPriority(1)
        }
        .font(.system(size: size.statusBarFontSize, weight: .medium, design: .rounded))
        .padding(.horizontal, size.safeAreaMargin)
        .frame(height: size.statusBarHeight)
    }

    private var contentFrame: CGSize {
        CGSize(width: size.dimensions.width, height: size.dimensions.height)
    }

    private var contentOffset: CGSize {
        CGSize(width: size.contentOffset, height: size.contentOffset)
    }

    private var watchFrame: CGSize {
        CGSize(width: size.backgroundImageDimensions.width, height: size.backgroundImageDimensions.height)
    }
}

public struct WatchPreviews<Content: View>: View {
    private let content: Content
    private let models: Set<WatchSize>
    private let tintColor: Color
    private let title: String
    private let time: String

    private let oldModels = Set<WatchSize>([.mm38, .mm42])
    private let newModels = Set<WatchSize>([.mm40, .mm44])

    public init(
        models: Set<WatchSize> = .init(WatchSize.allCases),
        tintColor: Color = .gray,
        title: String = "Your Title",
        time: String = "9:41",
        @ViewBuilder content: () -> Content
    ) {
        self.models = models
        self.tintColor = tintColor
        self.title = title
        self.time = time
        self.content = content()
    }

    public var body: some View {
        VStack() {
            HStack(alignment: .bottom) {
                renderWatch(size: .mm38)
                renderWatch(size: .mm42)
            }
            renderDivider()
            HStack(alignment: .bottom) {
                renderWatch(size: .mm40)
                renderWatch(size: .mm44)
            }
        }
    }

    private func renderDivider() -> some View {
        let includesOldModel = !models.intersection(oldModels).isEmpty
        let includesNewModel = !models.intersection(newModels).isEmpty

        return Divider()
            .given(that: includesNewModel && includesOldModel)
    }

    private func renderWatch(size: WatchSize) -> some View {
        Watch(size: size, tintColor: tintColor, title: title, time: time) { content }
            .given(that: models.contains(size))
    }
}

struct If: ViewModifier {
    let condition: Bool

    func body(content: Content) -> some View {
        Group {
            if condition {
                content
            } else {
                EmptyView()
            }
        }
    }
}
private extension View {
    func given(that condition: Bool) -> some View {
        modifier(If(condition: condition))
    }
}
