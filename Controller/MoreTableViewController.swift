//
//  MoreTableViewController.swift
//  Convenient-Swift
//
//  Created by gozap on 16/3/16.
//  Copyright © 2016年 xuzhou. All rights reserved.
//

import UIKit

class MoreTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "关于我们"
        self.tableView.backgroundColor = XZSwiftColor.convenientBackgroundColor
        self.tableView.separatorStyle = .None

        regClass(self.tableView, cell: MoreTableViewCell.self)
        regClass(self.tableView, cell: More_InterTableViewCell.self)
        regClass(self.tableView, cell: BaseTableViewCell.self)
        
        let leftButton = UIButton()
        leftButton.frame = CGRectMake(0, 0, 35, 30)
        leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0)
        leftButton.setImage(UIImage(named: "bank"), forState: .Normal)
        leftButton.adjustsImageWhenHighlighted = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        leftButton.addTarget(self, action: #selector(HomeViewController.leftClick), forControlEvents: .TouchUpInside)
    }
    func leftClick(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 6
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 220
        }
        if indexPath.row == 1{
            return 100
        }
        if indexPath.row == 2{
            return 15
        }
        return 50
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let moreCell = getCell(tableView, cell: MoreTableViewCell.self, indexPath: indexPath)
            moreCell.selectionStyle = .None
            return moreCell
        }
        if indexPath.row == 1{
            let interCell = getCell(tableView, cell: More_InterTableViewCell.self, indexPath: indexPath)
            interCell.zanImageView?.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(MoreTableViewController.zanImageViewTap)))
            interCell.tuImageView?.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(MoreTableViewController.tuImageView)))
            interCell.selectionStyle = .None
            return interCell
        }
        
        if indexPath.row == 2{
            let cell = UITableViewCell()
            cell.backgroundColor = XZSwiftColor.convenientBackgroundColor
            cell.selectionStyle = .None
            return cell
        }
        let baseCell = getCell(tableView, cell: BaseTableViewCell.self, indexPath: indexPath)
        baseCell.selectionStyle = .None
        baseCell.rightImage?.hidden = false
        if indexPath.row == 3 {
            baseCell.titleLabel?.text = "新浪微博"
            baseCell.detaileLabel?.text = "徐_Aaron"
        }
        if indexPath.row == 4 {
            baseCell.titleLabel?.text = "服务QQ"
            baseCell.detaileLabel?.text = "1043037904"
        }
        if indexPath.row == 5 {
            let infoDict = NSBundle.mainBundle().infoDictionary
            if let info = infoDict {
                // app版本
                let appVersion = info["CFBundleShortVersionString"] as! String!
                baseCell.detaileLabel?.text = "v" + appVersion
                baseCell.rightImage?.hidden = true
            }
        }
        return baseCell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 4{
            UIApplication.sharedApplication().openURL(NSURL(string:"mqq://im/chat?chat_type=wpa&uin=1043037904&version=1&src_type=web")!);
        }
    }
    
    func zanImageViewTap(){
        UIApplication.sharedApplication().openURL(NSURL(string:"itms-apps://itunes.apple.com/app/id1106215431")!);
    }
    func tuImageView(){
        UIApplication.sharedApplication().openURL(NSURL(string:"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1106215431&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8")!);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
