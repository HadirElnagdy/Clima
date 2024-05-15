//
//  BackgroundView.swift
//  Clima
//
//  Created by Hadir on 14/05/2024.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
       
        let backgroundImage: Image

        if AppCommon.isMorning() {
            backgroundImage = Image(.afterNoon)
            
        } else {
            backgroundImage = Image(.night)
           
        }
        
        return backgroundImage
                .resizable()
                .edgesIgnoringSafeArea([.top, .bottom])
                .aspectRatio(contentMode: .fill)
            
    }
}


#Preview {
    BackgroundView()
}
