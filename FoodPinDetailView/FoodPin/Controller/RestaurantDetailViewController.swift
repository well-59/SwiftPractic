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
//
    
    var restaurant = Restaurant()
    
    // MARK: - View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
//        navigationController?.hidesBarsOnSwipe = false
        
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
        
        tableView.contentInsetAdjustmentBehavior = .never
    }

//    extension RestaurantDetailViewController: UITableViewDataSource,UITableViewDelegate {
    // MARK: - Table view data source
        func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int) -> Int {
            return 3
        }
        
        func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            switch indexPath.row {
            
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
                
                
                cell.descripionLabel.text = restaurant.phone
                cell.selectionStyle = .none
                
                return cell
                
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaruantDetailTwoColumnCell.self), for: indexPath) as! RestaruantDetailTwoColumnCell
                cell.column1TitleLabel.text = "Address"
                cell.column1TextLabel.text = restaurant.location
                cell.column2TitleLabelL.text = "Phone"
                cell.column2TextLabel.text = restaurant.phone
                cell.selectionStyle = .none
                
                return cell
                
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailMapCell.self), for: indexPath) as! RestaurantDetailMapCell
                cell.configure(location: restaurant.location)
                cell.selectionStyle = .none
                
                return cell
                
            default:
                fatalError(
                "Failed to insantiate the table view cell for detail view controller"
                )
            }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    // MARK: - Navigationv
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showMap":
            let desetinationController = segue.destination as! MapViewController
            desetinationController.restaurant = restaurant
        case "showReview":
            let desetinationController = segue.destination as! ReviewViewController
            desetinationController.restaurant = restaurant
        default: break
            
        }
        
    }
    @IBAction func close(segue: UIStoryboardSegue){
        dismiss(animated: true, completion: nil)
    }
//    @IBAction func rateRestaurant(segue: UIStoryboardSegue) {
//        dismiss(animated: true, completion: {
//            if let rating = segue.identifier {
//                self.restaurant.rating = rating
//                self.headerView.ratingImageView.image = UIImage(named: rating)
//                
//                let scaleTransform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
//                self.headerView.ratingImageView.transform = scaleTransform
//                self.headerView.ratingImageView.alpha = 0
//                
//                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.7, options: [], animations: {
//                    self.headerView.ratingImageView.transform = .identity
//                    self.headerView.ratingImageView.alpha = 1
//                }, completion: nil)
//            }
//        })
//    }
    
    
    
    }
