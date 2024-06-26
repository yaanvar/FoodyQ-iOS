import Foundation

final class MealViewModel: ObservableObject {
    @Published var isFavourite: Bool {
      didSet {
          if isFavourite {
              storage.addToFavourite(meal.id)
          } else {
              storage.deleteFavouriteFoodsIds(meal.id)
          }
      }
    }
    public let meal: Meal
    private var storage: FavouritesIdsStorage

    init(meal: Meal, storage: FavouritesIdsStorage = .init(storage: PersistentStorage(userDefaults: .standard))) {
        self.meal = meal
        self.storage = storage
        self.isFavourite = storage.isFavourite(meal.id)
    }
}
