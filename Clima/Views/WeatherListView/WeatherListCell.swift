//
//  WeatherListCell.swift
//  Clima
//
//  Created by Hadir on 12/05/2024.
//

import SwiftUI

struct WeatherListCell: View {
    
    let day: Forecastday?
    
    var body: some View {
        VStack {
            HStack {
                Text(AppCommon.getDayByDate(dateString: day?.date))
                    .font(.title2)
                    .semibold()
                    .foregroundColor(AppCommon.getFontColor())
                
                Spacer()
                Image(AppCommon.getIconName(urlString: day?.day?.condition?.icon))
                Spacer()
                let formattedString = String(format: "%.1f\u{00B0} - %.1f\u{00B0}", day?.day?.mintempC ?? 0, day?.day?.maxtempC ?? 0)
                
                Text(formattedString)
                    .font(.title2)
                    .semibold()
                    .foregroundColor(AppCommon.getFontColor())
            }
            .padding([.leading, .trailing])
        }
        .frame(height: 25)
        .background(Color.clear)
        .padding(.bottom, 20)
    }
    
    
}



   
