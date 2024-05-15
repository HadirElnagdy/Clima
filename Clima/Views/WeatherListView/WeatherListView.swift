//
//  WeatherListView.swift
//  Clima
//
//  Created by Hadir on 12/05/2024.
//
import SwiftUI
import SwiftUIX

struct WeatherListView: View {
    let response: WeatherResponse?
    var body: some View {
        NavigationView {
            ZStack{
                BackgroundView()
                if let response = response {
                    VStack{
                        Spacer()
                        Text(response.location?.name ?? "")
                            .foregroundColor(AppCommon.getFontColor())
                            .font(.largeTitle)
                            .bold()
                        Text("\(Int(response.current?.tempC ?? 0))\u{00B0}")
                            .foregroundColor(AppCommon.getFontColor())
                            .font(.largeTitle)
                            .foregroundColor(AppCommon.getFontColor())
                        Text(response.current?.condition?.text ?? "")
                            .font(.title)
                            .foregroundColor(AppCommon.getFontColor())
                        
                        HStack{
                            Text("H: \(Int(response.forecast?.forecastday?[0].day?.maxtempC ?? 0))\u{00B0}")
                                .font(.title)
                                .foregroundColor(AppCommon.getFontColor())
                            Text("L: \(Int(response.forecast?.forecastday?[0].day?.mintempC ?? 0))\u{00B0}")
                                .font(.title)
                                .foregroundColor(AppCommon.getFontColor())
                        }
            
                        Image(AppCommon.getIconName(urlString: response.current?.condition?.icon))
                            .resizable()
                            .frame(width: 65, height: 65)
                        
                        ListView(forecast: response.forecast)
                        Spacer()
                        CollectionView(current: response.current)
                        
                    }
                  
                    
                }else{
                    ActivityIndicator()
                        .style(.large)
                        .tintColor(AppCommon.getFontColor())
                        .frame(width: 70, height: 70)
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListView(response: nil)
    }
}

