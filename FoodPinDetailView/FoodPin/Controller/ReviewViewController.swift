//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by 黃士豪 on 2021/7/4.
//  Copyright © 2021 AppCoda. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var rateButtons:[UIButton]!
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImageView.image = UIImage(named: restaurant.image)
        //應用模糊效果
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
//        let moveRighTransform = CGAffineTransform.init(translationX: 600, y: 0)
//        //影藏按鈕
//        for rateButton in rateButtons {
//            rateButton.transform = moveRighTransform
//            rateButton.alpha = 0
//        }
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
        let scaleUpTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
        let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
        
        //使按鈕影藏並移出銀幕
        for rateButton in rateButtons {
            rateButton.transform = moveScaleTransform
            rateButton.alpha = 0
        }
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration:0.4,delay: 0.1,usingSpringWithDamping: 0.2,
                       initialSpringVelocity:0.3,options: [],animations: {
            self.rateButtons[0].alpha = 1.0
            self.rateButtons[0].transform = .identity
        },completion: nil)
        UIView.animate(withDuration:0.4,delay: 0.15,options: [],animations: {
            self.rateButtons[1].alpha = 1.0
            self.rateButtons[1].transform = .identity
        },completion: nil)
        UIView.animate(withDuration:0.4,delay: 0.2,options: [],animations: {
                        self.rateButtons[2].alpha = 1.0
            self.rateButtons[2].transform = .identity
        },completion: nil)
        UIView.animate(withDuration:0.4,delay: 0.25,options: [],animations: {
                        self.rateButtons[3].alpha = 1.0
            self.rateButtons[3].transform = .identity
        },completion: nil)
        UIView.animate(withDuration:0.4,delay: 0.3,options: [],animations: {
                        self.rateButtons[4].alpha = 1.0
            self.rateButtons[4].transform = .identity
        },completion: nil)
        }
    }
    



