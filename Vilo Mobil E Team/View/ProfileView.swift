//
//  ProfileView.swift
//  Vilo Mobil E Team
//
//  Created by Apprenant 86 on 14/12/2021.
//

import SwiftUI

struct ProfileView: View {
    
    enum ProfileModalContent {
        case profile, profileHomeSearch, profileOfficeSearch
    }
    
    @State private var content: ProfileModalContent = .profile
    
    @EnvironmentObject var viewModel: MainViewModel
    
    @State private var tap = false
    
    var body: some View {
        
        if content == .profile {
            List{
                Button {
                    // action: go to address selection
                    content = .profileHomeSearch
                    viewModel.setAnimation(value: .full)
                } label: {
                    HStack{
                        Text("Mon domicile")
                        Spacer()
                        Text(viewModel.user.homeAddress)
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }
                }
                
                Button {
                    // action: go to address selection
                    content = .profileOfficeSearch
                    viewModel.setAnimation(value: .full)
                } label: {
                    HStack{
                        Text("Mon bureau")
                        Spacer()
                        Text(viewModel.user.officeAddress)
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }
                }
                
                HStack {
                    Text("Mon mode de trajet favoris")
                    Spacer()
                    Picker("Mon mode de trajet favoris", selection: $viewModel.user.preferredTripType) {
                        ForEach(PreferredTripType.allCases, id: \.self){
                            Text($0.rawValue)
                                .font(.footnote)
                                .foregroundColor(.blue)
                        }
                    }.pickerStyle(.menu)
                }
                
                HStack {
                    Text("Mon type de v??lo favoris")
                    Spacer()
                    Picker("Mon type de v??lo favoris", selection: $viewModel.user.preferredBikeType) {
                        ForEach(PreferredBikeType.allCases, id: \.self){
                            Text($0.rawValue)
                            
                        }
                    }.pickerStyle(.menu)
                }
                
                if viewModel.user.favorites.isEmpty {
                    NavigationLink("Mes destinations favorites") {
                        //destination liste des destinations favorites
                    }
                } else {
                    Button {
                        
//                        viewModel.modalContent = .favorite
                        
                    } label: {
                        HStack{
                            Text("Mes destinations favorites")
                            Spacer()
                            Text("\(viewModel.user.favorites.count)")
                                .font(.footnote)
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .padding(.vertical)
        }
        
        if content == .profileHomeSearch {
            
            WeatherView()
            
//            VStack{
//                SearchBar(viewModel: viewModel)
//                if viewModel.destination.isEmpty {
//                    RecentsView(tap: $tap, choice: $user.homeAddress)
//                        .onChange(of: tap) { newValue in
//                            viewModel.position = .middle
//                            viewModel.context = .profile
//                        }
//                }
//                else {
//                    SuggestionsView()
//                }
//                Spacer()
//            }
        }
        
//        if viewModel.context == .search(type: .office) {
//            VStack{
//                SearchBar(viewModel: viewModel)
//                if viewModel.destination.isEmpty {
//                    RecentsView(tap: $tap, choice: $user.officeAddress)
//                        .onChange(of: tap) { newValue in
//                            viewModel.position = .middle
//                            viewModel.context = .profile
//                        }
//                }
//                else {
//                    SuggestionsView()
//                }
//                Spacer()
//            }
//        }
        
        //        if viewModel.context == .favorite {
        //            List(user.favorites, id: \.place.id){ fav in
        //                Label(fav.place.name, systemImage: fav.icon.rawValue)
        //            }
        //        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
