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
            Text("Electricity Mix")
                .foregroundColor(.green)
                .font(.largeTitle)
                .accessibilityHeading(.h1)
            Text("GB Grid Generation")
                .accessibilityHeading(.h3)
            Spacer()
            Text("\(electricData.mixes[index].date)")
            Spacer()
            ZStack {
                ForEach(electricData.pie.wedges, id: \.self) { wedge in
                    WedgeView(wedge: wedge)
                    }
                }
            Spacer()
            ElectricMixView(electricMix: electricData.mixes[index])
            Form {
                Slider(
                    value: Binding(get: {
                        self.value
                    }, set: { (newValue) in
                        self.value = newValue
                        self.sliderChanged()
                    }),
                    in: 0...152
                )
            }
            Button("Choose random date") {
                value = Double.random(in: 0...152)
                self.sliderChanged()
            }
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
