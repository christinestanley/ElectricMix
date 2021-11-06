//
//  WedgeView.swift
//  ElectricMix
//
//  Created by Chris on 06/11/2021.
//

import SwiftUI

struct WedgeView: View {
    var wedge: Pie.Wedge
    
    var body: some View {
        WedgeShape(wedge: wedge).fill(wedge.color)
    }
}

struct WedgeView_Previews: PreviewProvider {
    static var previews: some View {
        WedgeView(wedge: Pie.Wedge(percentage: 50.0, depth: 1, color: .red, start: Double.pi))
    }
}
