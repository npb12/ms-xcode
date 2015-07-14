//
//  MissedSettingsViewController.swift
//  ms
//
//  Created by Neil Ballard on 7/12/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit

class MissedSettingsViewController: UIViewController, UITableViewDelegate, UITextViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var headingTextView: UITextView!
    
    let user = User()
    

    
    var check = UIImage()
    var social_image = UIImage()
    var social_text:String = ""
    var sources = [MissedSettingsModel]()
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //       self.PhotoView.image = self.profile
        // Do any additional setup after loading the view.
        
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        // self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "usersocialCell")
        
        self.headingTextView.delegate = self
        
        self.headingTextView.text = "Mark"
        
        if(user.getFBSettings() != "unchecked")
        {
            println("helloSusan")
            self.social_image = UIImage(named: "Facebook-icon")!
            self.social_text = user.getName()
            self.check = UIImage(named: "checkmark")!
            let model = MissedSettingsModel(social_info: self.social_text, photo: self.social_image, checkbox: self.check)
            self.sources.append(model)
        }
        
        if(user.getInstagramName() != "INSTAGRAM NAME")
        {
            self.social_image = UIImage(named: "Instagram-icon")!
            self.social_text = user.getInstagramName()
            self.check = UIImage(named: "checkmark")!
            let model = MissedSettingsModel(social_info: self.social_text, photo: self.social_image, checkbox: self.check)
             self.sources.append(model)
        
        }
        
        if(user.getLinkedinName() != "LINKEDIN NAME")
        {
            self.social_image = UIImage(named: "Linkedin-icon")!
            self.social_text = user.getLinkedinName()
            self.check = UIImage(named: "checkmark")!
            let model = MissedSettingsModel(social_info: self.social_text, photo: self.social_image, checkbox: self.check)
             self.sources.append(model)
            
        }
        
        if(user.getSnapchatName() != "SNAPCHAT NAME")
        {
            self.social_image = UIImage(named: "Snapchat-icon")!
            self.social_text = user.getSnapchatName()
            self.check = UIImage(named: "checkmark")!
            let model = MissedSettingsModel(social_info: self.social_text, photo: self.social_image, checkbox: self.check)
             self.sources.append(model)
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
                
    }
    
    
    
    func selectRowAtIndexPath(indexPath: NSIndexPath!, animated: Bool, scrollPosition: UITableViewScrollPosition){
        println("selectrowatindexpath")
        
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.sources.count ?? 0
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier("missedsettingsCell") as! MissedSettingsTableViewCell
        var image = self.sources[indexPath.row].checkbox
        cell.textview.text = self.sources[indexPath.row].social_info
        cell.socialicon.image = self.sources[indexPath.row].photo as UIImage?
        cell.missedsocialcheck.setImage(image, forState: .Normal)
        return cell
    }
    
    
    
    
    
}
