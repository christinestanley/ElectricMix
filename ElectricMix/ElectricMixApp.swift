//
//  ElectricMixApp.swift
//  ElectricMix
//
//  Created by Chris on 05/11/2021.
//

import SwiftUI

@main
struct ElectricMixApp: App {
    @StateObject private var electricData = ElectricData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(electricData)
        }
    }
}
