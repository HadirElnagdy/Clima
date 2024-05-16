//
//  WeatherViewModel.swift
//  Clima
//
//  Created by Hadir on 13/05/2024.
//


import Foundation

class WeatherViewModel: ObservableObject {
    
    @Published var weatherResponse: WeatherResponse? = nil
    let locationManager = LocationManager()
    
    init() {
        locationManager.requestLocation()
    }
    
    func fetchWeatherResponse() {
        guard let currentLocation = locationManager.location else {
            print("Location not available yet. Retrying in 1 second...")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                self?.fetchWeatherResponse()
            }
            return
        }

        NetworkService.fetchWeather(with: "\(currentLocation.latitude)", and: "\(currentLocation.longitude)") { [weak self] result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self?.weatherResponse = success
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }

}

