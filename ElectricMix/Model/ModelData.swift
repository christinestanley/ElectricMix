//
//  ModelData.swift
//  ElectricMix
//
//  Created by Chris on 05/11/2021.
//

import Foundation

var electricMixes: [ElectricMix] = Bundle.main.decode([ElectricMix].self, from: "GBGridElectricityMix.json")
