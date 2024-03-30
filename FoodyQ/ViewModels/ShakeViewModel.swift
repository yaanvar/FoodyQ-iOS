import Foundation

final class ShakeViewModel: ObservableObject {

    @Published private(set) var meal: Meal?

    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func fetchMealDetail() {
        Task {
            await fetchMeal()
        }
    }

    @MainActor
    private func fetchMeal() async {
        do {
            let meals = try await networkService.randomMeal().meals
            guard let meal = meals.first else { return }
            self.meal = meal
        } catch {
            return
        }
    }
}
