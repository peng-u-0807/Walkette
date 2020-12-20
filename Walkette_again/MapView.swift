//
//  MapView.swift
//  Walkette_again
//
//  Created by 최유림 on 2020/12/19.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    typealias Context = UIViewRepresentableContext<Self>
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        let mapView = MKMapView()
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapView>) {
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
