//
//  ViewController.swift
//  FlyoverKitApp
//
//  Created by Jamario Davis on 7/21/20.
//

import UIKit
import FlyoverKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
            mapSetup()
    }
    let locationDictionary = ["Statue of Liberty":FlyoverAwesomePlace.newYorkStatueOfLiberty, "New York":FlyoverAwesomePlace.newYork, "Golden Gate Bridge":FlyoverAwesomePlace.sanFranciscoGoldenGateBridge, "Googleplex":FlyoverAwesomePlace.googlePlex, "Miami Beach":FlyoverAwesomePlace.miamiBeach, "Laguna Beach":FlyoverAwesomePlace.lagunaBeach, "Griffith Observatory":FlyoverAwesomePlace.griffithObservatory, "Luxor Resort":FlyoverAwesomePlace.luxorResortLasVegas, "Apple HQ":FlyoverAwesomePlace.appleHeadquarter, "Brandenburger Gate":FlyoverAwesomePlace.berlinBrandenburgerGate, "Hamburg Town Hall":FlyoverAwesomePlace.hamburgTownHall, "Cologne Cathedral":FlyoverAwesomePlace.cologneCathedral, "Muenster Castle": FlyoverAwesomePlace.neuschwansteinCastle, "Rome Colosseum":FlyoverAwesomePlace.romeColosseum, "Piazza di Trevi": FlyoverAwesomePlace.piazzaDiTrevi, "Sagrada Familia":FlyoverAwesomePlace.sagradaFamiliaSpain, "Big Ben":FlyoverAwesomePlace.londonBigBen, "London Eye":FlyoverAwesomePlace.londonEye, "Sydney Opera House":FlyoverAwesomePlace.sydneyOperaHouse, "Eiffel Tower": FlyoverAwesomePlace.parisEiffelTower]
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var placeLabel: UILabel!
    
   @IBAction func locationButtonClicked(_ sender: UIButton) {
        let rand = locationDictionary.randomElement()!
        let camera = FlyoverCamera(mapView: self.mapView, configuration: FlyoverCamera.Configuration(duration: 4.0, altitude: 300, pitch: 45.0, headingStep: 40.0))
        camera.start(flyover: rand.value)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
            camera.stop()
        })
        placeLabel.text = "\(rand.key)"
    }
    func mapSetup(){
        self.mapView.mapType = .hybridFlyover
        self.mapView.showsBuildings = true
        self.mapView.isZoomEnabled = true
        self.mapView.isScrollEnabled = true
    }
}

