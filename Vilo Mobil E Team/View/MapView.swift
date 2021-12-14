//
//  MapView.swift
//  Vilo Mobil E Team
//
//  Created by Apprenant 85 on 14/12/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region,
            showsUserLocation: true)
            .ignoresSafeArea()
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(MainViewModel())
    }
}
