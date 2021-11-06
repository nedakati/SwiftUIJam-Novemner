//
//  AddSpotViewController.swift
//  MySpot
//
//  Created by Katalin Neda on 06.11.2021.
//

import UIKit
import SwiftUI
import MapKit

struct AddSpotMap: UIViewControllerRepresentable {
    
    var onLocationSelected: ((Location) -> Void)?
    
    init(onLocationSelected: ((Location) -> Void)?) {
        self.onLocationSelected = onLocationSelected
    }
    
    typealias UIViewControllerType = AddSpotMapViewController
    
    func makeUIViewController(context: Context) -> AddSpotMapViewController {
        let controller = AddSpotMapViewController()
        controller.onLocationSelected = { location in
            self.onLocationSelected?(location)
        }
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AddSpotMapViewController, context: Context) { }
}

struct Location {
    let coordinte: Coordinates
    let address: String
}

class AddSpotMapViewController: UIViewController {
    
    private var previousAnnotation: MKPointAnnotation?
    
    var onLocationSelected: ((Location) -> Void)?
    
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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(sender:)))
        mapView.addGestureRecognizer(tapGesture)
        
        requestLocationPermission()
    }
    
    private func requestLocationPermission() {
        CLLocationManager().requestWhenInUseAuthorization()
    }
    
    @objc func handleTapGesture(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            if let previousAnnotation = previousAnnotation {
                mapView.removeAnnotation(previousAnnotation)
            }
            let point = sender.location(in: mapView)
            let coordinate = mapView.convert(point, toCoordinateFrom: mapView)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            previousAnnotation = annotation
            mapView.addAnnotation(annotation)
            
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(CLLocation.init(latitude: coordinate.latitude, longitude:coordinate.longitude)) { (places, error) in
                guard error == nil else { return }
                if let place = places?.first {
                    self.onLocationSelected?(Location(coordinte: Coordinates(latitude: coordinate.latitude, longitude: coordinate.longitude),
                                                      address: place.name ?? ""))
                }
            }
        }
    }
}

extension AddSpotMapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MKSpotAnnotation else { return nil }
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "spot")
        annotationView.glyphImage = UIImage(systemName: "car.fill")
        annotation.accessibilityLabel = annotation.title
        return annotationView
    }
}
