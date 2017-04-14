//
//  BaseTabBarController.swift
//  iosblackcard
//
//  Created by J-bb on 17/4/14.
//  Copyright © 2017年 YunDian. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewControllers()
        
    }

    
    func setViewControllers()  {

        let vcNameArray = ["BlackCardViewController",
                           "TribeViewController",
                           "ClubViewController",
                           "PrivateAdvisoryViewController",
                           "StewardViewController",
                           "UserViewController"]
        let titlesArray = ["黑卡","部落","俱乐部","私董会","管家","我的"]
        var vcArray = [UIViewController]()
        for index in 0...vcNameArray.count - 1 {
            let cls = NSClassFromString(vcNameArray[index]) as? UIViewController.Type
            guard cls != nil else {
                return
            }
            let vc = cls!.init()
            let item = UITabBarItem(title: titlesArray[index], image: nil, tag: 1000+index)
            if vcNameArray[index] == "BlackCardViewController" {
                vc.tabBarItem = item
                vcArray.append(vc)
            } else {
                let nc = BaseNavigationController(rootViewController: vc)
                nc.tabBarItem = item
                vcArray.append(nc)
            }
        }
        viewControllers = vcArray
    }

}
