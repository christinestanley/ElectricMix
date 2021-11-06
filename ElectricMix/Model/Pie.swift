//
//  Pie.swift
//  ElectricMix
//
//  Created by Chris on 06/11/2021.
//

import SwiftUI

class Pie: ObservableObject {
    struct Wedge: Equatable, Hashable {
        // width of wedge as angle in radians
        var width: Double
        var depth: Double
        var color: Color
        
        // start and end location as angle in radians
        var start = 0.0
        var end = 0.0
    }
    
    var wedges: [Wedge] = [
        Wedge(width: 0, depth: 0.5, color: .black, start: 0, end: Double.pi * 2 * 0.472 ),
        Wedge(width: 0, depth: 0.5, color: .teal, start: Double.pi * 2 * 0.472, end: Double.pi * 2 * 0.816 ),
        Wedge(width: 0, depth: 0.7, color: .gray , start: Double.pi * 2 * 0.816, end: Double.pi * 2 * 0.951 ),
        Wedge(width: 0, depth: 1.0, color: .green , start: Double.pi * 2 * 0.951, end: Double.pi * 2 * 0.965 ),
        Wedge(width: 0, depth: 1.0, color: .blue , start: Double.pi * 2 * 0.965, end: Double.pi * 2 * 0.977 ),
        Wedge(width: 0, depth: 0.5, color: .orange , start: Double.pi * 2 * 0.977, end: Double.pi * 2 * 1.00 ),
        ]
}

extension Pie.Wedge: Animatable {
    typealias AnimatableData = AnimatablePair<AnimatablePair<Double,Double>, Double>
    
    var animatableData: AnimatableData {
        get {
            .init(.init(start, end), .init(depth))
        }
        set {
            start = newValue.first.first
            end = newValue.first.second
            depth = newValue.second
        }
    }
}
