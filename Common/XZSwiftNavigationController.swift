//
//  XZSwiftNavigationController.swift
//  Convenient-Swift
//
//  Created by gozap on 16/3/2.
//  Copyright © 2016年 xuzhou. All rights reserved.
//

import UIKit


class XZSwiftNavigationController: UINavigationController {
    
    var frostedView:UIToolbar?
    var shadowImage:UIImage?
    var navigationBarAlpha:CGFloat{
        get{
            return self.frostedView!.alpha
        }set{
            var value = newValue
            if newValue > 1 {
                value = 1
            }else if value < 0 {
                value = 0
            }
            self.frostedView!.alpha = newValue
            self.navigationBar.layer.shadowOpacity = Float(value * 0.5);
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.titleTextAttributes = [
            NSFontAttributeName : XZFont2(18),
            NSForegroundColorAttributeName : UIColor.whiteColor()
        ]
        self.navigationBar.setBackgroundImage(createImageWithColor(XZSwiftColor.navignationColor), forBarMetrics: .Default)
        self.navigationBar.barStyle = .Default;
        self.navigationBar.tintColor = XZSwiftColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
