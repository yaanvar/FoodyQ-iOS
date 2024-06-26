import Foundation

final class FavouritesViewModel: ObservableObject {
    @Published private(set) var favouriteMeals: [Meal] = []
    @Published var selectedMeal: Meal? = nil


    private let storage = FavouritesIdsStorage(storage: PersistentStorage(userDefaults: .standard))
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func fetchFavouritesMeals() {
        Task {
            await fetchFavourites()
        }
    }

    @MainActor
    private func fetchFavourites() async {
        let mealIds = storage.getFavouriteFoodsIds()
        var favouriteTmpMeals: [Meal] = []
        for mealId in mealIds {
            do {
                if let favouriteMealFirst = try await networkService.mealByID(mealId).meals.first {
                    favouriteTmpMeals.append(favouriteMealFirst)
                }
            } catch {
                continue
            }
        }
        favouriteMeals = favouriteTmpMeals.reversed()
    }
}
