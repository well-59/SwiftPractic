//
//  ContentView.swift
//  SwiftUITrasition
//
//  Created by 黃士豪 on 2021/6/21.
//

import SwiftUI

struct ContentView: View {
    @State private var show = false

    
    var body: some View {
        
        VStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundColor(.green)
                .overlay(
                    Text("Show details")
                        .font(.system(.largeTitle,design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                )
                .onTapGesture {
                    withAnimation(Animation.spring())
                    {
                        self.show.toggle()
                    }
                }
            
        }
        if show{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundColor(.purple)
                .overlay(
                Text("Well,here is the details")
                    .font(.system(.largeTitle,design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                )
                .transition(.asymmetric(insertion: .scale(scale: 0, anchor: .bottom), removal: .offset(x: -600, y: 0))
                ).transition(.scaleAndOffset)
        }
    }
}
extension AnyTransition{
    static var offsetScaleOpaity:AnyTransition{
        AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity)
    }
}
extension AnyTransition{
    static var scaleAndOffset:AnyTransition{
        AnyTransition.asymmetric(insertion: .scale(scale: 0, anchor: .bottom), removal: .offset(x: -600, y: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

