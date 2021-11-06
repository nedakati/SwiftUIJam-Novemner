//
//  FindSpotMapViewController.swift
//  MySpot
//
//  Created by Botond Magyarosi on 06.11.2021.
//

import UIKit
import SwiftUI
import MapKit

private var pointsOfInterest = [
    AnnotatedItem(name: "Lidl", coordinate: .init(latitude: 46.777412, longitude: 23.608454)),
    AnnotatedItem(name: "Marasti", coordinate: .init(latitude: 46.776219, longitude: 23.606732)),
    AnnotatedItem(name: "Top Wash", coordinate: .init(latitude: 46.776327, longitude: 23.608778))
]

struct FindSpotMap: UIViewControllerRepresentable {
    @Binding var selectedSpot: AnnotatedItem?
    
    typealias UIViewControllerType = FindSpotMapViewController
    
    func makeUIViewController(context: Context) -> FindSpotMapViewController {
        FindSpotMapViewController()
    }
    
    func updateUIViewController(_ uiViewController: FindSpotMapViewController, context: Context) { }
}

class MKSpotAnnotation: NSObject, MKAnnotation {
    let title: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}

class FindSpotMapViewController: UIViewController {
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.isPitchEnabled = false
        mapView.delegate = self
        return mapView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.frame = view.bounds
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(mapView)
        
        mapView.addAnnotations(pointsOfInterest.map({ point in
            return MKSpotAnnotation(title: point.name, coordinate: point.coordinate)
        }))
        
        requestLocationPermission()
    }
    
    private func requestLocationPermission() {
        CLLocationManager().requestWhenInUseAuthorization()
    }
}

extension FindSpotMapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        print(annotation)
        guard let annotation = annotation as? MKSpotAnnotation else { return nil }
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "spot")
        annotationView.glyphImage = UIImage(systemName: "car.fill")
        annotation.accessibilityLabel = annotation.title
        return annotationView
    }
}
