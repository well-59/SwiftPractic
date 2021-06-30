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
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend", isFavorite:false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei", isFavorite: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isFavorite: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isFavorite: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isFavorite: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant", isFavorite: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier", isFavorite: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery", isFavorite: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haighschocolate", isFavorite: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palominoespresso", isFavorite: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isFavorite: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isFavorite: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "grahamavenuemeats", isFavorite: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "wafflewolf", isFavorite: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isFavorite: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isFavorite: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional", isFavorite: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina", isFavorite: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isFavorite: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isFavorite: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "caskpubkitchen", isFavorite: false)
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
        
        let favoriteActionTitle = self.restaurants[indexPath.row].isFavorite ? "Remove from favorites" : "Mark as favorite"
        
        let favoriteAction = UIAlertAction(title: favoriteActionTitle, style: .default, handler:{ (action:UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
            
            cell.favoriteImageView.isHidden = self.restaurants[indexPath.row].isFavorite
            self.restaurants[indexPath.row].isFavorite = self.restaurants[indexPath.row].isFavorite ? false : true
        })
        optionMenu.addAction(favoriteAction)
        
        present(optionMenu,animated: true,completion: nil)
        
        tableView.deselectRow(at:indexPath,animated: false)
    }
    
    override func tableView(_ tableView:UITableView, trailingSwipeActionsConfigurationForRowAt indexPath:IndexPath) -> UISwipeActionsConfiguration{
        //取得餐廳
        guard let restaurant = self.dataSource.itemIdentifier(for: indexPath)
        else{
            return UISwipeActionsConfiguration()
        }
        
        //刪除動作
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ (action,sourceView,completionHandler) in
            
            var snapshot = self.dataSource.snapshot()
            snapshot.deleteItems([restaurant])
            self.dataSource.apply(snapshot,animatingDifferences: true)
            
            //呼交完成處理器來取消動作按鈕
            completionHandler(true)
        }
        
        //分享動作
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action,sourceView,completionHandler) in
            let defaultText = "Just checking in at " + restaurant.name
            
            var activityController : UIActivityViewController
            
            if let imageToShare = UIImage(named: restaurant.image){
                activityController = UIActivityViewController(activityItems: [defaultText,imageToShare], applicationActivities: nil)
            }else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            self.present(activityController,animated:true,completion:nil)
            completionHandler(true)
            
        }
        
        //設定兩個動作為滑動
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        return swipeConfiguration
        
    }
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section, Restaurant >{

        let cellIdentifier = "datacell"

        let dataSource = RestaurantDiffableDataSource(
            tableView: tableView,
            cellProvider:{ tableview,indexPath,restaurant in
                let cell = tableview.dequeueReusableCell(withIdentifier: cellIdentifier,for: indexPath) as! RestaurantTableViewCell

                cell.nameLabel.text = restaurant.name
                cell.locationLabel.text = restaurant.location
                cell.typeLabel.text = restaurant.type
                cell.thumbnailImageView.image = UIImage(named: restaurant.image)
                cell.favoriteImageView.isHidden = restaurant.isFavorite ? false : true
                return cell

            }
        )
        return dataSource
    }
    
    
}









