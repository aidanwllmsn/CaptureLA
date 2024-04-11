//
//  LocationList.swift
//  Capture LA
//
//  Created by Aidan Williamson on 3/21/22.
//

import SwiftUI

struct LocationList: View {
    @State private var showFavoritesOnly = false
    @EnvironmentObject var modelData: ModelData
    
    var filtered: [Location] {
        modelData.locations.filter { location in
            (!showFavoritesOnly || location.isFavorite)
        }
    }
    
    var body: some View {
        
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Farvorites only")
                }
                ForEach(filtered) { location in
                    NavigationLink {
                        LocationDetail(location: location)
                    } label: {
                        LocationRow(location: location)
                    }
                }
            
            }
            .navigationBarTitle("Locations")
            .listStyle(GroupedListStyle())
        }
    }
}

struct LocationList_Previews: PreviewProvider {
    static var previews: some View {
        LocationList()
            .preferredColorScheme(.dark)
            .environmentObject(ModelData())
    }
}
