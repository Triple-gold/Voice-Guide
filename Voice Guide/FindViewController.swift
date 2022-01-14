//
//  FindViewController.swift
//  Voice Guide
//
//  Created by YU FU YAM on 11/1/2022.
//

import UIKit
import MapKit
import CoreLocation

class FindViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView?
    
    var locationManager : CLLocationManager?
    
    struct Location {
        var title: String?
        var subtitle: String?
        var latitude: CLLocationDegrees
        var longitude: CLLocationDegrees
        var annotation: MKPointAnnotation {
            let location = CLLocationCoordinate2D(
                latitude: latitude,
                longitude: longitude
            )
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = title
            annotation.subtitle = subtitle
    
            return annotation
        }
    }
    
    var annotations = [MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationServicesEnabled()
        mapView?.delegate = self
        mapView?.register(
            MKMarkerAnnotationView.self,
            forAnnotationViewWithReuseIdentifier: "pin"
        )
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) ->
    MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let markView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin", for: annotation) as? MKMarkerAnnotationView
        settingCallout(annotation, forView: markView!)
        markView?.canShowCallout = true
        markView?.markerTintColor = .brown
        return markView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let locationNumber = control.tag
        performSegue(withIdentifier: "goDetail", sender: locationNumber)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goDetail"{
            let controller = segue.destination as! LocationDetailViewController
            controller.locationNumber = sender as? Int
        }
    }
    
    func locationServicesEnabled(){
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager = CLLocationManager();
            self.locationManager?.delegate = self;
            let manager = CLLocationManager()
            if manager.authorizationStatus != .authorizedAlways {
                self.locationManager?.requestAlwaysAuthorization();
            }
            else {
                self.setupAndStartLocationManager();
            }
        }
    }

    func setupAndStartLocationManager(){
        self.locationManager?.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager?.distanceFilter = kCLDistanceFilterNone;
        self.locationManager?.startUpdatingLocation();
        
        
        //Location Chungking Mansions
        let annotation = Location(
            title: "Chungking Mansions",
            subtitle: "Tsim Sha Tsui",
            latitude: 22.2969211,
            longitude: 114.1698332
        )
        mapView?.addAnnotation(annotation.annotation)
        
        //Location Hong Kong Clock Tower
        let annotation1 = Location(
            title: "Hong Kong Clock Tower",
            subtitle: "Tsim Sha Tsui",
            latitude: 22.2935624,
            longitude: 114.1673641
        )
        mapView?.addAnnotation(annotation1.annotation)
        
        //Location Tian Tan Buddha
        let TianTanBuddhaannotation = Location(
            title: "Tian Tan Buddha",
            subtitle: "Lantau Island",
            latitude: 22.2539834,
            longitude: 113.8874744
        )
        mapView?.addAnnotation(TianTanBuddhaannotation.annotation)
        
        //Location Wong Tai Sin Temple
        let WongTaiSinTempleannotation = Location(
            title: "Wong Tai Sin Temple",
            subtitle: "Chuk Un",
            latitude: 22.3427257,
            longitude: 114.1910695
        )
        mapView?.addAnnotation(WongTaiSinTempleannotation.annotation)
        
        //Location Hong Kong Disneyland
        let HongKongDisneylandannotation = Location(
            title: "Hong Kong Disneyland",
            subtitle: "Lantau Island",
            latitude: 22.3169741,
            longitude: 114.0264959
        )
        mapView?.addAnnotation(HongKongDisneylandannotation.annotation)
        
        //Location Lan Kwai Fong
        let LanKwaiFongandannotation = Location(
            title: "Lan Kwai Fong",
            subtitle: "Central",
            latitude: 22.2810697,
            longitude: 114.1543833
        )
        mapView?.addAnnotation(LanKwaiFongandannotation.annotation)
        
        //Location Tai O Fishing Village
        let TaiOFishingVillageannotation = Location(
            title: "Tai O Fishing Village",
            subtitle: "Lantau Island",
            latitude: 22.2536082,
            longitude: 113.8461248
        )
        mapView?.addAnnotation(TaiOFishingVillageannotation.annotation)
        
        //Location Avenue Of Stars
        let AvenueOfStarsannotation = Location(
            title: "Avenue Of Stars",
            subtitle: "Tsim Sha Tsui",
            latitude: 22.2930147,
            longitude: 114.1719604
        )
        mapView?.addAnnotation(AvenueOfStarsannotation.annotation)
        
        //Location
        let CheungShanMonasteryannotation = Location(
            title: "Cheung Shan Monastery",
            subtitle: "Ping Che",
            latitude: 22.529142,
            longitude: 114.1734192
        )
        mapView?.addAnnotation(CheungShanMonasteryannotation.annotation)
        
        // Create location Tang Kwong U Ancestral Hall Pin
        let TangKwongUAncestralHallannotation = Location(
            title: "Tang Kwong U Ancestral Hall",
            subtitle: "Kam Tin",
            latitude: 22.446141,
            longitude: 114.0587866
        )
        mapView?.addAnnotation(TangKwongUAncestralHallannotation.annotation)
        
        //Location Island House
        let IslandHouseannotation = Location(
            title: "Island House",
            subtitle: "Tai Po",
            latitude: 22.4459458,
            longitude: 114.1787409
        )
        mapView?.addAnnotation(IslandHouseannotation.annotation)
        
        //Location Rock Carving on Kau Sai Chau
        let RockCarvingonKauSaiChauannotation = Location(
            title: "Rock Carving on Kau Sai Chau",
            subtitle: "Sai Kung",
            latitude: 22.3670911,
            longitude: 114.300811
        )
        mapView?.addAnnotation(RockCarvingonKauSaiChauannotation.annotation)
    }
    
    func settingCallout(_ annotation: MKAnnotation, forView annotationView: MKAnnotationView) {
        let button = UIButton(type: .detailDisclosure)

        if annotation.title == "Chungking Mansions" {
            button.tag = 1
        }else if annotation.title == "Hong Kong Clock Tower" {
            //let button = UIButton(: .detailDisclosure)
            button.tag = 2
        }else if annotation.title == "Tian Tan Buddha" {
            button.tag = 3
        }else if annotation.title == "Wong Tai Sin Temple" {
            button.tag = 4
        }else if annotation.title == "Hong Kong Disneyland" {
            button.tag = 5
        }else if annotation.title == "Lan Kwai Fong" {
            button.tag = 6
        }else if annotation.title == "Tai O Fishing Village" {
            button.tag = 7
        }else if annotation.title == "Avenue Of Stars" {
            button.tag = 8
        }else if annotation.title == "Cheung Shan Monastery" {
            button.tag = 9
        }else if annotation.title == "Tang Kwong U Ancestral Hall" {
            button.tag = 10
        }else if annotation.title == "Island House" {
            button.tag = 11
        }else if annotation.title == "Rock Carving on Kau Sai Chau" {
            button.tag = 12
        }
        annotationView.rightCalloutAccessoryView = button
    }
}
