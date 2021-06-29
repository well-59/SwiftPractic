//
//  RestaurantTableViewController.swift
//  Foodpin
//
//  Created by 黃士豪 on 2021/6/25.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    lazy var dataSource = configureDataSource()
    var restaruantISFavorites = Array(repeating: false, count: 21)

    struct Restaurant: Hashable{
        var name: String = ""
        var type: String = ""
        var location: String = ""
        var image : String = ""
        var isFavorite:Bool = false
    }
    // MARK: - Properties
    var restaurants:[Restaurant] = [
    
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong kong", image: "cafedadend", isFavorite: false),
        Restaurant(name: "Homei", type:"Cafe", location: "Hong Kong", image: "homei", isFavorite: false),
        Restaurant(name: "Teakha", type:"teakha", location: "Hong Kong", image: "teakha", isFavorite: false),
        Restaurant(name: "Cafe loisl", type:"Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isFavorite: false),
        Restaurant(name: "Petite Oyster", type:"French", location: "Hong Kong", image: "petiteoyster", isFavorite: false),
        Restaurant(name: "For Kee Restaurant", type:"Bakery", location: "Hong Kong", image: "posatelier", isFavorite: false),
        Restaurant(name: "Po's Atelier", type:"Bakery", location: "Hong Kong", image: "forkee", isFavorite: false),
        Restaurant(name: "Bourke Street Backery", type:"Chocolate", location: "Sydney", image: "bourkestreetbakery", isFavorite: false),
        Restaurant(name: "Haigh's Chocolate", type:"Cafe", location: "Sydney", image: "haigh", isFavorite: false),
        Restaurant(name: "Palomino Espresso", type:"American / Seafood", location: "Sydney", image: "palomino", isFavorite: false),
        Restaurant(name: "Upstate", type:"American", location: "New York", image: "upstate", isFavorite: false),
        Restaurant(name: "Traif", type:"American", location: "New York", image: "traif", isFavorite: false),
        Restaurant(name: "Graham Avenue Meats", type:"Breakfast & Brunch", location: "New York", image: "graham", isFavorite: false),
        Restaurant(name: "Waffle & Wolf", type:"Coffee & Tea", location: "New York", image: "waffleandwolf", isFavorite: false),
        Restaurant(name: "Five Leaves", type:"Coffee & Tea", location: "New York", image: "fiveleaves", isFavorite: false),
        Restaurant(name: "Cafe Lore", type:"Latin American", location: "New York", image: "cafelore", isFavorite: false),
        Restaurant(name: "Confessional", type:"Spanish", location: "New York", image: "confessional", isFavorite: false),
        Restaurant(name: "Barrafina", type:"Spanish", location: "London", image: "barrafina", isFavorite: false),
        Restaurant(name: "Donostia", type:"Spanish", location: "London", image: "donostia", isFavorite: false),
        Restaurant(name: "Rpyal Oak", type:"British", location: "London", image: "royaloak", isFavorite: false),
        Restaurant(name: "CASK Pub and Kitchen", type:"Tahi", location: "London", image: "cask", isFavorite: false),
    ]
    
    var snapshot = NSDiffableDataSourceSnapshot<Section,String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        tableView.dataSource = dataSource
        tableView.cellLayoutMarginsFollowReadableWidth = true
        
        var snapshot = NSDiffableDataSourceSnapshot<Section,Restaurant>()
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurants,toSection: .all)
        
        dataSource.apply(snapshot,animatingDifferences: false)
        
    }
    
    override func tableView(_ tableView:UITableView,didSelectRowAt indexPath:IndexPath){
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        if let popoverController = optionMenu.popoverPresentationController{
            if let cell = tableView.cellForRow(at: indexPath){
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
        let cancelAction = UIAlertAction(title:"Cancel",style:.cancel,handler:nil)
        optionMenu.addAction(cancelAction)
        
        let reserveActionHandler = {(action:UIAlertAction!) -> Void in
            
            let alertMessage = UIAlertController(title: "Not available yet", message: "Sorry, this feature is not available yet. Please retry later", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        let reserveAction = UIAlertAction(title: "Reserve a table", style: .default, handler: reserveActionHandler)
        optionMenu.addAction(reserveAction)
        
        let favoriteAction = UIAlertAction(title: "Mark as favorite", style: .default, handler:{ (action:UIAlertAction!) -> Void in
                                            
        let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            
            cell?.tintColor = .systemYellow
            
            self.restaruantISFavorites[indexPath.row] = true
        })
        optionMenu.addAction(favoriteAction)
        
        present(optionMenu,animated: true,completion: nil)
        
        tableView.deselectRow(at:indexPath,animated: false)
    }
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section, Restaurant >{
        
        let cellIdentifier = "favoritecell"
        
        let dataSource = UITableViewDiffableDataSource< Section, Restaurant>(
            tableView: tableView,
            cellProvider:{ tableview,indexPath,restaurant in
                let cell = tableview.dequeueReusableCell(withIdentifier:cellIdentifier,for:indexPath) as! RestaurantTableViewCell
                
                cell.nameLabel.text = restaurant.name
                cell.locationLabel.text = restaurant.location
                cell.typeLabel.text = restaurant.type
                cell.thumbnailImageView.image = UIImage(named: restaurant.image)
                cell.heartImageView.isHidden = restaurant.isFavorite ? false : true
                return cell
                
            }
            
        )
        return dataSource
    }
    
    
}




enum Section {
    case all
}




