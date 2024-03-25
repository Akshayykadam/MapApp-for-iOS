//
//  LocationPreviewView.swift
//  SwiftMapsApps
//
//  Created by Akshay Kadam on 23/03/24.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    let location: Location
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading ,spacing: 16){
                imageSelection
                textSelection
            }
            
            VStack(spacing: 8){
                learnMoreButton
                NextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .cornerRadius(25)
        .padding()
    }
}

#Preview {
    ZStack{
        Color.clear.ignoresSafeArea()
        LocationPreviewView(location: LocationsDataService.locations.first!)
            
    }
    .environmentObject(LocationsViewModel())
}

extension LocationPreviewView{
    
    private var imageSelection: some View{
        
        ZStack{
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var textSelection: some View {
        
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.headline)
            Text(location.cityName)
                .font(.subheadline)
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
    
    private var learnMoreButton: some View{
        Button{
            viewModel.sheetLocation = location
        } label: {
            Text("Learn More")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var NextButton: some View{
        Button{
            viewModel.nextButton()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
    }
}
