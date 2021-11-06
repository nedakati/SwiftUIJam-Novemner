//
//  FindSpotMapViewController.swift
//  MySpot
//
//  Created by Botond Magyarosi on 06.11.2021.
//

import UIKit
import SwiftUI
import MapKit

struct FindSpotMap: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = FindSpotMapViewController
    
    func makeUIViewController(context: Context) -> FindSpotMapViewController {
        FindSpotMapViewController()
    }
    
    func updateUIViewController(_ uiViewController: FindSpotMapViewController, context: Context) { }
}

class FindSpotMapViewController: UIViewController {
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.isPitchEnabled = false
        return mapView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.frame = view.bounds
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(mapView)
    }
}
