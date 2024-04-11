//
//  ContentView.swift
//  Capture LA
//
//  Created by Aidan Williamson on 3/20/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    
    enum Tab {
        case home
        case list
        case map
    }
    
    var body: some View {
        
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem() {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)

            LocationList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
            
            BigMapView()
                .tabItem() {
                    Label("Map", systemImage: "map")
                }
                .tag(Tab.map)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .environmentObject(ModelData())
    }
}
