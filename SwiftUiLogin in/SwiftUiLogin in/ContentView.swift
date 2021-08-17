//
//  ContentView.swift
//  SwiftUiLogin in
//
//  Created by 黃士豪 on 2021/8/1.
//

import SwiftUI



struct ContentView: View {
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        Home()
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View{
        
    GeometryReader{_ in
        
        VStack{
            Image("logo")
                .resizable()
                .frame(width: 60, height: 60)
            
            VStack{
                HStack{
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer(minLength: 0)
                }.padding(.top,40)
                VStack{
                    HStack(spacing:15){
                        Image(systemName: "envelope.fill")
                        .foregroundColor(Color("Color1"))
                        TextField("Email Address", text: self.$email)
                        
                    }
                    Divider().background(Color.white.opacity(0.5))
                }.padding(.horizontal).padding(.top,40)
                VStack{
                    HStack(spacing:15){
                        Image(systemName: "eye.fill")
                        .foregroundColor(Color("Color1"))
                        SecureField("Password", text: self.$password)
                        
                    }
                    Divider().background(Color.white.opacity(0.5))
                }.padding(.horizontal).padding(.top,30)
            }
            HStack{
                Spacer(minLength: 0)
                Button(action:{}){
                    Text("Forger Password?")
                        .foregroundColor(Color.white.opacity(0.6))
                }
            }
            .padding()
            .background(Color("Color2"))
            .padding(.horizontal,20)
        }
    }
    .background(Color("Color").edgesIgnoringSafeArea(.all))
    }
}

