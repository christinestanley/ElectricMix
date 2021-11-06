//
//  WedgeShape.swift
//  ElectricMix
//
//  Created by Chris on 06/11/2021.
//

import SwiftUI

struct WedgeShape: Shape {
    var wedge: Pie.Wedge
    
    func path(in rect:CGRect) -> Path {
        let points = WedgeGeometry(wedge, in: rect)
        
        var path = Path()
        path.addArc(center: points.center, radius: points.outerRadius,
                                     startAngle: .radians(wedge.end), endAngle: .radians(wedge.start),
                                     clockwise: true)
        path.addLine(to: points[.topLeading])
        path.addArc(center: points.center, radius: points.innerRadius,
            startAngle: .radians(wedge.start), endAngle: .radians(wedge.end),
            clockwise: false)
        path.closeSubpath()
        
        return path
    }
    
    var animatableData: Pie.Wedge.AnimatableData {
        get { wedge.animatableData }
        set { wedge.animatableData = newValue }
    }
}

// Helper type for creating the points of the wedge
private struct WedgeGeometry {
    var wedge: Pie.Wedge
    var center: CGPoint
    var innerRadius: CGFloat
    var outerRadius: CGFloat
    
    init(_ wedge: Pie.Wedge, in rect: CGRect) {
        self.wedge = wedge
        center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) * 0.5
        innerRadius = radius / 4
        outerRadius = innerRadius + (radius - innerRadius) * CGFloat(wedge.depth)
    }
    
    //From Apple WWDC 2019 Session 237
    
    /// Returns the view location of the point in the wedge at unit-
    /// space location `unitPoint`, where the X axis of `p` moves around the
    /// wedge arc and the Y axis moves out from the inner to outer
    /// radius.
    subscript(unitPoint: UnitPoint) -> CGPoint {
        let radius = lerp(innerRadius, outerRadius, by: unitPoint.y)
        let angle = lerp(wedge.start, wedge.end, by: Double(unitPoint.x))

        return CGPoint(x: center.x + CGFloat(cos(angle)) * radius,
                       y: center.y + CGFloat(sin(angle)) * radius)
    }
    
    /// Linearly interpolate from `from` to `to` by the fraction `amount`.
    private func lerp<T: BinaryFloatingPoint>(_ fromValue: T, _ toValue: T, by amount: T) -> T {
        return fromValue + (toValue - fromValue) * amount
    }

}
