import SwiftUI

struct ShakeView: View {
    @ObservedObject var viewModel: ShakeViewModel
    @Namespace var namespace

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            if let meal = viewModel.meal {
                MealView(namespace: namespace, meal: meal, needsClosedButton: false)
                    .padding(.bottom, 80)
            }
        }
        .onAppearedOnce {
            viewModel.fetchMealDetail()
        }
        .onShake {
            viewModel.fetchMealDetail()
        }
    }
}
