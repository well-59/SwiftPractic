//
//  RestaruantDetailTwoColumnCell.swift
//  FoodPin
//
//  Created by 黃士豪 on 2021/7/2.
//  Copyright © 2021 AppCoda. All rights reserved.
//

import UIKit

class RestaruantDetailTwoColumnCell: UITableViewCell {

    @IBOutlet var column1TitleLabel:UILabel!{
        didSet {
            column1TitleLabel.text = column1TitleLabel.text?.uppercased()
            column1TitleLabel.numberOfLines = 0
        }
    }
    @IBOutlet var column1TextLabel:UILabel!{
        didSet {
            column1TextLabel.numberOfLines = 0
        }
    }
    @IBOutlet var column2TitleLabelL:UILabel!{
        didSet{
            column2TitleLabelL.text = column2TitleLabelL.text?.uppercased()
            column2TitleLabelL.numberOfLines = 0
        }
    }
    @IBOutlet var column2TextLabel: UILabel!{
        didSet{
            column2TextLabel.numberOfLines = 0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

