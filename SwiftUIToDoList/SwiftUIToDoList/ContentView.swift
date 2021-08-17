//
//  ContentView.swift
//  SwiftUIToDoList
//
//  Created by 黃士豪 on 2021/8/1.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(fetchRequest: ToDoListItem.getAllToDoListItems())
        var items: FetchedResults<ToDoListItem>
    
    @State var text:String = ""
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("New Item")){
                    HStack{
                        TextField("Enter new item...", text: $text)
                        Button(action:{
                            if !text.isEmpty{
                                let newIten =
                                ToDoListItem(context: context)
                                newIten.name = text
                                newIten.createdAt = Date()
                                do{
                                    try context.save()
                                }
                                catch{
                                    print(error)
                                }
                                text = ""
                            }
                        } , label: {
                            Text("Save")
                        })
                    }
                }
                Section{
                    ForEach(items) { toDoListItem in
                        VStack(alignment: .leading){
                            Text(toDoListItem.name!)
                                .font(.headline)
                            Text("\(toDoListItem.createdAt!)")
                            }
                    }.onDelete(perform: { indexSet in
                        guard let index = indexSet.first else{
                            return
                        }
                        let itemToDelete = items[index]
                        context.delete(itemToDelete)
                        do{
                            try context.save()
                        }
                        catch{
                            print (error)
                        }
                    })
                    }
                }
            .navigationTitle("To Do List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
