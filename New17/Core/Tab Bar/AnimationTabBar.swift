//
//  AnimationTabBar.swift
//  Project17
//
//  Created by Benji Loya on 30.01.2024.
//

import SwiftUI

/// Tab"s
enum Tab: String, CaseIterable {
    case home = "bag"
    case search = "magnifyingglass"
    case apps = "square.3.layers.3d"
    case profile = "person.circle"
    
    var title: String {
        switch self {
        case . home:
            return "Home"
        case . search:
            return "Search"
        case . apps:
            return "Apps"
        case . profile:
            return "Profile"
        }
    }
}

/// Animated SF Tab Model
struct AnimatedTab: Identifiable {
    var id: UUID = .init()
    var tab: Tab
    var isAnimating: Bool?
}
                        
                        
                        
/// Tab Bar View
struct AnimationTabBar: View {
    @State private var activeTab: Tab = .home
    @State private var allTabs: [AnimatedTab] = Tab.allCases.compactMap{ tab -> AnimatedTab? in
        return .init(tab: tab)
    }
    
    /// Bounce Property
    @State private var bouncesDown: Bool = true
    
    @State private var tabState: Visibility = .visible
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab) {
                /// Tab Views
                HomeView()
                    .setUpTab(.home)
                
                NavigationStack {
                    VStack {
                        
                    }
                    .navigationTitle(Tab.search.title)
                }
                .setUpTab(.search)
                
                NavigationStack {
                    VStack {
                        
                    }
                    .navigationTitle(Tab.apps.title)
                }
                .setUpTab(.apps)
                
                
                NavigationStack {
                    VStack {
                        
                    }
                    .navigationTitle(Tab.profile.title)
                }
                .setUpTab(.profile)
                
                
                
            }
            .zIndex(0)
            
            /// Just for Demo
//            Picker("", selection: $bouncesDown) {
//                Text("Bounce Down")
//                    .tag(true)
//                
//                Text("Bounce Up")
//                    .tag(false)
//            }
//            .pickerStyle(.segmented)
//            .padding()
            
            
            CustomTabBar()
        }
    }
    
    
    /// Custom Tab Bar
    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach($allTabs) { $animatedTab in
                let tab = animatedTab.tab
                
                VStack(spacing: 4) {
                    Image(systemName: tab.rawValue)
                        .font(.title2)
                        .symbolEffect(
                        //    bouncesDown ?  .bounce.down.byLayer :
                            .bounce.up.byLayer, value: animatedTab.isAnimating)
                    
//                    Text(tab.title)
//                        .font(.caption2)
//                        .textScale(.secondary)
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(activeTab == tab ? Color.primary : Color.gray.opacity(0.8))
                .padding(.top, 15)
                .padding(.bottom, 10)
                .contentShape(.rect)
                // You Can Also Use Button, If you Choose to
                .onTapGesture {
                    withAnimation(.bouncy, completionCriteria: .logicallyComplete, {
                        activeTab = tab
                        animatedTab.isAnimating = true
                    }, completion: {
                        var trasnaction = Transaction()
                        trasnaction.disablesAnimations = true
                        withTransaction(trasnaction) {
                            animatedTab.isAnimating = nil
                        }
                    })
                }
            }
        }
        .background(.bar)
    }
}

#Preview {
    AnimationTabBar()
}

extension View {
    @ViewBuilder
    func setUpTab(_ tab: Tab) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tag(tab)
            .toolbar(.hidden, for: .tabBar)
    }
}
