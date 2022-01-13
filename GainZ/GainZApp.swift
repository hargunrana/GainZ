//
//  GainZApp.swift
//  GainZ 
//
//  Created by Hargun Rana on 04/06/21.
//

import SwiftUI
import Firebase
@main
struct GainZApp: App {
    
    init() {
        
        FirebaseApp.configure()
        
    }
    
    @StateObject var calhargun = Cal()
    
    var body: some Scene {
        WindowGroup {
            
            ContentView().environmentObject(calhargun)
            
        }
    }
}
