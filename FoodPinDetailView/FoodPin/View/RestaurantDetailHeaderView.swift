//
//  RestaurantDetailHeaderView.swift
//  FoodPin
//
//  Created by 黃士豪 on 2021/7/1.
//  Copyright © 2021 AppCoda. All rights reserved.
//

import UIKit

class RestaurantDetailHeaderView: UIView {

    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var nameLabel:UILabel!
    {
        didSet {
            nameLabel.numberOfLines = 0
        }
    }
    @IBOutlet var typeLabel:UILabel!
    @IBOutlet var heartButton:UIButton!

}
