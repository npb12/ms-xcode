//
//  MissedViewController.swift
//  ms
//
//  Created by Neil Ballard on 6/8/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit

class MissedViewController: UIViewController, UITableViewDataSource{
    

    var results = [UIImage(named: "profile"), UIImage(named: "profile2"), UIImage(named: "profile2"), UIImage(named: "profile2")]
    
    let user = User()


    
    /*
     * new server code (below)
    */
    @IBOutlet weak var tableView: UITableView?
    //var destController:UserMissedViewController!
    
    let missedhelper = MissedHelper()
    let missedCell = MissedTableViewCell()


    var sources:  [MissedModel] = []
    var currentMissedModel:MissedModel = MissedModel(userid: "", name: "", photo: "")
    
    /*
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
      performSegueWithIdentifier("missedSegue", sender: self)
      self.currentMissedModel = self.sources[indexPath.row]
      if((self.destController) != nil){
        self.destController!.missedModel = self.currentMissedModel
        self.destController!.executeMissedUser()
      }
    }
    
    func selectRowAtIndexPath(indexPath: NSIndexPath!, animated: Bool, scrollPosition: UITableViewScrollPosition){
      println("selectrowatindexpath")
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
      var cell = tableView.dequeueReusableCellWithIdentifier("missedCell") as! MissedTableViewCell
      let data = self.sources[indexPath.row]
      cell.missedImageView.image = data.photo
      cell.missedNameLabel.text = data.name
      cell.missedAmountLabel.text = data.amount
      return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
      return self.sources.count ?? 0
    
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      if(segue.identifier == "missedSegue"){
        let destinitionController = segue.destinationViewController as? MissedViewController
        destinitionController!.missedModel = self.currentMissedModel
        self.destController = destinitionController
      }
      println("trying to prepare")
    }

     */
    
    override func viewDidLoad() {
                
   //     let user_id = user.getUserID()
        

        
        //    NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("executeMissedHandle:"), name: "PostInfo", object: nil)
        
        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("executeMissed:"), name: "missedNotification", object: nil)
        
 //       missedhelper.fetchMissed(user_id)
        
    //   self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "missedCell")
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
 /*
    override func viewDidDisappear(animated: Bool) {
     //   NSNotificationCenter.defaultCenter().removeObserver(self, name: "PostInfo", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "missedNotification", object: nil)
    }
    
    func executeMissed(notification:NSNotification){
        let data:[MissedModel]? = notification.userInfo?["data"] as? [MissedModel]
        self.sources = data!
        self.tableView?.reloadData()
        
        
    }
*/
   
    
    @IBAction func goBackMissedView(segue:UIStoryboardSegue) {
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.results.count ?? 0
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier("missedCell") as! MissedTableViewCell
        cell.missedImageView.image = self.results[indexPath.row]
      //  cell.applyPlainShadow(missedCell.outer_layer!)
      //  cell.applyCurvedShadow(missedCell.outer_layer!)
      //  cell.applyHoverShadow(missedCell.outer_layer!)
        return cell
    }

}
