//
//  ContentView.swift
//  Vilo Mobil E Team
//
//  Created by Apprenant 85 on 07/12/2021.
//

import SwiftUI

enum ModalContent {
    case landing, profile, weather, report, search, favorites, detail
}

enum ModalSize { case middle, full }

struct ContentView: View {
    
    @StateObject var viewModel = MainViewModel()
    @GestureState var gestureOffset:CGFloat = 0
    
    var body: some View {
        ZStack {
            MapView()
            
            VStack(alignment: .leading) {
                HStack {
                    Button(
                        action: { viewModel.onEvent(.profile, size: .middle)},
                        label: { IconCircle(symbol: "person.fill") })
                    
                    Spacer()
                    
                    Button(
                        action: { viewModel.onEvent(.weather, size: .full) },
                        label: { IconCircle(symbol: "cloud.sun.rain") })
                }
                
                Spacer()
                
                Button(
                    action: { viewModel.onEvent(.report, size: .middle) },
                    label: { IconSquare(symbol: "eye.trianglebadge.exclamationmark.fill") })
            }
            .padding(.bottom, 80)
            .padding(.horizontal)
            
            GeometryReader { proxy -> AnyView in
                viewModel.height = proxy.frame(in: .global).height
                
                return AnyView(
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.white)
                        
                        VStack {
                            Capsule()
                                .fill(Color(.systemGray3))
                                .frame(width: 60, height: 4)
                                .padding(.top)
                            
                            BottomContent()
                        }
                        .padding(.horizontal)
                        .frame(maxHeight: .infinity, alignment: .top)
                    }
                        .offset(y: viewModel.height - viewModel.modalOffset)
                    .offset(y: viewModel.getOffset())
                    .gesture(DragGesture()
                        .updating($gestureOffset, body: { value, out, _ in
                            out = value.translation.height
                            viewModel.onChange(gestureOffset)
                        })
                        .onEnded({ value in
                            viewModel.onEnd()
                        }))
//                        .overlay(
//                            Text("essai")
//                                .padding()
//                                .background(Color.black)
//                                .padding(.vertical, 130)
//                                .offset(y: viewModel.test())
//                            , alignment: .bottom
//                        )
                )
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BottomContent: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        
        switch viewModel.modalContent {
            case .profile:
                WeatherView()
            case .weather:
                WeatherView()
            case .report:
                IncidentReportView()
            case .search:
                SearchView()
            case .favorites:
                AddFavouriteView()
            case .landing:
                WeatherView()
            case .detail:
                StationDetailView(station: $viewModel.selectedStation)
        }
    }
}
