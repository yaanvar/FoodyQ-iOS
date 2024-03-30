import Foundation

extension NetworkService {
    static func makeUrlSessionedService() -> Self {
        let sessionFetcher = URLSession(
            configuration: .default,
            delegate: nil,
            delegateQueue: .main
        ).fetchRequest

        return Self(
            baseURL: URLFactory.applicationAPI,
            dataFetcher: DataFetcher(fetch: sessionFetcher)
        )
    }
}
