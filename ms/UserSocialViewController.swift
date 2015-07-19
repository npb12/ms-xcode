//
//  UserSocialViewController.swift
//  ms
//
//  Created by Neil Ballard on 7/9/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit

class UserSocialViewController: UIViewController {
    
    
    var socialHelper:SocialHelper?
    
    var socialModel:SocialModel = SocialModel(userid: "", name: "", photo: "")
    
    var socialInfoModel:SocialInfoModel = SocialInfoModel(facebook: "", instagram: "", linkedin: "", snapchat: "")
    
    var social_image = [UIImage]()
    var social_text = [String]()
    var sources = [String]()
    
    var destController:SocialWebViewController!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("executeSocialUser:"), name: "userInfoNotification", object: nil)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func executeSocialUser(){
        self.socialHelper!.fetchUserSocialInfo(self.socialModel.userid)
    }
    
    override func viewDidDisappear(animated: Bool) {
        //        NSNotificationCenter.defaultCenter().removeObserver(self, name: "userInfoNotification", object: nil);
    }
    
    
    /*
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
    
    
    
    }
    
    func userInfoExecuted(notification:NSNotification){
    let userData = notification.object as! SocialInfoModel
    
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
    var cell = tableView.dequeueReusableCellWithIdentifier("socialusersocialCell") as! UserSocialTableViewCell
    
    if(indexPath.row == 1){
    
    }
    else if(indexPath.row == 2){
    
    }
    else if(indexPath.row == 3){
    
    }
    else if(indexPath.row == 4){
    
    }
    cell.socialImageView.image = self.social_image[indexPath.row]
    cell.socialTextView.text = self.social_text[indexPath.row]
    return cell
    }
   */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if(segue.identifier == "WebSegue"){
    let destinitionController = segue.destinationViewController as? SocialWebViewController
      self.destController = destinitionController
      }
      println("trying to prepare")
    }
    


}
