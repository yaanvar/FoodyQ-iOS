import SwiftUI

struct TabItem: Identifiable, Hashable, Equatable {
    let id = UUID()
    var name: String
    var icon: String
    var color: Color
    var selectedColor: Color
    var selection: Tab
}

enum Tab: String, Equatable {
    case home = "Home"
    case search = "Search"
    case shake = "Shake"
    case favorites = "Favorites"
}

enum NavigationTitle: String {
    case home = "FoodyQ"
    case search = "Search"
    case favourites = "Favourites"
}

extension Tab {
    var tabItem: TabItem {
        TabItem(name: name, icon: icon.rawValue, color: color, selectedColor: selectedColor, selection: selection)
    }

    private var name: String {
        self.rawValue
    }

    private var icon: Icons {
        switch self {
        case .home:
            return Icons.home
        case .search:
            return Icons.magnifyingglass
        case .shake:
            return Icons.shake
        case .favorites:
            return Icons.heart
        }
    }

    private var selectedColor: Color {
        Color(.systemTeal)
    }

    private var color: Color {
        Color("tabbaritem")
    }

    private var selection: Tab {
        self
    }
}

extension Tab: CaseIterable {

}
