//
//  cal class.swift
//  GainZ 
//
//  Created by Hargun Rana on 12/07/21.
//

import SwiftUI

class Cal: ObservableObject{
    @Published var calint: Double = 10
    
    
    func add(calval: Double) {
        calint = calval
    }
}
