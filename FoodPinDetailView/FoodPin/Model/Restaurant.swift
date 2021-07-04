//
//  RestaurantTableViewCell.swift
//  Foodpin
//
//  Created by 黃士豪 on 2021/6/26.
//
import Foundation

class Restaurant {
    var name: String
    var type: String
    var location: String
    var phone: String
    var description: String
    var image: String
    var isVisited: Bool

    init(name: String, type: String, location: String, phone: String, description: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.description = description
        self.image = image
        self.isVisited = isVisited
    }

    convenience init() {
        self.init(name: "", type: "", location: "", phone: "", description: "", image: "", isVisited: false)
    }
}
//struct Restaurant: Hashable {
//    enum Rating:String {
//        case awesome
//        case good
//        case okay
//        case bad
//        case terrible
//        
//        var image: String {
//            switch self{
//        case .awesome: return "love"
//        case .good:return "cool"
//        case .okay:return "happy"
//        case .bad:return "bad"
//        case .terrible:return "angry"
//            }
//        }
//    }
//    
//    var name: String
//    var type: String
//    var location: String
//    var phone: String
//    var description: String
//    var image: String
//    var isVisited: Bool
//    var rating : Rating?
//}
//}
