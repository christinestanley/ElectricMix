//
//  ContentView.swift
//  ElectricMix
//
//  Created by Chris on 05/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var value: Double = 0
    private var index: Int { Int(value) }
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            Text("Electricity Mix")
                .foregroundColor(.green)
                .font(.largeTitle)
                .accessibilityHeading(.h1)
            Text("GB Grid Generation")
                .accessibilityHeading(.h3)
            Spacer()
            Text("\(electricMixes[index].date)")
            Spacer()
            ElectricMixView(electricMix: electricMixes[index])
            Spacer()
            Form {
                Slider(
                    value: $value,
                    in: 0...152,
                    onEditingChanged: { editing in
                        isEditing = editing
                    }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
