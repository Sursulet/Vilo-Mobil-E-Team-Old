//
//  IconCircle.swift
//  Vilo Mobil E Team
//
//  Created by Apprenant 85 on 14/12/2021.
//

import SwiftUI

struct IconCircle: View {
    
    @State var symbol: String
    var size: CGFloat = 80
    
    var body: some View {
        Image(systemName: symbol)
            .foregroundColor(.white)
            .font(.system(size: 34))
            .frame(width: size, height: size)
            .background(
                Circle().fill(Color("vilo")))
    }
}

struct IconCircle_Previews: PreviewProvider {
    static var previews: some View {
        IconCircle(symbol: "heart.fill")
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
