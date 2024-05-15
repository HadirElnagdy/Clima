//
//  CollectionView.swift
//  Clima
//
//  Created by Hadir on 15/05/2024.
//

import SwiftUI

struct CollectionView: View {
    var current: Current?
    var body: some View {
        HStack {
            VStack {
                Text("VISABILITY")
                    .font(.subheadline)
                    .foregroundColor(AppCommon.getFontColor())
                
                Text("\(Int(current?.visKM ?? 10)) Km")
                    .semibold()
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(AppCommon.getFontColor())
            }.padding(.trailing, 30)
            
            VStack {
                Text("HUMIDITY")
                    .font(.subheadline)
                    .foregroundColor(AppCommon.getFontColor())
                
                Text("\(Int(current?.humidity ?? 10))%")
                    .semibold()
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(AppCommon.getFontColor())
            }
        }

        HStack {
            VStack {
                Text("FEELS LIKE")
                    .font(.subheadline)
                    .foregroundColor(AppCommon.getFontColor())
                
                Text("\(Int(current?.feelslikeC ?? 16))\u{00B0}")
                    .semibold()
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(AppCommon.getFontColor())
            }.padding(.trailing, 30)
            
            
            VStack {
                Text("PRESSURE")
                    .font(.subheadline)
                    .foregroundColor(AppCommon.getFontColor())
                
                Text("\(Int(current?.pressureMB ?? 1021))")
                    .semibold()
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(AppCommon.getFontColor())
            }.padding(.leading, 10)
        }
        .padding([.leading, .trailing], 50)
    }
}

#Preview {
    CollectionView(current: nil)
}
