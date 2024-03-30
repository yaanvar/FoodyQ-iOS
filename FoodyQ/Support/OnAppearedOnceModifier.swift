import SwiftUI

extension View {
    func onAppearedOnce(_ action: @escaping () -> ()) -> some View {
        self.modifier(OnAppearedModifier(action: action))
    }
}

private struct OnAppearedModifier: ViewModifier {
    let action: () -> ()
    @State private var appearedOnce = true

    func body(content: Content) -> some View {
        content
            .onAppear {
                if appearedOnce {
                    appearedOnce = false
                    action()
                }
            }
    }
}
