//
//  ContentView.swift
//  GainZ
//
//  Created by Hargun Rana on 04/06/21.
//

import SwiftUI
import Firebase
// http://github.com/firebase/firebase-ios-sdk.git

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct Launch: View {
    @Binding var show:  Bool
    var body: some View {
        NavigationView {
            VStack{
                
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Welcome to").fontWeight(.heavy)
                        Text("GainZ").fontWeight(.heavy).foregroundColor(Color("Neonn"))
                        
                    }.padding(.leading, 30.0)
                    Spacer()
                }.font(.largeTitle)
                
                Spacer()
                
                Image("logo").resizable().scaledToFit().frame(width: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(.bottom, 47.0)
                
                Spacer()
                
                NavigationLink(destination:  Login(show: self.$show).navigationBarHidden(true)) {
                    Text("Continue").font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                        .fontWeight(.black)
                        .padding(.horizontal, 130.0).padding()
                        .background(Color("Neonn"))
                        .foregroundColor(Color(.systemBackground))
                        .cornerRadius(15)
                }
               
                Spacer()
                
            }
        }
        
    }
}

struct Home: View {
    init() {
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = UIColor(Color("Neonn"))
    }
    @State var show = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View{
        
        VStack{
            if self.status{
                
                HomeScreen()
                
            }
            else{
                
                Launch(show:self.$show)
                
                
                
            }
            
        }.accentColor(Color("Neonn"))
        .onAppear{
            NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main){ (_) in
                
                self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                
            }
        }
        
        
        
    }
}

struct Login: View {
    
    
    
    @State var email=""
    @State var password=""
    @State var visible = false
    @Binding var show:  Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        // Main Of the Login View
      
        
        NavigationView {
            ZStack(alignment: .bottom){
                    
                
                        // Main Items: Image, Title, Textboxes, Buttons
                        VStack(spacing: 0.5){
                          
                            Image("logo").resizable().frame(width: 100, height: 100, alignment: .center)
                                .padding(.top, 130.0)
                            
                            TextField("Email", text: $email) // Email Text-Box
                                .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
                                .disableAutocorrection(true)
                                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                .padding(.all, 12.0)
                                .background(VisualEffectBlur(blurStyle: .systemThinMaterial)).cornerRadius(6)
                                .background(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 0.5))
                                .padding(.top,40)
                               
                            
                            
                            //Password Text-Box
                            HStack {
                                
                                // Text-Boxes
                                VStack {
                                    if self.visible
                                    {
                                        TextField("Password", text: self.$password)
                                    }
                                    
                                    else
                                    {
                                        SecureField("Password", text: self.$password)
                                        
                                    }
                                    
                                    
                                }
                                 
                                //Show/Hide Eye Button
                                Button(action:{ self.visible.toggle()}){
                                
                                    Image(systemName: self.visible ?  "eye.slash.fill": "eye.fill")
                                        .foregroundColor(Color.gray)
                                        
                                }
                            }
                            .font(.callout)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .padding(.all,12)
                            .background(VisualEffectBlur(blurStyle: .systemThinMaterial)).cornerRadius(6)
                            .background(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 0.5))
                            .padding(.top,12)
                               
                            
                            
                            // Forgot Password Button
                            HStack {
                                Spacer()
                                Button(action:{
                                    self.reset( )
                                }) {
                                
                                    Text("Forgotten password?")
                                        .font(.footnote)
                                        .fontWeight(.black)
                                        .foregroundColor(Color("Neonn"))
                                        
                                        
                                }
                                
                               
                            }
                            .padding(.top,15)
                            
                            
                            // Login Buttons
                            VStack{
                                
                                // Login Button
                                Button( action: { self.verify()
                                    
                                } ){
                                Text("Log In")
                                    .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemBackground))
                                    .padding(.all,12)
                                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("Neonn")/*@END_MENU_TOKEN@*/)
                                    .frame(width: UIScreen.main.bounds.width - 35)
                                    
                            }
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("Neonn")/*@END_MENU_TOKEN@*/)
                                .cornerRadius(6)
                                .padding(.top,15)
                                .padding(.bottom,5)
                                
                                
                            }
                            
                            Spacer()
                                       
                            
                        }
                        .padding(.horizontal,25).onTapGesture{ self.hideKeyboard() }
                
                
                       //Sign Up Button
                    HStack {
                        
                        Text(" Don't have an account?")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        NavigationLink(destination: Signup(show: self.$show)){
                                                Text("Sign Up")
                                                    .font(/*@START_MENU_TOKEN@*/.caption/*@END_MENU_TOKEN@*/)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(Color("Neonn"))
                        }
                    
                                
                    }.padding(.bottom,5)

                
               
                
            }.navigationBarTitle("Login").navigationBarBackButtonHidden(true)
                .alert(isPresented: $alert){
                    // Login
                    Alert(title: Text("Error"), message: Text(error), dismissButton: .default(Text("OK") ) )
                }
        }
    
    }
    
    // Function To Sign-In Using FIREBASE
    func verify(){
        if self.email != "" && self.password != ""{
            
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                if error != nil
                {
                    self.error = error!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                print("success")
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                
            }
        }
        else{
            self.error = "Please Fill all the Contents properly"
            self.alert.toggle()
        }
    }
    
    //Function To Reset The Password
    func reset(){
        if self.email != "" {
            
            Auth.auth().sendPasswordReset(withEmail: self.email){ err in
                
                if err != nil{
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                self.error = "RESET"
                self.alert.toggle()
            }
        }
        else{
            self.error = "Email Id is empty"
            self.alert.toggle()
        }
        
    }
    
}
   
struct Signup: View {
    
    
    @State var email = ""
    @State var password = ""
    @State var repass = ""
    
    @State var visible = false
    @State var revisible = false
   
    @Binding var show :  Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View{
        VStack(alignment: .center){
                //Spacer()
                Image("logo").resizable().frame(width: 100, height: 100, alignment: .center).padding(.top, 180.0)
                
                TextField("Email", text: $email)
                    .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
                    .disableAutocorrection(true)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .padding(.all, 12.0)
                    .background(VisualEffectBlur(blurStyle: .systemThinMaterial)).cornerRadius(6)
                    .background(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 0.5))
                    .padding(.top,40)
                    
                
                
                HStack(spacing:15){
                
                    VStack
                    {
                        if self.visible
                        {
                            TextField("Password", text: self.$password)
                                .autocapitalization(.none)
                        }
                        
                        else
                        {
                            SecureField("Password", text: self.$password)
                                .autocapitalization(.none)
                        }
                        
                        
                        }
                    Button(action:{self.visible.toggle()}){
                        
                            Image(systemName: self.visible ?  "eye.slash.fill": "eye.fill")
                                .foregroundColor(.gray)
                            
                        }
                }
                .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
                .disableAutocorrection(true)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .padding(.all, 12.0)
                .background(VisualEffectBlur(blurStyle: .systemThinMaterial)).cornerRadius(6)
                .background(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 0.5))
                .padding(.top,12)
                    
                
                HStack(spacing:15){
                
                    VStack
                    {
                        if self.revisible
                        {
                            TextField("Re-enter Password", text: self.$repass)
                                .autocapitalization(.none)
                        }
                        
                        else
                        {
                            SecureField("Re-enter Password", text: self.$repass)
                                .autocapitalization(.none)
                        }
                        
                        
                        }
                        Button(action:{self.revisible.toggle()})
                        {
                            Image(systemName: self.revisible ?  "eye.slash.fill": "eye.fill")
                                .foregroundColor(.gray)
                            
                    }
                }
                .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
                .disableAutocorrection(true)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .padding(.all, 12.0)
                .background(VisualEffectBlur(blurStyle: .systemThinMaterial)).cornerRadius(6)
                .background(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 0.5))
                .padding(.top,12)
                
                
                
                    
                Button(action: {
                        
                    self.register()
                })
                {
                    
                    Text("Sign Up")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemBackground))
                        .padding(.all,12)
                        .frame(width: UIScreen.main.bounds.width - 35)
                }
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("Neonn")/*@END_MENU_TOKEN@*/)
                .cornerRadius(6)
                .padding(.top,15)
                
                
                        Spacer()
                        Spacer()
                            
                
        }.navigationBarTitle("Sign-up", displayMode: .inline)
        .padding(.horizontal,25)
        .alert(isPresented: $alert){
            // Login
            Alert(title: Text("Error"), message: Text(error), dismissButton: .default(Text("OK") ) )
        }
        .onTapGesture{ self.hideKeyboard() }
      
    }
            
    func register(){
        if self.email != ""{
            if self.password == self.repass {
                Auth.auth().createUser(withEmail: self.email , password: self.password){
                    (res, err) in
                    
                    if err != nil{
                    
                        self.error = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                    print("success")
                    UserDefaults.standard.set( true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                    self.show.toggle()
                    
                }
            }
            else{
                self.error = "Password Mismatched"
                self.alert.toggle()
            }
        }
        else {
            self.error =  "Please Enter Proper Contents"
            self.alert.toggle()
        }
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
