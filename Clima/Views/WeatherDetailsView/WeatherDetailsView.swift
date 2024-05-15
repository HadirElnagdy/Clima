//
//  WeatherDetailsView.swift
//  Clima
//
//  Created by Hadir on 12/05/2024.
//

import SwiftUI

struct WeatherDetailsView: View {
    var hours: [Hour]?
    var body: some View {
        ZStack{
            BackgroundView()
            List(hours ?? []){ hour in
                WeatherDetailsCell(hour: hour)
                    .listRowBackground(Color.clear)
            }.listStyle(.plain)
                .background(.clear)
                .listRowBackground(Color.clear)
                .listStyle(InsetListStyle())
                .padding()
                
        }
    }
}
