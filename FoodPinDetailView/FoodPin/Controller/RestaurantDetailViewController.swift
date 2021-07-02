//
//  RestaurantTableViewCell.swift
//  Foodpin
//
//  Created by 黃士豪 on 2021/6/26.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView:RestaurantDetailHeaderView!
    
    var restaurant = Restaurant()
    
    // MARK: - View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        //設定頭部試圖
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
        headerView.headerImageView.image = UIImage(named: restaurant.image)
//        headerView.headerImageView.isHidden = (restaurant.isVisited) ? false : true
//
        let hertImage = restaurant.isVisited ? "heart.fill" : "heart"
        headerView.heartButton.tintColor = restaurant.isVisited ? .systemYellow : .white
        headerView.heartButton.setImage(UIImage(systemName: hertImage), for: .normal)
        
        
        // Configure the table view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }

//    extension RestaurantDetailViewController: UITableViewDataSource,UITableViewDelegate {
    // MARK: - Table view data source
        func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            switch indexPath.row {
            
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
                
                
                cell.descripionLabel.text = restaurant.phone
                cell.selectionStyle = .none
                
                return cell
                
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
                
                cell.selectionStyle = .none
                
                return cell
                
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
                cell.descripionLabel.text = restaurant.description
                cell.selectionStyle = .none
                
                return cell
                
            default:
                fatalError(
                "Failed to insantiate the table view cell for detail view controller"
                )
            }
    }
}
