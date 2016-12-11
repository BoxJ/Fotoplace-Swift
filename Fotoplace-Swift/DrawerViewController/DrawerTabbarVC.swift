//
//  DrawerTabbarVC.swift
//  Fotoplace-Swift
//
//  Created by jingliang on 2016/12/11.
//  Copyright © 2016年 井良. All rights reserved.
//

import UIKit

class DrawerTabbarVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    fileprivate var selectedController: UIViewController?
    
    
    var selectedIndex:NSInteger {
        willSet {
            if self.viewControllers.count != 0 && newValue < self.viewControllers.count {
                let viewController = self.viewControllers[newValue]
                
                self.addChildViewController(viewController)
                viewController.view.frame = self.view.bounds
                self.view .addSubview(viewController.view)
                viewController .didMove(toParentViewController: self)
                selectedController = viewController
            }
        }
    }
    
    
    
    
    var viewControllers:Array<UIViewController> {
        willSet {
            if (self.viewControllers.count != 0) {
                for viewController in self.viewControllers {
                    viewController.willMove(toParentViewController: nil)
                    viewController.view .removeFromSuperview()
                    viewController.removeFromParentViewController()
                    
                }
            }
        }
        
        didSet {
            if (self.viewControllers.count != 0) {
                self.selectedIndex = 0
            }
        }
    }
    
    
    
    init() {
        self.selectedIndex = 0
        self.viewControllers=[]
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = UIColor.white
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
