//
//  view 3.swift
//  tabview
//
//  Created by Hargun Rana on 23/04/21.
//

import SwiftUI
struct AboutGainZ: View {
    var body: some View{
        
        NavigationView{
            
        
            List{
                HStack {
                    Spacer()
                    Image("logo").resizable().scaledToFit().frame(width: 200).padding(18.0)
                    Spacer()
                }
                
                
                //github
                HStack {
                    
                    Text("GitHub")
                    Spacer()
                    Link(destination: URL(string: "https://github.com/hargunrana")!){
                        Text("@hargunrana").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }.padding(.trailing, 20.0)
                    
                    
                }
                
                //Instagram
                HStack {
                    
                    Text("Instagram")
                    Spacer()
                    Link(destination: URL(string: "https://www.instagram.com/hargunrana/")!){
                        Text("@hargunrana").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }.padding(.trailing, 20.0)
                    
                    
                }
                
                // linkedin
                HStack {
                    
                    Text("LinkedIn")
                    Spacer()
                    Link(destination: URL(string: "https://www.linkedin.com/in/hargunrana/")!){
                        Text("Hargun Rana").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }.padding(.trailing, 20.0)
                    
                    
                }
                
                //email
                HStack {
                    
                    Text("E-mail")
                    Spacer()
                    Link(destination: URL(string: "https://www.gmail.com")!){
                        Text("hargun.rana1 @gmail.com").foregroundColor(.blue)
                    }.padding(.trailing, 20.0)
                    
                    
                }
                
                
                
                
                Text("GainZ - 2021: Project created for Completion of B-Tech in Computer Science Engineering").font(.caption).multilineTextAlignment(.center).foregroundColor(.secondary)
            }.navigationBarTitle("About GainZ")
        
        }
        
    }
    
}

struct AboutGainZ_Previews: PreviewProvider {
    static var previews: some View {
        AboutGainZ()
            
            
            
    }
}

