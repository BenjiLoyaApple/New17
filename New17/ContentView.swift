//
//  ContentView.swift
//  New17
//
//  Created by Benji Loya on 01.02.2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_status") var logStatus: Bool = false
    var body: some View {
     ///    Redirecting User Based on Log Status
        if logStatus {
        //    MainView()
            AnimationTabBar()
        } else {
            HomeOnBoard()
        }
    }
}

#Preview {
    ContentView()
}
