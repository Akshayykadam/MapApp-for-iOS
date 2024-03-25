//
//  LocationsView.swift
//  SwiftMapsApps
//
//  Created by Akshay Kadam on 23/03/24.
//

import SwiftUI
import MapKit


struct LocationsView: View {
    
 @EnvironmentObject private var locationViewModel: LocationsViewModel

    var body: some View {
        ZStack{
            MapLayer
                .ignoresSafeArea()
            VStack(spacing: 0){
                Header
                    .padding()
                Spacer()
                LocatioPreviewStack
            }
        }
        .sheet(item: $locationViewModel.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel() )
}

extension LocationsView {
    private var Header: some View{
        VStack{
            Button(action: locationViewModel.toggleLocationList){
                Text("\(locationViewModel.mapLocation.name),\(locationViewModel.mapLocation.cityName)")
                    .font(.title3)
                    //.foregroundStyle(Color.black)
                    .foregroundStyle(Color.primary)
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .animation(.none, value: locationViewModel.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees:locationViewModel.showLocationList ? 180 : 0))
                    }
            }
            if locationViewModel.showLocationList{
                LocationListView()
            }
            
        }
        .background(.ultraThinMaterial)
        .cornerRadius(30)
        .shadow(color: .black.opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
    
    private var MapLayer: some View{
        Map(coordinateRegion: $locationViewModel.mapRegion,
            annotationItems: locationViewModel.locations,
            annotationContent: { location in
            //MapMarker(coordinate: location.coordinates, tint: .accentColor)
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnotationView()
                    .scaleEffect(locationViewModel.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .onTapGesture {
                        locationViewModel.showNextLocation(location: location)
                    }
            }
        })
    }
    
    private var LocatioPreviewStack: some View{
        ZStack{
            ForEach(locationViewModel.locations){ location in
                if locationViewModel.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)))
                    
                }
                
            }
        }
    }
}
