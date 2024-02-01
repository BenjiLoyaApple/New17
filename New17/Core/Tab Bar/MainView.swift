//
//  MainView.swift
//
//  Created by Benji Loya
//

import SwiftUI


struct MainView: View {
    
    var body: some View {
        VStack {
            Text("Main View")
                .font(.title.bold())
        }
            .accentColor(.primary)
        /*
        TabView(selection: $currentTab) {
            NotesView(currentTab: $currentTab)
                .tag("Notes")
                .tabItem {
                    Image(systemName: "note")
                    Text("Notes")
                }
            
            CategoriesView()
                .tag("Categories")
                .tabItem {
                    Image(systemName: "rectangle.stack")
                    Text("Categories")
                }
        }
        .accentColor(.primary)
         */
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

