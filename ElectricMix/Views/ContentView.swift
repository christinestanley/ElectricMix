//
//  ContentView.swift
//  ElectricMix
//
//  Created by Chris on 05/11/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var electricData: ElectricData
    
    @State private var value: Double = 0
    private var index: Int { Int(value) }
    
    var body: some View {
        VStack {
            
            Text("Electric Mix")
                .foregroundColor(.green)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .accessibilityHeading(.h1)
            Text("GB Grid Generation")
                .font(.title3)
                .accessibilityHeading(.h3)
            Text("2009 to 2021")
                .font(.caption)
            
            
            ZStack {
                ForEach(electricData.pie.wedges, id: \.self) { wedge in
                    WedgeView(wedge: wedge)
                }
            }
            
            Text("\(Month.name[electricData.mixes[index].month]) \(String(electricData.mixes[index].year))")
            
            ElectricMixView(electricMix: electricData.mixes[index])
            
                Slider(
                    value: Binding(get: {
                        self.value
                    }, set: { (newValue) in
                        self.value = newValue
                        self.sliderChanged()
                    }),
                    in: 0...152
                )
                .padding(20.0)
            
//            Button("Choose random date") {
//                value = Double.random(in: 0...152)
//                self.sliderChanged()
//            }
        }
}
    
    func sliderChanged() {
        electricData.setCurrentMonth(to: index)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
