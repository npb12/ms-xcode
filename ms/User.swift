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
        let defaults = NSUserDefaults.standardUserDefaults()
        self.instagram_name = defaults.stringForKey("instagram")
        
      return self.instagram_name!
        
        
    }
    
    func getLinkedinName()-> String
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        self.linkedin_url = defaults.stringForKey("linkedin")
        
        return self.linkedin_url!
        
        
    }
    
    func getSnapchatName()-> String
    {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        self.snapchat_name = defaults.stringForKey("snapchat")
        
        return self.snapchat_name!
        
        
    }
  
    func setImage(image: UIImage){
        
        let defaults = NSUserDefaults.standardUserDefaults()

   
        let imageData = UIImagePNGRepresentation(image)
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        
        for i in 0...4
        {
            println("imagePath\(i)")
            if defaults.objectForKey("imagePath\(i)") === nil {

            let path = "user_image\(i)"
            println(path)
            let imagePath = paths.stringByAppendingPathComponent(path)
            println(imagePath)

        
            if !imageData.writeToFile(imagePath, atomically: false)
            {
                println("not saved")
            }   else {
                println("saved")
                NSUserDefaults.standardUserDefaults().setObject(imagePath, forKey: "imagePath\(i)")
                NSUserDefaults.standardUserDefaults().synchronize()

            }
             
              break
            }
            
        }
        
    }
    /*
    */
    func getImage(i: Int)->UIImage
    {
        
        let default_image = UIImage(named: "default_image") as UIImage?
    
        
        let nsDocumentDirectory = NSSearchPathDirectory.DocumentDirectory
        let nsUserDomainMask    = NSSearchPathDomainMask.UserDomainMask
        if let paths            = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        {
            if paths.count > 0
            {
                if let dirPath = paths[0] as? String
                {
                    let path = "user_image\(i)"
                    if let readPath = dirPath.stringByAppendingPathComponent(path) as String?{
                        if let image = UIImage(contentsOfFile: readPath){
                            println(path)
                            return image
                        }
                    }
                }
            }
        }
        
        
        return default_image!

        
    }
    
    
}