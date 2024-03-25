//
//  SwiftMapsAppsApp.swift
//  SwiftMapsApps
//
//  Created by Akshay Kadam on 23/03/24.
//

import SwiftUI

@main
struct SwiftMapsAppsApp: App {
    
    @StateObject private var locationViewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(locationViewModel)
        }
    }
}
