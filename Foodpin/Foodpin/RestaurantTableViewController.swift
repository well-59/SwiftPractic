//
//  RestaurantTableViewController.swift
//  Foodpin
//
//  Created by 黃士豪 on 2021/6/25.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    lazy var dataSource = configureDataSource()
    var restaurantNames = [
        "Cafe Deadend","Homei","Teakha","Cafe Loisi","Petite Oyster","For Kee Restaurant","Po's Atelier",
        "Bourke Street Bakery","Haigh's Chocolate","Palomino Espresso","Upstate","Traif","Graham Avenue Meats And Deli","Waffle & Wolf","Five Leaves","Cafe Lore","Confessional","Barrafina","Donostia",
        "Royal Oak","CASK Pub and Kitchen"]
    var restaurantImages = ["cafedeadend","homei","teakha","cafeloisl","petiteoyster","forkeerestaurant","posatelier","bourkestreetbakery","haighschocolate","palominoespresso","upstate","traif","grahamavenuemeats","wafflewolf","fiveleaves","cafelore","confessional","barrafina","donostia","royaloak","caskpubkitchen"]
    var restaurantLocations = ["Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Sydny","Sydny","Sydny","New York","New York","New York","New York","New York","New York","New York","London","London","London","London"]
    var restaurandTypes = ["Coffee & Tea Shop","Cafe","Tea House","Austrian / Causual Drink","French","Bakery","Bakery","Chocolate","Cafe","American / Seafood","American","American","Breakfast & Brunch","Coffee & Tea","Latin American","Spanish","Spanish","Spanish","British","Thao"]
    var snapshot = NSDiffableDataSourceSnapshot<Section,String>()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.dataSource = dataSource
        
        var snapshot = NSDiffableDataSourceSnapshot<Section,String>()
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurantNames,toSection: .all)
        
        dataSource.apply(snapshot,animatingDifferences: false)
        
    }
    func configureDataSource() -> UITableViewDiffableDataSource<Section, String >{
        
        let cellIdentifier = "datacell"
        
        let dataSource = UITableViewDiffableDataSource< Section, String>(
            tableView: tableView,
            cellProvider:{ tableview,indexPath,restaurantName in
                let cell = tableview.dequeueReusableCell(withIdentifier:cellIdentifier,for:indexPath) as! RestaurantTableViewCell
                
                cell.nameLabel.text = self.restaurantNames[indexPath.row]
                
                cell.thumbnailImageView.image = UIImage(named: self.restaurantImages[indexPath.row])
                
                cell.typeLabel.text = self.restaurandTypes[indexPath.row]
                cell.locationLabel.text = self.restaurantLocations[indexPath.row]
                return cell
            }
        )
        return dataSource
    }
    
}




enum Section {
    case all
}



