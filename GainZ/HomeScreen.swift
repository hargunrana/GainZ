//
//  Homeeee.swift
//  GainZ 
//
//  Created by Hargun Rana on 07/06/21.
//

import SwiftUI

struct HomeScreen: View {
    
    var body: some View {
        TabView(selection: .constant(1),
                content:  {
                    ProfileView().tabItem {
                        
                        VStack {
                            Image(systemName: "person.fill")
                            Text("Profile")
                        }
                        
                    }.tag(1)
                    
                    CaloriesView().tabItem {
                        
                        VStack {
                            
                            Image(systemName: "chart.pie.fill")
                            Text("Macros")
                        }
                        
                    }.tag(2)
                    
                    AboutGainZ().tabItem {
                        
                        VStack {
                            
                            Image(systemName: "rectangle.grid.1x2.fill")
                            Text("About GainZ")
                        }
                        
                    }.tag(3)
                }).accentColor(/*@START_MENU_TOKEN@*/Color("Neonn")/*@END_MENU_TOKEN@*/)
                
            
        
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
