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
  
    func setImage(image: UIImage){
        
        
   
        let imageData = UIImagePNGRepresentation(image)
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        let imagePath = paths.stringByAppendingPathComponent("cached.png")
        
        if !imageData.writeToFile(imagePath, atomically: false)
        {
            println("not saved")
        } else {
            println("saved")
            NSUserDefaults.standardUserDefaults().setObject(imagePath, forKey: "imagePath")
        }
        
    }
    
    
    
    
    
    
    func getImage()->UIImage
    {
        
        let default_image = UIImage(named: "default_image") as UIImage?
        
        println("ehllo")

        
        let nsDocumentDirectory = NSSearchPathDirectory.DocumentDirectory
        let nsUserDomainMask    = NSSearchPathDomainMask.UserDomainMask
        if let paths            = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        {
            if paths.count > 0
            {
                if let dirPath = paths[0] as? String
                {
                    if let readPath = dirPath.stringByAppendingPathComponent("cached.png") as String?{
                        if let image = UIImage(contentsOfFile: readPath){
                            println("helllo")
                            return image
                        }
                    }
                }
            }
        }
        
        
        return default_image!

        
    }
    
    
}