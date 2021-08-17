//
//  AboutTableViewController.swift
//  FoodPin
//
//  Created by BankPro on 2021/7/8.
//  Copyright © 2021 AppCoda. All rights reserved.
//

import UIKit
import SafariServices

class AboutTableViewController: UITableViewController {

    lazy var dataSource = configureDataSource()
    
    struct LinkItem: Hashable{
        var text: String
        var link: String
        var image: String
    }
    
    var sectionContent = [
        [
         LinkItem(text:"Rate us on App Store",link:"https://www.apple.com/ios/app-store/",image: "store"),
         LinkItem(text: "Tell us your feedback",link:"http://www.appcoda.com/contact",image: "chat")],
         [LinkItem(text:"Twitter",link:"https://twitter.com/appcodamobile",image:"twitter"),
         LinkItem(text:"Facebook",link:"https://facebook.com/appcodamobile",image:"facebook"),
         LinkItem(text:"Instagram",link:"https://www.instagram.com/appcodadotcom",image:"instagram")]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //在導覽列使用大標題
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //自訂導覽列外觀
        if let appearance = navigationController?.navigationBar.standardAppearance{
            appearance.configureWithTransparentBackground()
            if let customFont = UIFont(name: "Nunito-Bold", size: 45.0){
                appearance.titleTextAttributes = [.foregroundColor:UIColor(named: "NavigationBarTitle")!]
                appearance.largeTitleTextAttributes = [.foregroundColor:UIColor(named: "NavigationBarTitle")!,.font: customFont]
            }
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
        
        //載入表格資料
        tableView.dataSource = dataSource
        updateSnapshot()
        
        
    }
    
    enum Section{
        case feeback
        case followus
    }

    // MARK: - Table view data source

    func configureDataSource() -> UITableViewDiffableDataSource<Section,LinkItem>{
        let cellIdentifier = "aboutcell"
        
        let dataSource = UITableViewDiffableDataSource<Section,LinkItem>(tableView:tableView){
            (tableView, indexPath,LinkItem) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,for:indexPath)
            cell.textLabel?.text = LinkItem.text
            cell.imageView?.image = UIImage(named: LinkItem.image)
            return cell
        }
        return dataSource
    }
    func  updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section,LinkItem>()
        snapshot.appendSections([.feeback,.followus])
        snapshot.appendItems(sectionContent[0],toSection: .feeback)
        snapshot.appendItems(sectionContent[1],toSection: .followus)
        dataSource.apply(snapshot,animatingDifferences:false)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //取得所選連結項目
//        guard let linkItem = self.dataSource.itemIdentifier(for: indexPath)
//            else{
//                return
//        }
//        if let url = URL(string: linkItem.link){
//            UIApplication.shared.open(url)
//        }
//        tableView.deselectRow(at: indexPath, animated: false)
//
        switch indexPath.section {
        case 0:
            performSegue(withIdentifier: "showWebView", sender: self)
        case 1:
            openWithSafariViewController(indexPath: indexPath)
        default:
            break
        }
//        performSegue(withIdentifier: "showWebView", sender: self)
        tableView.deselectRow(at: indexPath, animated: false)
        }
    
    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
        if segue.identifier == "showWebView"{
            if let destinationController = segue.destination as? WebViewController,
                let indexPath = tableView.indexPathForSelectedRow,
                let linkItem = self.dataSource.itemIdentifier(for: indexPath)
            {
                destinationController.targetURL = linkItem.link
            }
        }
    }
    func openWithSafariViewController(indexPath:IndexPath){
        guard let linkItem = self.dataSource.itemIdentifier(for:indexPath) else {
            return
        }
        if let url = URL(string: linkItem.link) {
            let safariController = SFSafariViewController(url: url)
            present(safariController,animated: true,completion: nil)
        }
    }
}

