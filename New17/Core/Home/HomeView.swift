//
//  HomeView.swift
//  Style17
//
//  Created by Benji Loya on 01.02.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                FlightView()
            }
            .navigationTitle("Home")
            .scrollIndicators(.hidden)
            .statusBarHidden(true)
       //     .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
