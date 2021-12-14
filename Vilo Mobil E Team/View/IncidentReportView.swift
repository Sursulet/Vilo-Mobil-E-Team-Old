//
//  IncidentReportView.swift
//  BottomSheet (iOS)
//
//  Created by Maxime Bégué on 06/12/2021.
//

import SwiftUI

struct IncidentReportView: View {
    
    @State var text: String
    var body: some View {
        VStack(spacing: 30){
           Spacer()
            
            Text("Signaler un incident")
                .fontWeight(.bold)
            TextField("Votre position", text: $text)
                .frame(width: 300, height: 40)
                .background(RoundedRectangle(cornerRadius: 10))
                .opacity(0.2)
                .padding(.horizontal, 40)
                
          //  Spacer()
            
            HStack{
                VStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image("accident")
                            .resizable()
                            .frame(width: 60, height: 60)
                        
                    }
                    Text("Accident")
                        .font(.headline)
                }
               Spacer()
                
                VStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image("travaux")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                    Text("Travaux")
                        .font(.headline)
                }
                Spacer()
                VStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image("obstacle")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                    Text("Obstacle")
                        .font(.headline)
                }
                

            }
            .padding(.horizontal)
            
          //  Spacer()
            
            //StartValidButton(buttonText: "Ajouter")
            
         //   Spacer()
        }
    }
}

struct IncidentReportView_Previews: PreviewProvider {
    static var previews: some View {
        IncidentReportView(text: "")
    }
}
