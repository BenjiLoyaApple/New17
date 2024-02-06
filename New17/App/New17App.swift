//
//  New17App.swift
//  New17
//
//  Created by Benji Loya on 01.02.2024.
//

import SwiftUI
import TipKit

@main
struct New17App: App {
    var body: some Scene {
        WindowGroup {
            RootView {
                HeroWrapper {
                    ContentView()
                        .task {
                            // Configure and load your tips at app launch.
                            try? Tips.configure([
                                //  .displayFrequency(.immediate),
                                .datastoreLocation(.applicationDefault)
                            ])
                        }
                }
            }
        }
    }
}
