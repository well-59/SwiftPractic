//
//  ContentView.swift
//  SwiftUIButton
//
//  Created by 黃士豪 on 2021/6/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
        Button(action:{
                print("Share tapped!")
        }){
            HStack{
                Image(systemName: "square.and.arrow.up")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Share")
                    .fontWeight(.semibold)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
        }.buttonStyle(GradientBackgroundStyle())
            
        Button(action:{
                print("Edit tapped!")
        }){
            HStack{
                Image(systemName: "square.and.pencil")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Edit")
                    .fontWeight(.semibold)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
        }.buttonStyle(GradientBackgroundStyle())
            
        Button(action:{
                print("Delete tapped!")
        }){
            HStack{
                Image(systemName: "trash")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Delete")
                    .fontWeight(.semibold)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
        }.buttonStyle(GradientBackgroundStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct GradientBackgroundStyle:ButtonStyle {
    func makeBody(configuration:Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            .cornerRadius(40)
            .padding(.horizontal,20)
            .scaleEffect(configuration.isPressed ? 0.9:1.0)
            
    }
}
