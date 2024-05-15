//
//  WeatherDetailsCell.swift
//  Clima
//
//  Created by Hadir on 14/05/2024.
//

import SwiftUI

struct WeatherDetailsCell: View {
    
    var hour: Hour?
    
    var body: some View {
        VStack {
            HStack {
                
                Text(AppCommon.formateHour(hourString: hour?.time))
                    .font(.title)
                    .foregroundColor(AppCommon.getFontColor())

                Image(AppCommon.getIconName(urlString: hour?.condition?.icon))
                    .resizable()
                    .frame(width: 80, height: 80, alignment: .center)
                    .padding([.leading, .trailing])
                
                let formattedString = String(format: "%.1f\u{00B0}", hour?.tempC ?? 0)
                Text(formattedString)
                    .font(.title)
                    .foregroundColor(AppCommon.getFontColor())
            }
            .padding([.leading, .trailing])
        }
        .frame(height: 25)
        .background(Color.clear)
        .padding(.bottom, 20)
    }
}
