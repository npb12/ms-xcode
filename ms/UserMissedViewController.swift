//
//  UserMissedViewController.swift
//  ms
//
//  Created by Neil Ballard on 7/2/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit

class UserMissedViewController: UIViewController {
    
    var missedHelper:MissedHelper?
    
    var missedModel:MissedModel = MissedModel(userid: "", name: "", photo: "")
    
    var missedInfoModel:MissedInfoModel = MissedInfoModel(facebook: "", instagram: "", linkedin: "", snapchat: "")


    
    var social_image = [UIImage]()
    var social_text = [String]()
    var sources = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()

        //NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("executeMissedUser:"), name: "userInfoNotification", object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func executeMissedUser(){
        self.missedHelper!.fetchUserMissedInfo(self.missedModel.userid)
    }
    
    override func viewDidDisappear(animated: Bool) {
//        NSNotificationCenter.defaultCenter().removeObserver(self, name: "userInfoNotification", object: nil);
    }
    
    
/*
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {

    
        
    }
    
    func userInfoExecuted(notification:NSNotification){
        let userData = notification.object as! MissedInfoModel

    
        if(userdata.facebook != "")
        {
            self.sources.append(userdata.facebook)
            self.social_image.append(UIImage(named: "Facebook-icon"))
            self.social_text.append("Facebook")
        }
    
        if(userData.instagram != "")
        {
            self.sources.append(userData.instagram)
            self.social_image.append(UIImage(named: "Instagram-icon"))
            self.social_text.append("Instagram")
        }
    
        if(userData.linkedin != "")
        {
            self.sources.append(userData.linkedin)
            self.social_image.append(UIImage(named: "Linkedin-icon"))
            self.social_text.append("Linkedin")
        }
    
        if(userdata.snapchat != "")
        {
            self.sources.append(userdata.snapchat)
            self.social_image.append(UIImage(named: "Snapchat-icon"))
            self.social_text.append("Snapchat")
        }
        self.tableView!.reloadData()
    }
    

    
    
    
    func selectRowAtIndexPath(indexPath: NSIndexPath!, animated: Bool, scrollPosition: UITableViewScrollPosition){
        println("selectrowatindexpath")
        
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.sources.count ?? 0
        
    }
    
    ["fb_url", "", "linkedin_url", ""]
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier("missedusersocialCell") as! UserMissedTableViewCell
    

        cell.socialImageView.image = self.social_image[indexPath.row]
        cell.socialTextView.text = self.social_text[indexPath.row]
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "WebSegue"){
            let destinitionController = segue.destinationViewController as? SocialWebViewController
            self.destController = destinitionController
        }
        println("trying to prepare")
    }
    
*/

}
