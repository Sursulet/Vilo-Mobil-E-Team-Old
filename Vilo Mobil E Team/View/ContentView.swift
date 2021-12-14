//
//  ContentView.swift
//  Vilo Mobil E Team
//
//  Created by Apprenant 85 on 07/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        ZStack {
            Text("Hello, world!")
            .padding()
        }
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
