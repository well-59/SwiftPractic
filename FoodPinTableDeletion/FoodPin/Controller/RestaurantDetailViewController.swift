//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by 黃士豪 on 2021/6/30.
//  Copyright © 2021 AppCoda. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UITableViewController {

    @IBOutlet var restaurantImageView: UIImageView!
    
    var restaurantImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantImageView.image = UIImage(named: restaurantImageName)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


}
