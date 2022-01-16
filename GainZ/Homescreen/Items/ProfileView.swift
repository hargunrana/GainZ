//
//  ContentView.swift
//  profile view
//
//  Created by Hargun Rana on 14/05/21.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    init() {
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = UIColor(Color("Neonn"))
    }
    
    @EnvironmentObject var calhargun: Cal
    
    @State var name = ""
    @State var gender = "Choose"
    @State var age = ""
    @State var height_feet = "3"
    @State var height_inch = "0"
    @State var weight = ""
    
    @State var meals = "3"
    @State var sleepp = "8"
    @State var activityLevel = "low"
    @State var goal = "Choose"
    
    @State var bmr_alert = false
    
  //  @EnvironmentObject var cal : Cal
    
    var final_height:Double{
        
        let res_height = (((Double(height_feet) ?? 0)*12) + (Double(height_inch) ?? 0)) * 0.025
        return res_height
        
    }
    
    var bmi: Double{
       
        let res_bmi = (Double(weight) ?? 0)/(pow(final_height,2))
    
        return res_bmi
    }
    
    var bmr: Double{
        
        if gender == "Male" {
            
            let res1 = (88.362 + (13.397 * (Double(weight) ?? 0)))
            let res2 = (4.799 * (final_height * 100)) - (5.677 * (Double(age) ?? 0))
            let res_bmr = res1 + res2
            return res_bmr
        }
        else if gender == "Female"{
            
            let res1 = (447.593 + (9.247 * (Double(weight) ?? 0)))
            let res2 = (3.098 * (final_height * 100)) - (4.330 * (Double(age) ?? 0))
            let res_bmr = res1 + res2
            return res_bmr
            
        }
        
        return 0
        
    }
    
    var waterIntake: Double{
        var res_water = ((Double(weight) ?? 0) * 2.2) * (2/3) * 29.5735
        
        if activityLevel == "Moderate"{
            res_water = res_water + (18 * 29.5735)
            return res_water
        }
        else if activityLevel == "High Moderate"{
            res_water = res_water + (24 * 29.5735)
            return res_water
        }
        else if activityLevel == "Very High"{
            res_water = res_water + (36 * 29.5735)
            return res_water
        }
        else if activityLevel == "HyperActive"{
            res_water = res_water + (48 * 29.5735)
            return res_water
        }
        return res_water
    }
    
    var calorieIntake: Double{
        var cal_res = bmr
        
        if activityLevel == "Low"{
            cal_res = cal_res * 1.2
        }
        else if activityLevel == "Moderate"{
            cal_res = cal_res * 1.375
        }
        else if activityLevel == "High Moderate"{
            cal_res = cal_res * 1.55
        }
        else if activityLevel == "Very High"{
            cal_res = cal_res * 1.725
        }
        else if activityLevel == "HyperActive"{
            cal_res = cal_res * 1.9
        }
        
        //Based on Goal
        if goal == "Lose Weight"{
            cal_res = cal_res * 0.8
            
            return cal_res
        }
        else if goal == "Lose Weight Slowly"{
            cal_res = cal_res * 0.9
            
            return cal_res
        }
        else if goal == "Lose Weight"{
            cal_res = cal_res * 0.8
           
            return cal_res
        }
        else if goal == "Increase Weight Slowly"{
            cal_res = cal_res * 1.1
            
            return cal_res
        }
        else if goal == "Increase Weight"{
            cal_res = cal_res * 1.2
           
            return cal_res
        }
        
        //calhargun.add(calval: cal_res)
        
        return cal_res
    }
    
    var goal_suggested: String{
        
        let bmii:Double = bmi
        if bmii <= 18 {
            let res = "Gain-Weight"
            return res
        }
        else if bmii >= 20.0 && bmii <= 24.0{
            let res = "Get-Fit"
            return res
        }
        else if bmii > 24{
            let res = "Lose-Weight"
            return res
        }
        return ""
    }
        
    var body: some View{
        
            NavigationView {
                
                
                    Form{
                        
                        //Section 1: Personal Information
                        Section(header: Text("personal information")){
                            
                            //Name
                            HStack{
                                Text("Name:")
                                Spacer()
                                
                                TextField("", text: $name)
                                    .frame(width: 200)
                                    .foregroundColor(Color("Neonn"))
                                    .multilineTextAlignment(.trailing)
                            
                            }
                            
                            //Gender
                            HStack{
                                Text("Gender:")
                                Spacer()
                                HStack{
                                    Picker("\(gender)", selection: $gender){
                                        Text("Male").tag("Male")
                                        Text("Female").tag("Female")
                                        
                                    }.pickerStyle(MenuPickerStyle())
                                }
                            }
                            
                            //Age
                            HStack{
                                Text("Age:")
                                Spacer()
                                HStack {
                                    
                                    TextField("", text: $age)
                                        .frame(width: 30)
                                        .keyboardType(.decimalPad)
                                        .foregroundColor(Color("Neonn"))
                                        .multilineTextAlignment(.trailing)
                                    Text("Years").foregroundColor(Color("Neonn"))
                                    
                                }
                            }
                            
                            //Height
                            HStack {
                                Text("Height:")
                                
                                Spacer()
                                
                                HStack{
                                    
                                    
                                    Picker("\(height_feet) Feet ", selection: $height_feet){
                                        
                                        Text("3").tag("3")
                                        Text("4").tag("4")
                                        Text("5").tag("5")
                                        Text("6").tag("6")
                                        Text("7").tag("7")
                                        
                                    }.pickerStyle(MenuPickerStyle())
                                    
                                    Picker("\(height_inch) Inches ", selection: $height_inch){
                                        
                                        //Text("0").tag("0")
                                        Text("0").tag("0")
                                        Text("2").tag("2")
                                        Text("3").tag("3")
                                        Text("4").tag("4")
                                        Text("5").tag("5")
                                        Text("6").tag("6")
                                        Text("7").tag("7")
                                        Text("8").tag("8")
                                        Text("9").tag("9")
                                        Text("10").tag("10")
                                        //  Text("11").tag("11")
                                        
                                        
                                    }.pickerStyle(MenuPickerStyle())
                                }
                                
                                
                            }
                            
                            //Weight
                            HStack{
                                Text("Weight:")
                                Spacer()
                                HStack {
                                    
                                    TextField("", text: $weight)
                                        .frame(width: 30)
                                        .keyboardType(.decimalPad)
                                        .foregroundColor(Color("Neonn"))
                                    Text("Kg").foregroundColor(Color("Neonn"))
                                    
                                }
                            }
                            
                        }.onTapGesture{ self.hideKeyboard() }
                        
                        
                        //Section 2: Goal Information
                        Section(header: Text("goal information")){
                            
                            
                            //Meals
                            HStack{
                                Text("Meals:")
                                Spacer()
                                HStack {
                                    
                                    Picker("\(meals)", selection: $meals){
                                        
                                        //Text("0").tag("0")
                                        Text("0").tag("0")
                                        Text("2").tag("2")
                                        Text("3").tag("3")
                                        Text("4").tag("4")
                                        Text("5").tag("5")
                                        
                                        
                                        
                                    }.pickerStyle(MenuPickerStyle())
                                }
                                
                            }
                            
                            //Sleep
                            HStack{
                                Text("Sleep:")
                                Spacer()
                                HStack {
                                    
                                    Picker("\(sleepp)", selection: $sleepp){
                                        
                                        //Text("0").tag("0")
                                        Text("8").tag("8")
                                        Text("7").tag("7")
                                        Text("6").tag("6")
                                        Text("5").tag("5")
                                        
                                        
                                        
                                    }.pickerStyle(MenuPickerStyle())
                                }
                                
                            }
                            
                            //Goal
                            HStack{
                                Text("Goal:")
                                Spacer()
                                HStack{
                                    Picker("\(goal)", selection: $goal){
                                        Text("Lose Weight").tag("Lose Weight")
                                        Text("Lose Weight Slowly").tag("Lose Weight Slowly")
                                        Text("Maintain Weight").tag("Maintain Weight ")
                                        Text("Increase Weight Slowly").tag("Increase Weight Slowly")
                                        Text("Increase Weight ").tag("Increase Weight")
                                        
                                    }.pickerStyle(MenuPickerStyle())
                                }
                            }
                            
                            //Activity Level
                            HStack{
                                
                                Picker("Activity Level:", selection: $activityLevel){
                                    
                                    //Low
                                    VStack(alignment: .leading) {
                                        Text("Low")
                                        Text("Little or no exercise").font(.footnote).foregroundColor(.gray).padding(.top, -3.0)
                                        
                                    }
                                    .padding(.vertical, 5.0)
                                    .tag("Low")
                                    
                                    //Moderate
                                    VStack(alignment: .leading) {
                                        Text("Moderate")
                                        Text("Light exercise sport 1-3 times per week").font(.footnote).foregroundColor(.gray).padding(.top, -3.0)
                                        
                                    }
                                    .padding(.vertical, 5.0)
                                    .tag("Moderate")
                                    
                                    //High Moderate
                                    VStack(alignment: .leading) {
                                        Text("High Moderate")
                                        Text("Moderate exercise 3-5 times per week").font(.footnote).foregroundColor(.gray).padding(.top, -3.0)
                                        
                                    }
                                    .padding(.vertical, 5.0)
                                    .tag("High Moderate")
                                    
                                    //Very High
                                    VStack(alignment: .leading) {
                                        Text("Very High")
                                        Text(" Intense exercise 6-7 days per week").font(.footnote).foregroundColor(.gray).padding(.top, -3.0)
                                        
                                    }
                                    .padding(.vertical, 5.0)
                                    .tag("Very High")
                                    
                                    
                                    //HyperActive
                                    VStack(alignment: .leading) {
                                        Text("HyperActive")
                                        Text("Very intense exercise, 2 hours or more  sports").font(.footnote).foregroundColor(.gray).padding(.top, -3.0)
                                        
                                    }
                                    .padding(.vertical, 5.0)
                                    .tag("HyperActive")
                                    
                                    
                                    
                                }
                                
                            }
                            
                           //Save Button
                            Button(action: {
                                
                                calhargun.add(calval: calorieIntake )
                                
                                // self.AddData(name: self.name, height_feet: self.height_feet, height_inch: self.height_inch, weight: self.weight, gender: self.gender, age: self.age, activityLevel: self.activityLevel, goal: self.goal)
                                
                            }) {
                                HStack {
                                    Spacer()
                                    Text("Save").font(.title2).fontWeight(.heavy).foregroundColor(Color("Neonn")).padding(.vertical, 5.0)
                                    Spacer()
                                }
                            }
                            
                        }.onTapGesture{ self.hideKeyboard() }
                        
                        
                        
                        //Section 3: Results
                        Section(header: Text("results")){
                            
                            //goal suggested
                            HStack {
                                                            
                                Label {
                                    Text("Goal Suggested").foregroundColor(.primary)
                                    
                                } icon: {
                                    Image("exercises").resizable().scaledToFit().frame(width: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }
                                
                                Spacer()
                                Text("\(goal_suggested)").foregroundColor(Color("Neonn"))
                                
                            }
                            
                            //Basal Metabolic Rate
                            Button(action: {self.bmr_alert.toggle()}){
                                
                                HStack {
                                                                
                                    Label {
                                        Text("Basal Metabolic Rate").foregroundColor(.primary)
                                        
                                    } icon: {
                                        Image(systemName: "flame.fill")
                                            .foregroundColor(Color(hue: 0.102, saturation: 0.976, brightness: 1.0))
                                    }
                                    
                                    Spacer()
                                    Text(String(format: "%.0f kcal", bmr)).foregroundColor(Color("Neonn"))
                                    
                                }
                            }
                            
                            // Body Mass Index
                            NavigationLink(destination: BmiView(bmi_res: self.bmi)) {
                                HStack {
                                    
                                    Label {
                                        Text("Body Mass Index")
                                            
                                    } icon: {
                                        Image(systemName: "oval.portrait.fill")
                                            .foregroundColor(Color(hue: 0.132, saturation: 0.976, brightness: 1.0))
                                        }
                                    Spacer()
                                    Text(String(format: "%.2f", bmi)).foregroundColor(Color("Neonn"))
                                }
                            }
                            
                            //Water Intake
                            NavigationLink(destination: WaterIntake(water_res: self.waterIntake))  {
                                HStack {
                                    
                                    Label {
                                        Text("Water Intake")
                                            
                                    } icon: {
                                        Image("waterIntake").resizable().scaledToFit().frame(width: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            
                                        }
                                    Spacer()
                                    Text(String(format: "%.0f ml", waterIntake)).foregroundColor(Color("Neonn"))
                                }
                            }
                            
                            // Daily Caloric requirement
                            NavigationLink(destination: CaloriesView()) {
                                HStack {
                                    
                                    Label {
                                        Text("Caloric requirement")
                                            
                                    } icon: {
                                        Image("firee").resizable().scaledToFit().frame(width: 23, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            
                                        }
                                    Spacer()
                                   Text(String(format: "%.0f kcal", calorieIntake)).foregroundColor(Color("Neonn"))
                                }
                            }
                        
                            
                            
                            
                        }.onTapGesture{ self.hideKeyboard() }
                        
                        
                        //Section 4: My Content
                        
                    }
                    .navigationTitle("Profile")
                    .alert(isPresented: $bmr_alert){
                        // BMR Alert
                        Alert(title: Text("Basal Metabolic Rate"), message: Text("It's what your body uses just to live without an extra activity, as can be walking, sports, work or any other physical activity."), dismissButton: .default(Text("OK") ) )
                    }
                    .toolbar{
                        //Log Out Button
                        Button(action: {
                            try! Auth.auth().signOut()
                            UserDefaults.standard.set( false, forKey: "status")
                            NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                        }){
                            Text("Log Out")
                        }
                    }
            }.environmentObject(calhargun)
       
    }
    
    
    
    /*
    func AddData(name: String, height_feet: String, height_inch: String, weight: String, gender: String, age: String, activityLevel: String, goal: String){
        
        
        let db = Firestore.firestore()
        db.collection("Users").document().setData(["Name": name, "Height in feet": height_feet, "Height in Inches": height_inch, "Weight": weight, "Gender": gender, "Age": age, "Activity Level": activityLevel, "Goal": goal   ])
        
    }
    
    func GetData(){
        let db = Firestore.firestore()
        db.collection("Users").addSnapshotListener{(snap,err) in
            
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
           // name = i.document.get("Name") as! String
            
            
        }
    }
    */
    
}

struct BmiView: View {
    
    var bmi_res:Double = 0
    
    var body: some View{
        
        
            VStack {
                Text(String (format: "%.2f", bmi_res)).fontWeight(.heavy).padding(.horizontal, 100).padding(.vertical,20).background(Color("Neonn")).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/).cornerRadius(30).padding(.top).foregroundColor(Color(.systemBackground))
                
                List{
                    HStack{
                      
                        Text("< 16.00")
                        Spacer()
                        Text("Very Severely Underweight").font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/).multilineTextAlignment(.trailing)
                        
                        
                    }.font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
                    
                    HStack{
                        
                        Text("16.00 - 16.99")
                        Spacer()
                        Text("Severely Underweight").multilineTextAlignment(.trailing)
                       
                        
                    }.font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
                
                    HStack{
                        
                        Text("17.00-18.49")
                        Spacer()
                        Text("Underweight").multilineTextAlignment(.trailing)
                       
                        
                    }.font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
                    
                    HStack{
                        
                        Text("18.50-24.99")
                        Spacer()
                        Text("Normal (Healthy weight)").multilineTextAlignment(.trailing)
                        
                        
                    }.font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
                    
                    HStack{
                        
                        Text("25.00-29.99")
                        Spacer()
                        Text("Overweight").multilineTextAlignment(.trailing)
                        
                        
                    }.font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
                    
                    HStack{
                        
                        Text("30.00 - 34.99")
                        Spacer()
                        Text("Obese Class I (Moderately Obese)").multilineTextAlignment(.trailing)
                        
                        
                    }.font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
                    
                    HStack{
                    
                        Text("35.00 - 40.00")
                        Spacer()
                        Text("Obese Class II (Severely Obese)").multilineTextAlignment(.trailing)
                       
                    }.font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
                    
                    VStack(spacing: 5){
                       HStack{
                        
                        Text("40.00 <")
                        Spacer()
                        Text("Obese Class III (Very Severely Obese)").multilineTextAlignment(.trailing)
                        
                        
                       }.font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
                        Spacer()
                        Text("BMi is particularly inaccurate for people who are very fit or athletic, as their high muscle mass can classify them in the overweight category by BMI").font(.caption).foregroundColor(.secondary)
                        
                    }.font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
                }
            }.navigationBarTitle("Body Mass Index",displayMode: .inline)
        
    }
}

struct WaterIntake: View {
    
    var water_res:Double = 0
    
    var body: some View{
        
        
            VStack {
                Text(String (format: "%.0f ml", water_res)).fontWeight(.heavy).padding(.horizontal, 100).padding(.vertical,20).background(Color("Neonn")).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/).cornerRadius(30).padding(.top).foregroundColor(Color(.systemBackground))
                
                List{
                    
                    
                    HStack{
                        Text("Water Requirement:")
                        Spacer()
                        Text(String (format: "%.2f ml", water_res))
                    }.padding(.top, 10.0).padding(.bottom,10).font(.callout)
                    
                    VStack(alignment: .leading){
                       
                        Text("Water Keeps Your organs functioning properly, particularly your kidneys. Drinking enough water also aids digestion, and it can even increase your calorie burn").font(.caption).foregroundColor(.secondary)
                        Spacer()
                        Text("When you don't drink enough water your athletic potential is also reduced. Even slight dehydration can cause a major decrease in performance").font(.caption).foregroundColor(.secondary)
                        Spacer()
                        Text("Please note that this is only an estimate. Water requirement per person does vary depending on various crucial lifestyle and health factors so it is difficult to apply a general rule").font(.caption).foregroundColor(.secondary)
                        
                    }.padding()
                }
            }.navigationBarTitle("Water Requirement",displayMode: .inline)
        
    }
}

    
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}





