//
//  ElectricMix.swift
//  ElectricMix
//
//  Created by Chris on 05/11/2021.
//

import Foundation

struct ElectricMix: Hashable, Codable {
    var date: String
    var year: Int
    var month: Int
    var generation: Int
    var carbonIntensity: Int
    var gasPerc: Double
    var coalPerc: Double
    var nuclearPerc: Double
    var windPerc: Double
    var hydroPerc: Double
    var importsPerc: Double
    var biomasPerc: Double
    var otherPerc: Double
    var solarPerc: Double
    var storagePerc: Double
    
    enum CodingKeys: String, CodingKey {
       case date = "Date"
        case year = "Year"
        case month = "Month"
        case generation = "GENERATION"
        case carbonIntensity = "CARBON INTENSITY"
        case gasPerc = "GAS_perc"
        case coalPerc = "COAL_perc"
        case nuclearPerc = "NUCLEAR_perc"
        case windPerc = "WIND_perc"
        case hydroPerc = "HYDRO_perc"
        case importsPerc = "IMPORTS_perc"
        case biomasPerc = "BIOMASS_perc"
        case otherPerc = "OTHER_perc"
        case solarPerc = "SOLAR_perc"
        case storagePerc = "STORAGE_perc"
    }
}
