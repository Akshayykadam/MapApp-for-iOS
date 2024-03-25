//
//  LocationListView.swift
//  SwiftMapsApps
//
//  Created by Akshay Kadam on 23/03/24.
//

import SwiftUI

struct LocationListView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    
    var body: some View {
        List{
            ForEach(viewModel.locations) { location in
                Button {
                    viewModel.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

extension LocationListView {
    private func listRowView(location: Location) -> some View {
        HStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        }
    }
}

#Preview {
    LocationListView()
        .environmentObject(LocationsViewModel())
}
