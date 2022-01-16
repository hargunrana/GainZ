//
//  CaloriesView.swift
//  GainZ 
//
//  Created by Hargun Rana on 12/06/21.
//

import SwiftUI
import SwiftUICharts



struct CaloriesView: View {
    
    @EnvironmentObject var calhargun: Cal

    
    //@State var calorieIntake: Double = 1000
    @State var diet_type = "Balanced"
    
  
    
    var carbs: Double {
        
        
        if diet_type == "Balanced" || diet_type == "Standard"{
        
            let carb_res = calhargun.calint * 0.5
            return carb_res
        }
        else if diet_type == "Low Fat"{
            
            let carb_res = calhargun.calint * 0.6
            return carb_res
        }
        else if diet_type == "High Protein"{
            
            let carb_res = calhargun.calint * 0.25
            return carb_res
        }
        
    return 0
    
    
    }
    var protein: Double{
        if diet_type == "Balanced" || diet_type == "Low Fat"{
        
            let pro_res = calhargun.calint * 0.25
            return pro_res
        }
        else if diet_type == "Standard"{
            
            let pro_res = calhargun.calint * 0.2
            return pro_res
        }
        else if diet_type == "High Protein"{
            
            let pro_res = calhargun.calint * 0.40
            return pro_res
        }
        
    return 0
    
    
    }
    var fats: Double {
        if diet_type == "Balanced" {
        
            let fat_res = calhargun.calint * 0.25
            return fat_res
        }
        else if diet_type == "Standard"{
            
            let fat_res = calhargun.calint * 0.3
            return fat_res
        }
        else if diet_type == "Low Fat"{
            
            let fat_res = calhargun.calint * 0.15
            return fat_res
        }
        else if diet_type == "High Protein"{
            
            let fat_res = calhargun.calint * 0.35
            return fat_res
        }
        return 0
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                    
                    List{
                        //calories header
                        HStack {
                            Spacer()
                            Text(String(format:"%.0f kcal",calhargun.calint)).fontWeight(.heavy).padding(.horizontal, 100).padding(.vertical,20).background(Color("Neonn")).font(.title2).cornerRadius(30).padding(.top).foregroundColor(Color(.systemBackground))
                            Spacer()
                        }
                        
                        //distribution text
                        Text("Macros Distribution:")
                        
                        //Piechart
                        VStack{
                            
                            //macros units
                            HStack{
                                
                                
                                Text(String(format:"Carbohydrates\n%.0fg\n%.0f kcal",carbs/4,carbs)).fontWeight(.semibold).foregroundColor(.pink).multilineTextAlignment(.center)
                                Spacer()
                                Text(String(format:"Proteins\n%.0fg\n%.0f kcal",protein/4,protein)).fontWeight(.semibold).foregroundColor(.blue).multilineTextAlignment(.center)
                                Spacer()
                                Text(String(format:"Fats\n%.0f\n%.0f kcal",fats/9,fats)).fontWeight(.semibold).foregroundColor(.yellow).multilineTextAlignment(.center)
                                Spacer()
                                
                            }
                            
                            //Pie Chart
                            HStack {
                                Spacer()
                                PieChartView(data: [(protein/4),(carbs/4),(fats/9)], title: "Macros",style: ChartStyle(backgroundColor: Color(.systemBackground), accentColor: Color("Neonn"), secondGradientColor: Color("Neonn"), textColor: .primary, legendTextColor: Color.gray, dropShadowColor: Color.gray))
                                Spacer()
                            }.padding()
                        }
                        
                        HStack{
                            Text("Diet Type")
                            Spacer()
                            Picker("\(diet_type)", selection: $diet_type){
                                Text("Balanced").tag("Balanced")
                                Text("Standard").tag("Standard")
                                Text("Low Fat").tag("Low Fat")
                                Text("High Protein").tag("High Protein")
                            }.pickerStyle(MenuPickerStyle())
                            
                            Text("")
                        }
                        
                        Text("Meal Distribution:")
                        
                        HStack{
                            
                            
                            Text(String(format:"Carbohydrates\n%.0fg",carbs/4)).fontWeight(.semibold).foregroundColor(.pink).multilineTextAlignment(.center)
                            Spacer()
                            Text(String(format:"Proteins\n%.0fg",protein/4)).fontWeight(.semibold).foregroundColor(.blue).multilineTextAlignment(.center)
                            Spacer()
                            Text(String(format:"Fats\n%.0fg",fats/9)).fontWeight(.semibold).foregroundColor(.yellow).multilineTextAlignment(.center)
                            Spacer()
                            
                        }
                    }
            }.navigationBarTitle("Caloric Requirement")
        }
        
    }
}

struct CaloriesView_Previews: PreviewProvider {
    static var previews: some View {
        CaloriesView()
            
            
            
    }
}
