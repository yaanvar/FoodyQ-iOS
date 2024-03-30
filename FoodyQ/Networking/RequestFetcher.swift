import Foundation

struct RequestFetcher<DataType> {
    var fetch: (URLRequest) async throws -> DataType

    func callAsFunction(_ request: URLRequest) async throws -> DataType {
        try await fetch(request)
    }
}
