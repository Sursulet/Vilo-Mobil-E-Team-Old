//
//  MainViewModel.swift
//  Vilo Mobil E Team
//
//  Created by Apprenant 85 on 14/12/2021.
//

import Foundation
import SwiftUI
import MapKit

final class MainViewModel: ObservableObject {
    
    var height: CGFloat = 0
    
    @Published var offset: CGFloat = 0
    @Published var lastOffset: CGFloat = 0
    @Published var modalContent: ModalContent = .filter
    
    @Published var selectedStation = Station(bike: 0, vae: 0, place: 0)
    @Published var textReport = ""
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.866667, longitude: 2.333333),
        span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50))
    
    func onEvent(_ value: ModalContent) { modalContent = value }
    
    func onChange(_ gestureOffset: CGFloat) {
        DispatchQueue.main.async {
            self.offset = gestureOffset + self.lastOffset
        }
    }
    
    func onEnd() {
        let maxHeight = height - 100
        
        withAnimation {
            if -offset > 100 && -offset < maxHeight / 2 {
                offset = -(maxHeight / 3)
            }
            else if -offset > maxHeight / 2 {
                offset = -maxHeight
            }
            else {
                offset = 0
            }
        }
        
        lastOffset = offset
    }
    
    func getOffset() -> CGFloat {
        let result = -offset > 0 ? -offset <= (height - 100) ? offset : -(height - 100) : 0
        return result
    }
}
