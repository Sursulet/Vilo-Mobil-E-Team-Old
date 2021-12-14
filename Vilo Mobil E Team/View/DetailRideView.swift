//
//  DetailRideView.swift
//  Vilo Mobil E Team
//
//  Created by Joffrey Freixanet on 14/12/2021.
//

import SwiftUI

import SwiftUI

struct DetailView: View {
    var body: some View {
        
        VStack {
            ExtractedView(textTime: 5, textIcon: "🐆", textDistance: 1.8, textBike: 10, textWork: 2)
            
        }
        
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

struct ExtractedView: View {
    
    var textTime: Double
    var textIcon: String
    var textDistance: Double
    var textBike: Int
    var textWork: Int
    
    
    var body: some View {
        VStack{
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                
                ZStack{
                    VStack{
                        Text(textIcon)
                            .font(.system(size: 30))
                        Text("\(textTime, specifier : "%.0f") minutes")
                            .font(.system(size: 20))
                        
                    }
                    
                }
                
                .frame(width: 325, height: 38)
                .padding()
                .background(Color("Vilo"))
                .cornerRadius(10)
                .foregroundColor(.white)
                
            }
            
            Text("\(textDistance, specifier : "%.1f") Km")
            
            Divider()
                .padding(.horizontal, 35)
            
            Text("\(textBike) % pistes cyclables")
            Divider()
                .padding(.horizontal, 35)
            
            Text("\(textWork) endroit(s) de travaux")
            
        }
    }
}
