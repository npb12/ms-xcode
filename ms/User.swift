//
//  User.swift
//  ms
//
//  Created by Neil Ballard on 5/22/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import Foundation


class User{
    
    var user_id: String!
    var user_name: String!
    var instagram_name: String?
    var linkedin_url: String?
    var snapchat_name: String?
    var images = [UIImage]()
    
    

    
    
    func setInstagramName(name: String?){
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(name, forKey: "instagram")
        defaults.synchronize()
        
    }
    
    func setLinkedinURL(name: String?){
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(name, forKey: "linkedin")
        defaults.synchronize()
        
    }
    
    func setSnapchatName(name: String?){
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(name, forKey: "snapchat")
        defaults.synchronize()
        
        
    }
    
    
    func getUserID()-> String
    {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if let name = defaults.stringForKey("userID")
        {
            println(name)
        }
        
        return self.user_id!
        
        
    }
    
    func getName()-> String
    {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        self.user_name = defaults.stringForKey("name")
    
       return self.user_name!
    

    }
    
    func getInstagramName()-> String
    {
        
      return self.instagram_name!
        
        
    }
    
    func getLinkedinName()-> String
    {
        
        return self.linkedin_url!
        
        
    }
    
    func getSnapchatName()-> String
    {
        
        return self.snapchat_name!
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}