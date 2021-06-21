//
//  ContentView.swift
//  SwiftUIList
//
//  Created by 黃士豪 on 2021/6/21.
//

import SwiftUI

struct ContentView: View {
    
//    var restaurantNames = ["cafe Dadend","Homei","Teakha","Cafe Loisl","Petite Oyster","For Kee Restaurant","Po's Atelier","Bourke Street Bakery","Haigh's Chocolate","Pakinubi Espresso","Upstate","Traif","Graham Avenue Meats And Deli","Waffle & Wolf","Five Leaves","Cafe Lore","Confessional","Barrafina","Donostia","Royal Oak","CASK Pub and Kitchen"]
//
//    var restaurantImages = ["cafedeadend","homei","teakha","cafeloisl","petiteoyster","forkeerestaurant","posatelier","bourkestreetbakery","haighschocolate","palominoespresso","upstate","traif","grahamavenuemeats","wafflewolf","fiveleaves","cafelore","confessional","barrafina","donostia","royaloak","caskpubkitchen"]
    
    var restaurants = [
        Restaurant(name: "Cafe Dadend", image:"cafedeadend"),
        Restaurant(name: "Homei", image:"homei"),
        Restaurant(name: "Teakha", image:"teakha"),
        Restaurant(name: "Cafe Loisl ", image:"cafeloisl"),
        Restaurant(name: "Petite Oyster ", image:"petiteoyster"),
        Restaurant(name: "For Kee Restaurant", image:"forkeerestaurant"),
        Restaurant(name: "Po's Atelier ", image:"posatelier"),
        Restaurant(name: "Bourke Street Bakery ", image:"bourkestreetbakery"),
        Restaurant(name: "Haigh's Chocolate", image:"haighschocolate"),
        Restaurant(name: "Pakinubi Espresso", image:"palominoespresso"),
        Restaurant(name: "Homei", image:"upstate"),
        Restaurant(name: "Traif ", image:"traif"),
        Restaurant(name: "Graham Avenue Meats And Deli ", image:"grahamavenuemeats"),
        Restaurant(name: "Waffle & Wolf ", image:"wafflewolf"),
        Restaurant(name: "Five Leaves", image:"fiveleaves"),
        Restaurant(name: "Cafe Lore", image:"cafelore"),
        Restaurant(name: "Confessional", image:"confessional"),
        Restaurant(name: "Barrafina", image:"barrafina"),
        Restaurant(name: "Donostia", image:"donostia"),
        Restaurant(name: "Royal Oak", image:"royaloak"),
        Restaurant(name: "CASK Pub and Kitchen", image:"caskpubkitchen")
    ]
        var body: some View {
        List(restaurants.indices){
            index in
            if(0...1).contains( index ){
                FullImageRow(restaurant: self.restaurants[ index ])
            }
            else{
                BasicImageRow(restaurant: self.restaurants[ index ])
            }
            
           
            
        }
    }
}
struct FullImageRow:View {
    var restaurant:Restaurant
    
    var body: some View{
        ZStack{
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(height:200)
                .cornerRadius(10)
                .overlay(
                Rectangle()
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .opacity(0.2)
                )
            Text(restaurant.name)
                .font(.system(.title,design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
struct Restaurant:Identifiable {
    var id = UUID()
    var name:String
    var image:String
    
}

struct BasicImageRow: View {
    var restaurant: Restaurant
    var body: some View {
        HStack{
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
        }
    }
}
