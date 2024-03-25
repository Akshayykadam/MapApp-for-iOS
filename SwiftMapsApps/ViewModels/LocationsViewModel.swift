//
//  LocationsViewModel.swift
//  SwiftMapsApps
//
//  Created by Akshay Kadam on 23/03/24.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    // All locations
    @Published var locations: [Location]
    
    // Current location
    @Published var mapLocation: Location{
        didSet{
            UpdateMapRigion(location: mapLocation)
        }
    }
    
    // Current regio on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan =  MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    
    //Show list of locations
    @Published var showLocationList: Bool = false
    
    //Show location details via sheet
    @Published var sheetLocation: Location? = nil
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.UpdateMapRigion(location: locations.first!)
    }
    
    private func UpdateMapRigion(location: Location){
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span:  mapSpan
            )
        }
    }
    
    func toggleLocationList(){
        withAnimation(.easeInOut){
            showLocationList = !showLocationList
        }
    }
    
    func showNextLocation(location: Location){
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationList = false
        }
    }
    
    func nextButton(){
        
        // Get the current location
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else{
            return
        }
        
        // Check if current index is valid
        let nextIndex = currentIndex + 1
        
        guard locations.indices.contains(nextIndex) else{
            
            // Next index is not valid
            let firstIndex = locations.first!
            showNextLocation(location: firstIndex)
            return
        }
        
        // Next index is valid
        let nextLocation = locations[nextIndex]
        
        // Show next location
        showNextLocation(location: nextLocation)
        
    }
}
