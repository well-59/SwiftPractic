//
//  ContentView.swift
//  First
//
//  Created by 黃士豪 on 2021/6/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            PricingView(title: "Basic", price: "$9", textColor: .white, bgColor: .purple,icon: "leaf")
                .padding(20)
                .offset(x: 0, y: 155)
            PricingView(title: "Pro", price: "$19", textColor: .white, bgColor: Color(red: 255/255, green: 190/255, blue: 15/255),icon: "ant")
                .padding(30)
                .offset(x: 0, y: -37)
            PricingView(title: "Team", price: "$299", textColor: .white, bgColor: Color(red: 62/255, green: 63/255, blue: 70/255), icon: "wand.and.rays")
                .padding(40)
                .offset(x: 0, y: -227)
        }
        VStack{
            HeaderView()
        
            HStack(spacing:15){
                PricingView(title: "Basic", price: "$9", textColor: .white, bgColor: .purple)
                
                ZStack{
                PricingView(title: "Pro", price: "$19", textColor: .black, bgColor: Color(red: 240/255, green: 240/255, blue: 240/255))
                    
                Text("Best for designer")
                    .font(.system(.caption,design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                    .offset(x: 0, y: 87)
                }
            }
            .padding(.horizontal)
            ZStack{
                PricingView(title: "Team", price: "$299", textColor: .white, bgColor: Color(red: 62/255, green: 63/255, blue: 70/255), icon: "wand.and.rays")
                    .padding()
                Text("perfect for teams with 20 members")
                    .font(.system(.caption,design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                    .offset(x: 0, y: 87)
            }
            Spacer()
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView : View {
    var body: some View{
        VStack(alignment: .leading, spacing: 2
        ){
          Text("Chose")
            .font(.system(.largeTitle,design: .rounded))
            .fontWeight(.black)
        Text("Your Plan")
                .font(.system(.largeTitle,design: .rounded))
                .fontWeight(.black)
        }
    }
}


struct PricingView: View {
    var title:String
    var price:String
    var textColor:Color
    var bgColor:Color
    var icon:String?
    
    var body: some View {
        VStack{
            
            icon.map({Image(systemName: $0)
                .font(.largeTitle)
                .foregroundColor(textColor)
                
            })
            
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
            Text("per month")
                .font(.headline)
                .foregroundColor(textColor)
        }
        .frame(minWidth:0,maxWidth: .infinity,minHeight:100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
    
}
