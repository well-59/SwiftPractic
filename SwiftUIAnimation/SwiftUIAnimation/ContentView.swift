//
//  ContentView.swift
//  SwiftUIAnimation
//
//  Created by 黃士豪 on 2021/6/17.
//

import SwiftUI

struct ContentView: View {
    @State private var circleColorChaned = false
    @State private var heartColorChaned = false
    @State private var heartSizeChaned = false
    var body: some View {
        VStack{
        ZStack{
            Circle()
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(circleColorChaned ? Color(.systemGray5) : .red)
                
            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChaned ? .red : .white)
                .font(.system(size: 100))
                .scaleEffect(heartSizeChaned ? 1.0 : 0.5)
        }
        //        .animation(.spring(response: 0.1, dampingFraction: 0.1, blendDuration: 0.1))
                .onTapGesture {
                    withAnimation(.spring(response: 0.1, dampingFraction: 0.1, blendDuration: 0.1)){
                    self.circleColorChaned.toggle()
                    self.heartSizeChaned.toggle()
                    self.heartColorChaned.toggle()
                }
                }
        }
    }
}



struct ButtonView: View {
    @State private var recordBegin = false
    @State private var recording = false
    var body: some View {
    ZStack{
            RoundedRectangle(cornerRadius: recordBegin ? 30 :5)
                .frame(width: recordBegin ? 60 :250, height: 60)
                .foregroundColor(recordBegin ? .red : .green)
                .overlay(
                    Image(systemName:"mic.fill")
                .font(.system(.title))
                .foregroundColor(.white)
                .scaleEffect(recording ? 0.7 : 1)
                )
            RoundedRectangle(cornerRadius: recording ? 35 : 10)
                .trim(from: 0, to: recordBegin ? 0.0001 : 1)
                .stroke(lineWidth: 5)
                .frame(width: recordBegin ? 70 : 260, height: 70)
                .foregroundColor(.green)
        }
    .onTapGesture {
        withAnimation(Animation.spring()){
            self.recordBegin.toggle()}
        withAnimation(Animation.spring().repeatForever().delay(0.5)){
            self.recording.toggle()}
    }
    }
}



struct ConLoadingView: View {
    @State private var isLoading = false
    @State private var isLoading1 = false
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        VStack{
        Circle()
            .trim(from: 0, to: 0.2)
            .stroke(Color.green,lineWidth: 5)
            .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            .onAppear(){
                self.isLoading = true
            }
            Spacer()
            
            ZStack{
                Text("\(Int(progress*100))%")
                    .font(.system(.title,design: .rounded))
                    .bold()
                Circle()
                    .stroke(Color(.systemGray5),lineWidth: 10)
                    .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color.green,lineWidth: 10)
                    .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .rotationEffect(Angle(degrees: -90))
            }.onAppear(){
                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){
                    timer in
                    self.progress += 0.05
                    print(self.progress)
                    if self.progress>=1.0{
                        timer.invalidate()
                    }
                }
            }
            Spacer()
            
            HStack{
                ForEach(0...4, id:\.self){index in
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.green)
                        .scaleEffect(self.isLoading1 ? 0 : 1)
                        .animation(Animation.linear(duration: 0.9 ).repeatForever().delay(0.2 * Double(index)))
                }
            }.onAppear(){
                self.isLoading1 = true
            }
            
            
            Spacer()
        ZStack{
            Text("Loading")
                .font(.system(.body,design: .rounded))
                .bold()
                .offset(x: 0, y: -25)
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color(.systemGray5),lineWidth: 3)
                .frame(width: 250, height: 3)
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color.green,lineWidth: 3)
                .frame(width: 30, height: 3)
                .offset(x: isLoading ? 110 : -110,y: 0)
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
        }
        .onAppear(){
            self.isLoading = true
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ButtonView()
        ConLoadingView()
       
    }
}
