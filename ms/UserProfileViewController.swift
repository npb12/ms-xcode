//
//  UserProfileViewController.swift
//  ms
//
//  Created by Neil Ballard on 6/18/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var PhotoView:UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var social_image = [UIImage(named: "Facebook-icon"), UIImage(named: "Instagram-icon"), UIImage(named: "Snapchat-icon")]
    var social_text: [String] = ["Facebook", "Instagram", "Snapchat"]
    
    var image1 = UIImage(named: "sol_pic")

    var destController:SocialWebViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 //       self.PhotoView.image = self.profile
        // Do any additional setup after loading the view.
        
       self.tableView.tableFooterView = UIView(frame: CGRectZero)
       // self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "usersocialCell")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        println("hello")
        performSegueWithIdentifier("WebSegue", sender: self)
        
    }


    
    func selectRowAtIndexPath(indexPath: NSIndexPath!, animated: Bool, scrollPosition: UITableViewScrollPosition){
    println("selectrowatindexpath")
    
    }
    
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.social_image.count ?? 0
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier("usersocialCell") as! UserProfileTableViewCell
        cell.socialImageView.image = self.social_image[indexPath.row]
        cell.socialTextView.text = self.social_text[indexPath.row]
        return cell
    }
/*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "WebSegue"){
            let destinitionController = segue.destinationViewController as? SocialWebViewController
            self.destController = destinitionController
        }
        println("trying to prepare")
    }
 */   
        
        
}


