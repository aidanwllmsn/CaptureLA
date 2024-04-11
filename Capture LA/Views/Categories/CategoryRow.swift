//
//  CategoryRow.swift
//  Capture LA
//
//  Created by Aidan Williamson on 3/21/22.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Location]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { location in
                        NavigationLink {
                            LocationDetail(location: location)
                        } label: {
                            CategoryItem(location:location)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var locations = ModelData().locations
    
    static var previews: some View {
        CategoryRow(
            categoryName: locations[0].category.rawValue, items: Array(locations.prefix(4)))
    }
}
