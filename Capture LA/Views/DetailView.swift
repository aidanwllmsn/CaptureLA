//
//  DetailView.swift
//  Capture LA
//
//  Created by Aidan Williamson on 9/14/22.
//

import SwiftUI

struct DetailView: View {
    @State var showDescription = false
    let location: Location
    
    var body: some View {
        VStack {
                Image("Ping")
                .resizable()
                .frame(width:50,height:50)
                if showDescription {
                    location.image
                        .resizable()
                        .frame(width: 45, height: 40)
                        .clipShape(Rectangle())
                    Text(location.name)
                }
        }
        .onTapGesture {
            self.showDescription.toggle()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var locations = ModelData().locations
    static var previews: some View {
        DetailView(location: locations[0])
    }
}
