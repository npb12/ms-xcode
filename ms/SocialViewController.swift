//
//  SocialViewController.swift
//  ms
//
//  Created by Neil Ballard on 6/18/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit

class SocialViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var results = [UIImage(named: "profile"), UIImage(named: "profile2")]
    
    @IBOutlet weak var tableView: UITableView!
    var destController:UserSocialViewController!
    
    let socialhelper = SocialHelper()
    
    
    var sources:  [SocialModel] = []
    var currentSocialModel:SocialModel = SocialModel(userid: "", name: "", photo: "")
    
    override func viewDidLoad() {
        
        //     let user_id = user.getUserID()
        
        //    NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("executeSocialHandle:"), name: "PostInfo", object: nil)
        
        
        //        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("executeSocial:"), name: "socialNotification", object: nil)
        
        //       socialhelper.fetchSocial(user_id)
        
        //   self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "socialCell")
        
        tableView.delegate = self
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.tableView.tableFooterView = UIView(frame: CGRectZero)

        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    func selectRowAtIndexPath(indexPath: NSIndexPath!, animated: Bool, scrollPosition: UITableViewScrollPosition){
    
    }
    */
 /*
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {

    println("selected")
   /*
    self.currentSocialModel = self.sources[indexPath.row]
    if((self.destController) != nil){
    self.destController!.socialModel = self.currentSocialModel
    self.destController!.executeSocialUser()
    }*/
    
    }
*/
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        performSegueWithIdentifier("socialSegue", sender: self)        
    }
    
    
    @IBAction func goBackSocial(segue:UIStoryboardSegue) {
        
    }
    
    
  /*
    func selectRowAtIndexPath(indexPath: NSIndexPath!, animated: Bool, scrollPosition: UITableViewScrollPosition){
    println("selectrowatindexpath")
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
    var cell = tableView.dequeueReusableCellWithIdentifier("socialCell") as! SocialTableViewCell
    let data = self.sources[indexPath.row]
    cell.socialImageView.image = data.photo
    cell.socialNameLabel.text = data.name
    return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    return self.sources.count ?? 0
    
    }
    
     */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if(segue.identifier == "socialSegue"){
    let destinitionController = segue.destinationViewController as? UserSocialViewController
//    destinitionController!.socialModel = self.currentSocialModel
    //self.destController = destinitionController
    }
    println("trying to prepare")
    }
    

    
    /*
    override func viewDidDisappear(animated: Bool) {
    //   NSNotificationCenter.defaultCenter().removeObserver(self, name: "PostInfo", object: nil)
    NSNotificationCenter.defaultCenter().removeObserver(self, name: "socialNotification", object: nil)
    }
    
    func executeSocial(notification:NSNotification){
    let data:[SocialModel]? = notification.userInfo?["data"] as? [SocialModel]
    self.sources = data!
    self.tableView?.reloadData()
    
    
    }
    */
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.results.count ?? 0
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier("socialCell") as! SocialTableViewCell
        cell.socialImageView.image = self.results[indexPath.row]
        cell.applyPlainShadow()
      //  cell.applyPlainShadow2()
        return cell
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */


}
