//
//  Restaurant.swift
//  FoodPin
//
//  Created by Simon Ng on 28/10/2019.
//  Copyright © 2019 AppCoda. All rights reserved.
//

//import Foundation
import CoreData

public class Restaurant: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Restaurant> {
        return NSFetchRequest<Restaurant>(entityName: "Restaurant")
    }
@NSManaged public var name: String
 @NSManaged public    var type: String
 @NSManaged public    var location: String
 @NSManaged public    var phone: String
 @NSManaged public    var summary: String
 @NSManaged public    var image: String
 @NSManaged public    var ratingText: String?
 @NSManaged public    var isVisited: Bool
}

extension Restaurant{
    
    enum Rating: String{
        case awesome
        case good
        case okay
        case bad
        case terrible
        
        var image:String{
            switch self {
            case .awesome:return "love"
                case .good:return "cool"
                case .okay:return "happy"
                case .bad:return "sad"
                case .terrible:return "angry"
            }
        }
    }
    
    var rating: Rating?{
        get{
            guard let ratingText = ratingText else{
                return nil
            }
            return Rating(rawValue: ratingText)
        }
        set{
            self.ratingText = newValue?.rawValue
        }
    }
}

//    init(name: String, type: String, location: String, phone: String, description: String, image: String, isVisited: Bool, rating: String = "") {
//        self.name = name
//        self.type = type
//        self.location = location
//        self.phone = phone
//        self.description = description
//        self.image = image
//        self.isVisited = isVisited
//        self.rating = rating
//    }
//
//    convenience init() {
//        self.init(name: "", type: "", location: "", phone: "", description: "", image: "", isVisited: false)
//    }

