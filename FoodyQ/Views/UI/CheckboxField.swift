import SwiftUI

struct CheckboxField: View {
    let size: CGFloat = 20
    let color: Color = Color(.systemTeal)
    @Binding var isMarked: Bool

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: self.isMarked ? "checkmark.square" : "square")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: self.size, height: self.size)
        }.foregroundColor(self.color)
    }
}
