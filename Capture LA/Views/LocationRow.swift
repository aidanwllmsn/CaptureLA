//
//  LocationRow.swift
//  Capture LA
//
//  Created by Aidan Williamson on 3/21/22.
//

import SwiftUI

struct LocationRow: View {
    var location: Location
    
    var body: some View {
        HStack {
            location.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(location.name)
            Spacer()
            if location.isFavorite {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
        }
        .ignoresSafeArea()
    }
}

struct LocationRow_Previews: PreviewProvider {
    static var locations = ModelData().locations
    static var previews: some View {
        LocationRow(location: locations[0])
    }
}
