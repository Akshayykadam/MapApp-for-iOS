//
//  LocationDetailView.swift
//  SwiftMapsApps
//
//  Created by Akshay Kadam on 24/03/24.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    let location: Location
    var body: some View {
        ScrollView{
            VStack{
                ImageSection
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.1), radius: 10, x: 0, y: 10)
                
                VStack(alignment: .leading, spacing: 16){
                    TextSection
                    Divider()
                    DiscrptionSection
                    Divider()
                MapLayer
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(BackButton, alignment: .topLeading)
    }
}

//#Preview {
//    LocationDetailView(location: LocationsDataService.locations.first!)
//}

extension LocationDetailView{
    private var ImageSection: some View{
        TabView {
            ForEach(location.imageNames, id: \.self){
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var TextSection: some View{
        VStack(alignment: .leading, spacing: 8){
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundStyle(Color.secondary)
        }
    }
    
    private var DiscrptionSection: some View{
        VStack(alignment: .leading, spacing: 16){
            Text(location.description)
                .font(.subheadline)
                .foregroundStyle(Color.secondary)
            
            if let url = URL(string: location.link){
                Link("Read More On Wikipedia", destination: url)
                    .font(.subheadline)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
        }
        
    }
    
    private var MapLayer: some View{
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: location.coordinates,
            span: viewModel.mapSpan)),
            annotationItems: [location]){ location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnotationView()
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
        }
            .allowsTightening(false)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(30)
    }
    
    private var BackButton: some View{
        Button{
            viewModel.sheetLocation = nil
        }label: {
            Image(systemName: "chevron.backward")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .shadow(radius: 5)
                .padding()
        }
        
    }
        
}
