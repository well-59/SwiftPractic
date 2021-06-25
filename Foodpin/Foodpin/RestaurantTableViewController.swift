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
    var snapshot = NSDiffableDataSourceSnapshot<Section,String>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                let cell = tableview.dequeueReusableCell(withIdentifier:cellIdentifier,for:indexPath)
                cell.textLabel?.text = restaurantName
                cell.imageView?.image = UIImage(named: self.restaurantImages[indexPath.row])
                return cell
            }
        )
        return dataSource
    }
    
}




enum Section {
    case all
}



