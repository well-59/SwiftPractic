//
//  WalkthroughPageViewController.swift
//  FoodPin
//
//  Created by BankPro on 2021/7/7.
//  Copyright © 2021 AppCoda. All rights reserved.
//

import UIKit

protocol  WalkthroughPageViewControllerDelegate: class {
    func didUpdatePageIndex(currentIndex: Int)
}



class WalkthroughPageViewController: UIPageViewController {
    
    var pageHeadings = ["CREATE YOUR OWN FOOD GUIDE","SHOW YOU THE LOCATION","DISCOVER GREAT RESTAURANTS"]
    
    var pageImages = ["onboarding-1","onboarding-2","onboarding-3"]
    
    var pageSubHeadings = ["Pin your favorite restaurats and create you own food guide","Search and locate your favourite restaurants on Maps","Find restaurants shared by your friends and other foodies"]
   
    var curretIndex = 0
    
    weak var walkthroughDelegate: WalkthroughPageViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        
        if let startingViewController = contentViewController(at:0){
            setViewControllers([startingViewController],direction: .forward,animated: true,completion: nil)
        }
        delegate = self
    }
}
 // MARK: - UIPageViewControllerDataSource methods

extension WalkthroughPageViewController: UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! WalkthroughContentViewController).index
        index -= 1
        return contentViewController(at: index)
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! WalkthroughContentViewController).index
        index += 1
        return contentViewController(at: index)
    }
    
    func contentViewController(at index:Int) -> WalkthroughContentViewController? {
        if index < 0 || index >= pageHeadings.count {
            return nil
        }
        
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier:"WalkthroughContentViewController") as? WalkthroughContentViewController {
            
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.subHeading = pageSubHeadings[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        return nil
    }
    func forwardPage() {
        curretIndex += 1
        if let nextViewController = contentViewController(at: curretIndex){
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    
}
// MARK: - UIPageViewControllerDelegate methods
extension WalkthroughPageViewController: UIPageViewControllerDelegate{
    
    func pageViewController(_ pageViewController: UIPageViewController,didFinishAnimating finished:Bool, previousViewControllers:[UIViewController],transitionCompleted completed:Bool) {
        if completed{
            if let contentViewController = pageViewController.viewControllers?.first as?
                WalkthroughContentViewController{
                curretIndex = contentViewController.index
                walkthroughDelegate?.didUpdatePageIndex(currentIndex: contentViewController.index)
            }
        }
    }
}
