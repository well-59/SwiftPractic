//
//  ViewController.swift
//  SwiftSimpleTable
//
//  Created by 黃士豪 on 2021/6/25.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var restaurantNames = [
        "Cafe Deadend","Homei","Teakha","Cafe Loisi","Petite Oyster","For Kee Restaurant","Po's Atelier",
        "Bourke Street Bakery","Haigh's Chocolate","Palomino Espresso","Upstate","Traif","Graham Avenue Meats And Deli","Waffle & Wolf","Five Leaves","Cafe Lore","Confessional","Barrafina","Donostia",
        "Royal Oak","CASK Pub and Kitchen"
    ]
    var restaurantImages = ["cafedeadend","homei","teakha","cafeloisl","petiteoyster","forkeerestaurant","posatelier","bourkestreetbakery","haighschocolate","palominoespresso","upstate","traif","grahamavenuemeats","wafflewolf","fiveleaves","cafelore","confessional","barrafina","donostia","royaloak","caskpubkitchen"]
    
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifire = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire,for: indexPath)
        
        cell.textLabel?.text = restaurantNames[indexPath.row]
        cell.imageView?.image = UIImage(named: self.restaurantImages[indexPath.row])
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

