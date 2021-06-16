
//
//  CardView.swift
//  SwiftUiScrollView
//
//  Created by 黃士豪 on 2021/6/16.
//
    
import SwiftUI

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
        toptextview(dayText: "Monday Aug 20", titleText: "Your Reading")
        cardview(image: "1", category: "SwiftUI", heading: "Drawing a Border with Rounded Corers", author: "Simon Ng")
        }
    }
}
struct toptextview: View {
    var dayText:String
    var titleText:String
    var body: some View{
        VStack{
            HStack{
        Text(dayText)
                Spacer()
            }
            HStack{
        Text(titleText)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
           Spacer()
            }
        }
    }
}


struct cardview: View {
    var image:String
    var category:String
    var heading:String
    var author:String
    
    var body: some View {
        VStack{
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
        VStack{
            Text(category)
                .font(.headline)
                .foregroundColor(.secondary)
            Text(heading)
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .lineLimit(3)
                .minimumScaleFactor(0.5)
            Text("Written by \(author)".uppercased())
                .font(.caption)
                .foregroundColor(.secondary)
        }
            Spacer()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB,red: 150/255,green: 150/255,blue: 150/255,opacity: 0.1),lineWidth: 1)
        )
        .padding([.top,.horizontal])
    
    }
    
}
