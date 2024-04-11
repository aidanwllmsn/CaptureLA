//
//  BigMapView.swift
//  Capture LA
//
//  Created by Aidan Williamson on 9/13/22.
//

import SwiftUI
import MapKit

struct AnyMapAnnotationProtocol: MapAnnotationProtocol {
    let _annotationData: _MapAnnotationData
    let value: Any
    
    init<WrappedType: MapAnnotationProtocol>(_ value: WrappedType) {
        self.value = value
        _annotationData = value._annotationData
    }
}

struct BigMapView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.055_216, longitude: -118.237_709),span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    
    var body: some View {
        Map(coordinateRegion: $region, interactionModes: [.all], showsUserLocation: false, userTrackingMode: .constant(.follow), annotationItems: modelData.locations) { loc in AnyMapAnnotationProtocol(MapAnnotation(coordinate: loc.locationCoordinate) {
                    DetailView(location: loc)
            })
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct BigMapView_Previews: PreviewProvider {
    static var previews: some View {
        BigMapView()
            .environmentObject(ModelData())
    }
}
