//
//  ContentView.swift
//  Clima
//
//  Created by Hadir on 13/05/2024.
//

import SwiftUI
import SwiftUIX

struct ContentView: View {
    @ObservedObject var weatherViewModel = WeatherViewModel()
    var body: some View {
            ZStack {
                if let currentWeather = weatherViewModel.weatherResponse {
                    WeatherListView(response: currentWeather)
                    
                } else {
                    BackgroundView()
                    ActivityIndicator()
                        .style(.large)
                        .tintColor(AppCommon.getFontColor())
                        .frame(width: 70, height: 70)
                }
            }
            .onAppear {
                weatherViewModel.fetchWeatherResponse()
            }
        }
}

#Preview {
    ContentView()
}
