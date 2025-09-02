//
//  ContentView.swift
//  Income and Expense Tracker
//
//  Created by Muhammad Muzamal on 30/08/2025.
//

import SwiftUI


enum Tabs: Int, CaseIterable {
    case home, settings
}

class TapCoordinates: ObservableObject {
    @Published var path: [String] = []
    
    func push(_ navigateTo: [String]) {
        path.append(contentsOf: navigateTo)
    }
}


class AppCoordinator: ObservableObject {
 
    
    @Published var selectedTab: Tabs = .home
    var tabCoordinators: [TapCoordinates] = []
    
    
    init() {
        for _ in Tabs.allCases {
            tabCoordinators.append(TapCoordinates())
        }
    }
    
    func selectTab(_ tab: Tabs) {
        self.selectedTab = tab
    }
    
    func selectTab(_ tab: Tabs, navigateTo: [String]) {
        self.selectTab(tab)
        tabCoordinators[tab.rawValue].push(navigateTo)
    }
}

struct ContentView: View {
    @StateObject var appCoordinator = AppCoordinator()
    
    var body: some View {
        
        TabView(selection: $appCoordinator.selectedTab) {
            Tab("Home", systemImage: "tray.and.arrow.down.fill", value: .home) {
                NavigationStack(path: $appCoordinator.tabCoordinators[Tabs.home.rawValue].path) {
                    VStack {
                        Text("Home")
                        Button("Go to Settings/1/2/3") {
                            appCoordinator.selectTab(.settings, navigateTo: ["1", "2","3"])
                        }
                    }
                    .navigationDestination(for: String.self) { name in
                        Text(name)
                    }
                }
            }

            
            Tab("Setting", systemImage: "tray.and.arrow.up.fill", value: .settings) {
                NavigationStack(path: $appCoordinator.tabCoordinators[Tabs.settings.rawValue].path) {
                   
                    VStack {
                        Text("Setting")
                        Button("Go to Home/Test") {
                            appCoordinator.selectTab(.home, navigateTo: ["Test"])
                        }
                    }
                        .navigationDestination(for: String.self) { name in
                            Text(name)
                        }
                }
            }

        }
    }
}

#Preview {
    ContentView()
}
