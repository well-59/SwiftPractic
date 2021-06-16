//
//  ContentView.swift
//  SwiftUiScrollView
//
//  Created by 黃士豪 on 2021/6/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
           
        toptextview(dayText: "Monday Aug 20", titleText: "Your Reading")
        ScrollView(.horizontal,showsIndicators:false){
        HStack{
            Group{
        cardview(image: "1", category: "SwiftUI", heading: "Drawing a Border with Rounded Corers", author: "Simon Ng")
        cardview(image: "2", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodorpoulos")
        cardview(image: "3", category: "Flutter", heading: "Buliding a Complex Layout with Flutter", author: "Lawrence Tan")
        cardview(image: "4", category: "iOS", heading: "What's New in Natural Langeage API", author: "Sai Kambampati")
            }
            .frame(width:300,height: 450)
        }
            Spacer()
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


