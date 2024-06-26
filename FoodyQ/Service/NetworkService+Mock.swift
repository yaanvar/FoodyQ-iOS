import Foundation

extension NetworkService {
    static var mock: Self {
        NetworkService(
            randomMeal: .mock { Meals.singleDummyData },
            search: .mock { _ in Meals.dummyData1 },
            latestMeals: .mock { Meals.dummyData2 },
            setRandomMeals: .mock { Meals.dummyData1 },
            mealByID: .mock { _ in Meals.singleDummyData }
        )
    }
}
