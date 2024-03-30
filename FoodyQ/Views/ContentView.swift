import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    private var networkService: NetworkService

    init() {
        networkService = NetworkService.makeUrlSessionedService()
    }

    var body: some View {
        ZStack {
            TabBar(networkService: networkService)
                .environmentObject(UIViewModel())

            SplashScreen()
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
