//
//  LocationMapAnotationView.swift
//  SwiftMapsApps
//
//  Created by Akshay Kadam on 24/03/24.
//

import SwiftUI

struct LocationMapAnotationView: View {
    var body: some View {
        VStack(spacing: 0){
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(Color.white)
                .padding(5)
                .background(Color.accentColor)
                .cornerRadius(36)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
                .foregroundColor(Color.accentColor)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 40)
        }
    }
}

#Preview {
    LocationMapAnotationView()
}
