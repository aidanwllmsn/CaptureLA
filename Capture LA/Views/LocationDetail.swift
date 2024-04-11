//
//  LocationDetail.swift
//  Capture LA
//
//  Created by Aidan Williamson on 3/21/22.
//

import SwiftUI

struct LocationDetail: View {
    @EnvironmentObject var modelData: ModelData
    var location: Location
    
    var locationIndex: Int {
        modelData.locations.firstIndex(where: { $0.id == location.id})!
    }
    
    var body: some View {
        ScrollView {
            location.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 400, alignment: .center)
                .clipShape(Rectangle())
                .frame(height: 400)
                .ignoresSafeArea(edges: .top)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(location.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.locations[locationIndex].isFavorite)
                }
                
                HStack {
                    Text(location.address)
                }
                .font(.subheadline)
                Divider()
                Text("Details of \(location.name):")
                    .font(.title2)
                Text(location.description)
            }
            .padding()
            
            MapView(coordinate: location.locationCoordinate)
                .ignoresSafeArea(edges: .bottom)
                .frame(height: 300)
            
        }
        .navigationTitle(location.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct LocationDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        LocationDetail(location: ModelData().locations[0])
            .environmentObject(modelData)
    }
}
