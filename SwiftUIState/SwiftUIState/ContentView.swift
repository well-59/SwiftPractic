//
//  ContentView.swift
//  SwiftUIState
//
//  Created by 黃士豪 on 2021/6/17.
//

import SwiftUI

struct ContentView: View {
    
    @State private var counterBlue = 0
    @State private var counterGreen = 0
    @State private var counterRed = 0
    
    var body: some View {
        VStack{
            Text("\(counterBlue + counterGreen + counterRed)")
                .font(.system(size: 220, weight: .bold, design: .rounded))
            HStack {
        CounterButton(counter: $counterBlue, color: .blue)
        CounterButton(counter: $counterGreen, color: .green)
        CounterButton(counter: $counterRed, color: .red)
            }}
    }
}





struct CounterButton: View {
    
    @Binding var counter: Int
    
    var color:Color
    
    var body: some View {
        
        Button(action: {
            
            self.counter += 1
            
        }){
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(color)
                .overlay(
                    Text("\(counter)")
                        .font(.system(size: 80 , weight: .bold , design: .rounded))
                        .foregroundColor(.white)
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
