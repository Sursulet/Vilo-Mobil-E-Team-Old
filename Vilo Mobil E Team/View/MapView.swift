//
//  MapView.swift
//  Vilo Mobil E Team
//
//  Created by Apprenant 85 on 14/12/2021.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct MapView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region,
                showsUserLocation: true)
                .ignoresSafeArea()
            
            VStack {
                Button(
                    action: {},
                    label: { IconSquare(symbol: "bicycle") })
                
                LocationButton(.currentLocation) {
                    viewModel.requestAllowOnceLocationPermission()
                }
                .font(.system(size: 35))
                .foregroundColor(.white)
                .cornerRadius(15)
                .tint(Color("vilo"))
                .labelStyle(.iconOnly)
                .symbolVariant(.fill)
            }
            .padding(.trailing)
            .padding(.bottom, 80)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(MainViewModel())
    }
}
