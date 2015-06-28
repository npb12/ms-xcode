//
//  MissedViewController.swift
//  ms
//
//  Created by Neil Ballard on 6/8/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit

class MissedViewController: UIViewController, UITableViewDataSource{
    

    var results = [UIImage(named: "profile"), UIImage(named: "profile2")]

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
/*
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {

    }
    
    func selectRowAtIndexPath(indexPath: NSIndexPath!, animated: Bool, scrollPosition: UITableViewScrollPosition){
        println("selectrowatindexpath")
        
    }
    

*/
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.results.count ?? 0
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier("missedCell") as! MissedTableViewCell
        cell.missedImageView.image = self.results[indexPath.row]
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
