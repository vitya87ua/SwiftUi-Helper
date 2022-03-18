//
//  DraggablePinMapView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 18.03.2022.
//

import SwiftUI
import MapKit

// REQUIRED: Add to Info.plist -> "Privacy - Location When In Use Usage Description"
struct DraggablePinMapView: View {
    
    @ObservedObject var viewModel: DraggablePinMapViewModel = DraggablePinMapViewModel()
        
    var body: some View {
        if viewModel.coordinate != nil {
            ETMapView(coordinate: $viewModel.coordinate)
                .ignoresSafeArea()
                .overlay(alignment: .bottom) {
                    Button("PRINT") {
                        viewModel.getPlace()
                    }
                }
        } else {
            Map(coordinateRegion: .constant(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: 34.052235, longitude: -118.243683),
                    span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
            )
        }
    }
}

#if DEBUG
struct DraggablePinMapView_Previews: PreviewProvider {
    static var previews: some View {
        DraggablePinMapView()
    }
}
#endif

struct ETMapView: UIViewRepresentable {
    
    @Binding var coordinate: CLLocationCoordinate2D?
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView: MKMapView = MKMapView()
        mapView.delegate = context.coordinator
        
        if let coordinate = self.coordinate {
            let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
            
            mapView.region = MKCoordinateRegion(center: coordinate, span: span)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            
            mapView.addAnnotation(annotation)
        }
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: ETMapView
        
        init(_ parent: ETMapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            pin.isDraggable = true
            pin.pinTintColor = .red
            pin.animatesDrop = false
            
            return pin
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
            print(#fileID, #line, view.annotation?.coordinate)
            
            if let annotation = view.annotation {
                parent.coordinate = annotation.coordinate
            }
        }
    }
}

final class DraggablePinMapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var coordinate: CLLocationCoordinate2D? {
        didSet {
            print(#fileID, #line, "coordinate", coordinate)
        }
    }
    
    var lockationManager: CLLocationManager?
    
    override init() {
        super.init()
        
        checkLocationService()
        
    }
    
    func checkLocationService() {
        if CLLocationManager.locationServicesEnabled() {
            lockationManager = CLLocationManager()
            lockationManager?.desiredAccuracy = kCLLocationAccuracyBest
            lockationManager?.delegate = self
            checkAuthorizationStatus()
        } else {
            print(#fileID, #line, "Disabled")
        }
    }
    
    func checkAuthorizationStatus() {
        guard let lockationManager = lockationManager else { return }
        
        switch lockationManager.authorizationStatus {
        case .notDetermined, .restricted, .denied:
            lockationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            lockationManager.requestLocation()
        default: break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAuthorizationStatus()
        print(#fileID, #line, "locationManagerDidChangeAuthorization")
    }
    
    func getPlace() {
        guard let coordinate = coordinate else { return }

        let location: CLLocation = CLLocation(
            latitude: coordinate.latitude,
            longitude: coordinate.longitude
        )
        
        CLGeocoder().reverseGeocodeLocation(location) { places, error in
            if let error = error {
                print(#fileID, #line, "error", error)
            } else {
                if let place = places?.first {
                    print(#fileID, #line, "Place:", place)
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.coordinate = location.coordinate
        print(#fileID, #line, "location", location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(#fileID, #line, "error", error)
    }
}
