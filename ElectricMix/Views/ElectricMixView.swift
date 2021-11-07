//
//  ElectricMixView.swift
//  ElectricMix
//
//  Created by Chris on 05/11/circleSize21.
//

import SwiftUI

struct ElectricMixView: View {
    var electricMix: ElectricMix
    private let circleSize: CGFloat = 15.0
    
    var body: some View {
        HStack (alignment: .top) {
            VStack(alignment: .leading, spacing: 4.0) {
                HStack {
                    Circle()
                        .frame(width: circleSize, height: circleSize)
                    Text("Gas")
                    Text("\(electricMix.gasPerc, specifier: "%.1f")%")
                    
                }
                .foregroundColor(GenColor.colors[0])
                
                HStack {
                    Circle()
                        .frame(width: circleSize, height: circleSize)
                    Text("Coal")
                    Text("\(electricMix.coalPerc, specifier: "%.1f")%")
                    
                }
                .foregroundColor(GenColor.colors[1])
                
                HStack {
                    Circle()
                        .frame(width: circleSize, height: circleSize)
                    Text("Nuclear")
                    Text("\(electricMix.nuclearPerc, specifier: "%.1f")%")
                }
                .foregroundColor(GenColor.colors[2])
                
                HStack {
                    Circle()
                        .frame(width: circleSize, height: circleSize)
                    Text("Wind")
                    Text("\(electricMix.windPerc, specifier: "%.1f")%")
                }
                .foregroundColor(GenColor.colors[3])
                
                HStack {
                    Circle()
                        .frame(width: circleSize, height: circleSize)
                    Text("Hydro")
                    Text("\(electricMix.hydroPerc, specifier: "%.1f")%")
                }
                .foregroundColor(GenColor.colors[4])
            }

            VStack(alignment: .leading, spacing: 4.0) {
                HStack {
                    Circle()
                        .frame(width: circleSize, height: circleSize)
                    Text("Solar")
                    Text("\(electricMix.solarPerc, specifier: "%.1f")%")
                }
                .foregroundColor(GenColor.colors[5])
                
                HStack {
                    Circle()
                        .frame(width: circleSize, height: circleSize)
                    Text("Biomass")
                    Text("\(electricMix.biomassPerc + electricMix.otherPerc, specifier: "%.1f")%")
                }
                .foregroundColor(GenColor.colors[6])
                
                HStack {
                    Circle()
                        .frame(width: circleSize, height: circleSize)
                    Text("Imports")
                    Text("\(electricMix.importsPerc, specifier: "%.1f")%")
                }
                .foregroundColor(GenColor.colors[7])
                
                HStack {
                    Circle()
                        .frame(width: circleSize, height: circleSize)
                    Text("Storage")
                    Text("\(electricMix.storagePerc, specifier: "%.1f")%")
                }
                .foregroundColor(GenColor.colors[8])
                
            }
        }
    }
}

struct ElectricMixView_Previews: PreviewProvider {
    static var mixes = ElectricData().mixes
    static var previews: some View {
        ElectricMixView(electricMix: mixes[0])
    }
}
