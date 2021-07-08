//
//  WalkthroughViewController.swift
//  FoodPin
//
//  Created by BankPro on 2021/7/7.
//  Copyright © 2021 AppCoda. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController {
    
    var WalkthroughPageViewController:WalkthroughPageViewController?
    
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet var nextButton: UIButton!{
        didSet{
            nextButton.layer.cornerRadius = 25.0
            nextButton.layer.masksToBounds = true
        }
    }
    
    @IBOutlet var skipButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action methods
    
    @IBAction func skipButtonTapped(sender: UIButton){
        UserDefaults.standard.set(true,forKey:"hasViewedWalkthrough")
        createQuickActions()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButtonTapped(sender: UIButton){
        if let index = WalkthroughPageViewController?.curretIndex{
            switch index {
            case 0...1:
                WalkthroughPageViewController?.forwardPage()
            case 2:
                UserDefaults.standard.set(true,forKey:"hasViewedWalkthrough")
                createQuickActions()
                dismiss(animated: true, completion: nil)
            default:
                break
            }
        }
        updateUI()
    }
    
    func updateUI(){
        if let index = WalkthroughPageViewController?.curretIndex{
            switch index {
            case 0...1:
                nextButton.setTitle("NEXT", for: .normal)
                skipButton.isHidden = true
            case 2:
                nextButton.setTitle("GET STARTED", for: .normal)
                skipButton.isHidden = true
            default:
                break
            }
            pageControl.currentPage = index
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? WalkthroughPageViewController {
            WalkthroughPageViewController = pageViewController
            WalkthroughPageViewController?.walkthroughDelegate = self
        }
    }
    func createQuickActions(){
        //加入快速動作
        if let bundleIdentifier = Bundle.main.bundleIdentifier{
            let shortcutIteml = UIApplicationShortcutItem(type:"\(bundleIdentifier).OpenFavorites",
                localizedTitle: "Show Favorites",localizedSubtitle: nil, icon: UIApplicationShortcutIcon(systemImageName:"tag"),userInfo: nil)
            let shortcutItem2 = UIApplicationShortcutItem(type:"\(bundleIdentifier).OpenDiscover",
            localizedTitle: "Discover Restaurants",localizedSubtitle: nil, icon: UIApplicationShortcutIcon(systemImageName:"eyes"),userInfo: nil)
            let shortcutItem3 = UIApplicationShortcutItem(type:"\(bundleIdentifier).NewRestaurant",
                localizedTitle: "New Restaurant",localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type:.add),userInfo: nil)
            UIApplication.shared.shortcutItems = [shortcutIteml,shortcutItem2,shortcutItem3]
        }
    }
}

extension WalkthroughViewController:WalkthroughPageViewControllerDelegate{
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
}
