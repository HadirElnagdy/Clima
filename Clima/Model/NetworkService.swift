//
//  NetworkService.swift
//  Clima
//
//  Created by Hadir on 13/05/2024.
//

import Foundation

class NetworkService {
    
    // MARK: - Properties
    
    private static let apiKey = "57d0921d2ce54c4496c75056241205"
    private static let baseUrl = "https://api.weatherapi.com/v1"
    private static let session = URLSession.shared
    
    // MARK: - Public Methods
    
    static func fetchWeather(with lat: String, and lon: String, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        guard let url = URL(string: "\(baseUrl)/forecast.json?key=\(apiKey)&q=\(lat),\(lon)&days=3&aqi=yes&alerts=no") else {
            completion(.failure(WeatherError.invalidUrl))
            return
        }
//        print(url)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(WeatherError.invalidResponse))
                return
            }
            
            if let data = data {
                do {
                    let weatherData = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    completion(.success(weatherData))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}

// MARK: - Errors

enum WeatherError: Error {
    case invalidUrl
    case invalidResponse
}
