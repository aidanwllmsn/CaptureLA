//
//  CategoryItem.swift
//  Capture LA
//
//  Created by Aidan Williamson on 3/21/22.
//

import SwiftUI

struct CategoryItem: View {
    var location: Location
    
    var body: some View {
        VStack(alignment: .center) {
            location.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(location.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(location: ModelData().locations[0])
    }
}
