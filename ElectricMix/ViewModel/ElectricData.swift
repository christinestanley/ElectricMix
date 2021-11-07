//
//  ElectricPie.swift
//  ElectricMix
//
//  Created by Chris on 06/11/2021.
//

import SwiftUI

class ElectricData: ObservableObject {
    
    var mixes = [ElectricMix]()
    @Published var pie = Pie()
    let depths: [Double] = [0.5, 0.5, 0.8, 1.0, 1.0, 1.0, 0.7, 0.5, 0.5]
    
    init() {
        mixes = Bundle.main.decode([ElectricMix].self, from: "GBGridElectricityMix.json")
        let initalPercs = getPercs(for: 0)
        for index in initalPercs.indices {
            let wedge = Pie.Wedge(percentage: initalPercs[index], depth: depths[index], color: GenColor.colors[index])
            pie.addWedge(wedge)
        }
    }
    
    func getPercs(for row: Int) -> [Double] {
        guard mixes.count > row else { return [] }
        
        return [
            mixes[row].gasPerc,
            mixes[row].coalPerc,
            mixes[row].nuclearPerc,
            mixes[row].windPerc,
            mixes[row].hydroPerc,
            mixes[row].solarPerc,
            mixes[row].biomassPerc + mixes[row].otherPerc,
            mixes[row].importsPerc,
            mixes[row].storagePerc,
        ]
    }
    
    func updatePie(to row: Int) {
        let percs = getPercs(for: row)
        
        guard !percs.isEmpty else { return }
        
        for i in 0..<percs.count {
            pie.updateWedge(index: i, to: percs[i])
        }
    }
    
    func setCurrentMonth(to monthIndex: Int) {
        updatePie(to: monthIndex)
    }
    
}

