import SwiftUI

struct TabBar: View {
    private var tabItems: [TabItem]
    @State var selectedTab = Tab.home.tabItem
    @State var xAxis: CGFloat = 0
    @Namespace var animation
    @EnvironmentObject var uiViewModel: UIViewModel
    private let networkService: NetworkService
    private let viewModels: TabBarViewModels
    @State var showSheet = false
    @State var showModal = false
    @State var color: Color = .teal
    @State var selectedX: CGFloat = 0
    @State var x: [CGFloat] = [0, 0, 0, 0]

    init(networkService: NetworkService) {
        self.networkService = networkService
        self.viewModels = TabBarViewModels(networkService: networkService)
        UITabBar.appearance().isHidden = true
        tabItems = Tab.allCases.map { $0.tabItem }
    }

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedTab) {
                HomeView(homeViewModel: viewModels.home, showSheet: $showSheet, showModal: $showModal)
                    .environmentObject(uiViewModel)
                    .ignoresSafeArea(.all, edges: .all)
                    .tag(tabItems[0])
                SearchView(searchViewModel: viewModels.search, showSheet: $showSheet, showModal: $showModal)
                    .ignoresSafeArea(.all, edges: .all)
                    .tag(tabItems[1])
                ShakeView(viewModel: viewModels.shake)
                    .environmentObject(uiViewModel)
                    .ignoresSafeArea(.all, edges: .all)
                    .tag(tabItems[2])
                FavoritesView(viewModel: viewModels.favourite, showSheet: $showSheet, showModal: $showModal)
                    .ignoresSafeArea(.all, edges: .all)
                    .tag(tabItems[3])
            }
            .sheet(isPresented: $showSheet) {
                SettingsView(settingsViewModel: SettingsViewModel(networkService: networkService))
            }

            customTabs
                .ignoresSafeArea(.all, edges: .bottom)
                .offset(y: uiViewModel.showTab ? 0 : 200)
                .onAppear {
                    selectedTab = tabItems.first ?? Tab.home.tabItem
                }
            
            if showModal {
                ModalView()
            }
        }
        .ignoresSafeArea(.keyboard)
    }

    var customTabs: some View {
        HStack(spacing: 0) {
            ForEach(tabItems, id: \.self) { tabItem in

                GeometryReader { reader in
                    Button(action: {
                        withAnimation(.spring()) {
                            selectedTab = tabItem
                            xAxis = reader.frame(in: .global).minX
                        }
                    }) {
                        Image(systemName: tabItem.icon)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                            .foregroundColor(selectedTab == tabItem ? tabItem.selectedColor : tabItem.color)
                            .matchedGeometryEffect(id: tabItem, in: animation)
                    }
                    .onAppear {
                        if tabItem == tabItems.first {
                            xAxis = reader.frame(in: .global).minX
                        }
                    }
                }
                .frame(width: 25, height: 30)

                if tabItem != tabItems.last {
                    Spacer(minLength: 0)
                }
            }
        }
        .frame(height: 40)
        .padding(.vertical, 10)
        .padding(.horizontal, 50)
        .background(.ultraThinMaterial)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(networkService: .mock)
            .environmentObject(UIViewModel())
    }
}

fileprivate class TabBarViewModels {
    let shake: ShakeViewModel
    let favourite: FavouritesViewModel
    let home: HomeViewModel
    let search: SearchViewModel

    init(networkService: NetworkService) {
        self.shake = ShakeViewModel(networkService: networkService)
        self.favourite = FavouritesViewModel(networkService: networkService)
        self.home = HomeViewModel(networkService: networkService)
        self.search = SearchViewModel(networkService: networkService)
    }
}
