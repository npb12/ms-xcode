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
    
    var missedInfoModel:MissedInfoModel = MissedInfoModel(userid: "", name: "", photo: "", facebook: "", instagram: "", linkedin: "", snapchat: "")


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
        println("hello")
        performSegueWithIdentifier("WebSegue", sender: self)
        
    }
    
    func userInfoExecuted(notification:NSNotification){
    let photos:[UIImage]? = notification.userInfo?["photos"] as? [UIImage]
    self.sources = photos!
    self.collectionView!.reloadData()
    }
    
    
    
    func selectRowAtIndexPath(indexPath: NSIndexPath!, animated: Bool, scrollPosition: UITableViewScrollPosition){
        println("selectrowatindexpath")
        
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.social_image.count ?? 0
        
    }
    
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
