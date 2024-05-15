//
//  ListView.swift
//  Clima
//
//  Created by Hadir on 14/05/2024.
//

import SwiftUI

struct ListView: View {
    var forecast: Forecast?
    var body: some View {
        List{
            Section {
                ForEach(forecast?.forecastday ?? []) { day in
                    let forecastday = day as? Forecastday
                    NavigationLink(destination: WeatherDetailsView(hours: forecastday?.hour)) {
                        WeatherListCell(day: day)
                            .listRowBackground(Color.clear)
                    }
                }
            } header: {
                Text("3-Days Forecast")
                    .padding(.leading)
                    .foregroundColor(AppCommon.getFontColor())
            }.listRowBackground(Color.clear)
        }.listStyle(.plain)
            .background(.clear)
    }
}

#Preview {
    ListView(forecast: nil)
}
