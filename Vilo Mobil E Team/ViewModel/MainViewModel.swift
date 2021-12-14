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
    
    @Published var user = User()
    
    var height: CGFloat = 0
    
    @Published var offset: CGFloat = 0
    @Published var lastOffset: CGFloat = 0
    @Published var modalContent: ModalContent = .landing
    @Published var modalOffset: CGFloat = 100
    
    @Published var selectedStation = Station(bike: 0, vae: 0, place: 0)
    @Published var textReport = ""
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.866667, longitude: 2.333333),
        span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50))
    
    func onEvent(_ value: ModalContent, size: ModalSize) {
        modalContent = value
        setAnimation(value: size)
    }
    
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
    
<<<<<<< Updated upstream
    func setAnimation(value: ModalSize) {
        
        let maxHeight = height - 100
        
        withAnimation(Animation.easeIn(duration: 0.3)) {
            self.modalOffset = 0
=======
    func setAnimation(value: ModalSize, selected: ModalContent) {
        //self.newHeight = value
        //self.maxHeight = self.height - 100//self.newHeight
        
        withAnimation(Animation.easeIn(duration: 0.3)) {
            self.offsetModal = 0
>>>>>>> Stashed changes
            self.offset = 0
        }
        
        var newOffset: CGFloat = 0
        
<<<<<<< Updated upstream
        if value == .middle {
           newOffset = -(maxHeight / 3)
=======
        if value == .semi {
           newOffset = -(self.maxHeight / 3)
>>>>>>> Stashed changes
        } else if value == .full {
            newOffset = -maxHeight
        }
        
<<<<<<< Updated upstream
        withAnimation(Animation.easeOut(duration: 0.5).delay(0.3)) {
            self.modalOffset = 100
=======
        self.active = selected
        
        withAnimation(Animation.easeOut(duration: 0.5).delay(0.3)) {
            self.offsetModal = 100
>>>>>>> Stashed changes
            self.offset = newOffset
        }
        
        self.lastOffset = self.offset
<<<<<<< Updated upstream
    }
}


class User: ObservableObject {
    @Published var homeAddress: String = "Définir l'adresse"
    @Published var officeAddress: String = "Définir l'adresse"
    
    @Published var preferredTripType: PreferredTripType = .none
    @Published var preferredBikeType: PreferredBikeType = .none
    
    @Published var favorites: [Favorite] = []
}

struct Favorite {
    var place: Place
    var icon: IconeBookmark
}

enum PreferredBikeType: String, CaseIterable {
    case none = "Aucun"
    case myOwnBike = "Mon vélo perso"
    case publicSharedBike = "Un vélo partagé public (type Vélib)"
    case privateSharedBike = "Un vélo partagé privé (type Dott)"
}

enum PreferredTripType : String, CaseIterable {
    case none = "Aucun"
    case fast = "Rapide"
    case secure = "Sécurisé"
    case nice = "Agréable"
    case discovery = "Découverte"
}

enum IconeBookmark: String {
    case star = "star"
    case heart = "heart.circle.fill"
    case fork = "fork"
    case cart = "cart"
}

struct Place: Identifiable, Hashable {
    var id = UUID()
    var name: String
    
    var address: String
    var latitude: Double = 0.0
    var longitude: Double = 0.0
//    var coordinates: mapkit.Coordinate

}

extension User {
    static var globalUser = User()
=======
        
        //self.offsetModal = 100
        //withAnimation() {
        //    self.offset = -(self.maxHeight / 3)
        //}
        /*
        withAnimation() {
            self.offset = -(self.maxHeight / 3)
            //offset = 0
            //isAnimated.toggle()
        }*/
    }
>>>>>>> Stashed changes
}
