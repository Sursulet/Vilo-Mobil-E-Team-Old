//
//  GoTripView.swift
//  Vilo Mobil E Team
//
//  Created by Joffrey Freixanet on 14/12/2021.
//

import SwiftUI

struct GoTripView: View {
    
    @ObservedObject var viewModel : BottomSheetModel
    @ObservedObject var user = User.globalUser
    
    
    var textTime: Double = 5
    var textIcon: String {
        switch user.preferredTripType {
        case .fast:
            return "🐆"
        case .secure:
            return "👌"
        case .nice:
            return "🌳"
        case .discovery:
            return "👀"
        default:
            return "🐆"
        }
    }
    

    
    var body: some View {
        
        HStack{
            Button {
                // retour vers le choix des types de trajets:
                viewModel.context = .tripChoice
                user.preferredTripType = .none
                
            } label: {
                Text(textIcon)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("blueVilo"))
                    .clipShape(Circle())
                
            }
            
            Spacer()
            
            Text("\(textTime) minutes ")
                .foregroundColor(.white)
                .padding()
                .background(Color("blueVilo"))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
            
            Spacer()
            
            Button {
                // go to full screen with spatial directions:
                
            } label: {
                Text("Go !")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("blueVilo"))
                    .clipShape(Circle())
            }



        }
        
        .frame(maxHeight: 50)
    }
}

struct GoTripView_Previews: PreviewProvider {
    static var previews: some View {
        GoTripView(viewModel: .homeBS)
    }
}
