//
//  ContentView.swift
//  SwiftUIShape
//
//  Created by 黃士豪 on 2021/6/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            ZStack{
            Path{ path in
                path.move(to:CGPoint(x: 200, y: 200))
                path.addArc(center: .init(x: 200, y: 200),radius: 150,startAngle: Angle(degrees: 0.0),endAngle:Angle(degrees: 90),clockwise: true)
            }.fill(Color.green)
            
            Path{path in
                path.move(to:CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187),radius: 150,startAngle: Angle(degrees: 90),endAngle:Angle(degrees: 360),clockwise: true)}
                .fill(Color(.systemPurple))
                .offset(x: 20, y: 20)
            Path{path in
                path.move(to:CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187),radius: 150,startAngle: Angle(degrees: 90),endAngle:Angle(degrees: 360),clockwise: true)
                path.closeSubpath()
            }
            .stroke(Color(red: 52/255, green: 52/255, blue: 122/255),lineWidth: 10)
            .offset(x: 20, y: 20)
            .overlay(
                Text("25%")
                    .font(.system(.largeTitle,design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .offset(x: 80, y: 80)
            )
            }
            
        ZStack {
            Path(){ path in
            path.move(to:CGPoint(x: 20, y: 60))
                path.addLine(to:CGPoint(x: 40, y: 60))
                path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
                path.addLine(to:CGPoint(x: 230, y: 60))
                path.addLine(to:CGPoint(x: 230, y: 100))
                path.addLine(to:CGPoint(x: 20, y: 100))
            }
            .fill(Color.purple)
            
            Path(){ path in
            path.move(to:CGPoint(x: 20, y: 60))
                path.addLine(to:CGPoint(x: 40, y: 60))
                path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
                path.addLine(to:CGPoint(x: 230, y: 60))
                path.addLine(to:CGPoint(x: 230, y: 100))
                path.addLine(to:CGPoint(x: 20, y: 100))
                path.closeSubpath()
            }
            .stroke(Color.black,lineWidth: 5)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                Text("Test")
                    .font(.system(.title,design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50)
                    .background(Dome().fill(Color.red))
            }
        }
        }
    }
}

struct ConterShapeView:View {
    
private var purpleGradient = LinearGradient(gradient: Gradient(colors: [Color(red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255, blue: 179/255)]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
    
    var body: some View {
        VStack{
    ZStack{
        Circle()
            .stroke(Color(.systemGray6),lineWidth: 20)
            .frame(width: 300, height: 300)
        Circle()
            .trim(from: 0, to: 0.85)
            .stroke(purpleGradient,lineWidth: 20)
            .frame(width: 300, height: 300)
            .overlay(VStack{
                Text("85%")
                    .font(.system(size: 80,weight: .bold,design: .rounded))
                    .foregroundColor(Color(.systemGray))
                Text("Complete")
                    .font(.system(.body,design: .rounded))
                    .bold()
                    .foregroundColor(Color(.systemGray))
            })
    }
            ZStack{
                Circle()
                    .trim(from: 0, to: 0.4)
                    .stroke(Color(.systemBlue),lineWidth:80)
                Circle()
                    .trim(from: 0.4, to: 0.6)
                    .stroke(Color(.systemTeal),lineWidth:80)
                Circle()
                    .trim(from: 0.6, to: 0.75)
                    .stroke(Color(.systemPink),lineWidth:80)
                Circle()
                    .trim(from: 0.75, to: 1)
                    .stroke(Color(.systemYellow),lineWidth:90)
                Text("15%")
                    .font(.system(.title,design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .offset(x: 80, y: -100)
            }
            .frame(width: 250, height: 250)
        }
    
}
}

struct Dome:Shape {
    func path(in rect:CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0), control: CGPoint(x: rect.size.width/2, y: -(rect.size.width*0.1)))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        return path
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ConterShapeView()
    }
}
