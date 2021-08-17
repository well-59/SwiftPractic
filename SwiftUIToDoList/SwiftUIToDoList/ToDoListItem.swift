//
//  ToDoListItem.swift
//  SwiftUIToDoList
//
//  Created by 黃士豪 on 2021/8/1.
//

import Foundation
import CoreData

class ToDoListItem:NSManagedObject,Identifiable{
    @NSManaged var name:String?
    @NSManaged var createdAt:Date?
}
extension ToDoListItem{
    static func getAllToDoListItems() -> NSFetchRequest<ToDoListItem>{
        let request: NSFetchRequest<ToDoListItem> =
            ToDoListItem.fetchRequest() as!
        NSFetchRequest<ToDoListItem>
        let sort = NSSortDescriptor(key:"createdAt",ascending: true)
        request.sortDescriptors = [sort]
        return request
    }
    
}
