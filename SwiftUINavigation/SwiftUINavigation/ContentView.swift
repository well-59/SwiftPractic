//
//  ContentView.swift
//  SwiftUINavigation
//
//  Created by 黃士豪 on 2021/6/21.
//

import SwiftUI

struct ContentView: View {
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
            NavigationView{
                List{
                    ForEach(restaurants){ restaurant in
                        NavigationLink(destination:  RestauranDetaiView(restaurant: restaurant)){
                            BasicImageRow(restaurant: restaurant)}
                    }
                }
                .navigationBarTitle("Restaurants",displayMode: .automatic)
            }
    }
init() {
    let navBarAppearance = UINavigationBarAppearance()
    navBarAppearance.largeTitleTextAttributes = [.foregroundColor:UIColor.systemRed, .font:UIFont(name: "ArialRoundedMTBold", size: 35)!]
    navBarAppearance.titleTextAttributes = [.foregroundColor:UIColor.systemRed, .font:UIFont(name: "ArialRoundedMTBold", size: 35)!]
    navBarAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.turn.up.left"), transitionMaskImage: UIImage(systemName: "arrow.turn.up.left"))
        
    
    UINavigationBar.appearance().standardAppearance = navBarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    UINavigationBar.appearance().compactAppearance = navBarAppearance
    UINavigationBar.appearance().tintColor = .blue
        
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

struct RestauranDetaiView: View {
    @Environment(\.presentationMode) var mode
    
    var restaurant:Restaurant
    
    var body: some View {
        
        VStack{
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(restaurant.name)
                .font(.system(.title,design: .rounded))
                .fontWeight(.black)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:Button(action: {self.mode.wrappedValue.dismiss()}){
            Text("\(Image(systemName: "chevron.left"))\(restaurant.name)").foregroundColor(.red)
        })
    }
    
    

}
