//
//  Pie.swift
//  ElectricMix
//
//  Created by Chris on 06/11/2021.
//

import SwiftUI

class Pie: ObservableObject {
    struct Wedge: Equatable, Hashable {
        var percentage: Double
        // width of wedge as angle in radians
        var width: Double { return percentage * Double.pi * 2 / 100 }
        var depth: Double
        var color: Color
        
        // start and end location as angle in radians
        var start = 0.0
        var end = 0.0
    }
    
    var wedges: [Wedge] = []
    
    func addWedge(_ wedge: Wedge) {
        let lastWedge = wedges.last
        var newWedge = wedge
        newWedge.start = lastWedge?.end ?? 0.0
        newWedge.end = newWedge.start + newWedge.width
        wedges.append(newWedge)
    }
    
    func updateWedge(index: Int, to percentage: Double) {
        guard wedges.count > index else { return }
        
        wedges[index].percentage = percentage
        spaceWedges()
    }
    
    func spaceWedges() {
        var start = 0.0
        for index in wedges.indices {
            wedges[index].start = start
            wedges[index].end = start + wedges[index].width
            start = wedges[index].end
        }
    }
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
