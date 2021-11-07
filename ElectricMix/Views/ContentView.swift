//
//  ContentView.swift
//  ElectricMix
//
//  Created by Chris on 05/11/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var electricData: ElectricData
    
    @State private var sliderValue: Double = 0
    private var dataRow: Int { Int(sliderValue) }
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var isWalking = false
    
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
            
            Text("\(Month.name[electricData.mixes[dataRow].month]) \(String(electricData.mixes[dataRow].year))")
            
            ElectricMixView(electricMix: electricData.mixes[dataRow])
            
            HStack(spacing: 10.0) {
                Slider(
                    value: Binding(get: {
                        self.sliderValue
                    }, set: { (newValue) in
                        self.sliderValue = newValue
                        self.sliderChanged()
                    }),
                    in: 0...152,
                    step: 1
                )
                    .accentColor(Color.green)
                    .padding(20.0)
                
                
                Button(action: {
                    isWalking.toggle()
                }) {
                    HStack {
                        isWalking ?
                        Image(systemName: "figure.walk.circle.fill")
                            .font(.largeTitle)
                        :
                        Image(systemName: "figure.walk.circle")
                            .font(.largeTitle)
                    }
                }
                
            }
            .foregroundColor(.green)
            .padding(.horizontal, 20.0)
        }
        .onReceive(timer) { _ in
            if isWalking {
                sliderValue = Double((dataRow + 1) % 153)
                self.sliderChanged()
            }
        }
    }
    
    func sliderChanged() {
        electricData.setCurrentMonth(to: dataRow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
