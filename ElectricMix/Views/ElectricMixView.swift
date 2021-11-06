//
//  ElectricMixView.swift
//  ElectricMix
//
//  Created by Chris on 05/11/2021.
//

import SwiftUI

struct ElectricMixView: View {
    var electricMix: ElectricMix
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Coal")
                Text("\(electricMix.coalPerc, specifier: "%.1f")%")
            }
            HStack {
                Text("Gas")
                Text("\(electricMix.gasPerc, specifier: "%.1f")%")
            }
            HStack {
                Text("Nuclear")
                Text("\(electricMix.nuclearPerc, specifier: "%.1f")%")
            }
            HStack {
                Text("Wind")
                Text("\(electricMix.windPerc, specifier: "%.1f")%")
            }
            HStack {
                Text("Hydro")
                Text("\(electricMix.hydroPerc, specifier: "%.1f")%")
            }
            HStack {
                Text("Biomass")
                Text("\(electricMix.biomassPerc, specifier: "%.1f")%")
            }
            HStack {
                Text("Imports")
                Text("\(electricMix.importsPerc, specifier: "%.1f")%")
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
