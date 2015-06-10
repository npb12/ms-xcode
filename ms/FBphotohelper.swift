//
//  FBphotohelper.swift
//  ms
//
//  Created by Neil Ballard on 5/24/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import Foundation

class FBHelper{
    var fbSession:FBSession?
    var user = User()
    
    init(){
        self.fbSession = nil
    }
    
    func fbAlbumRequestHandler(connection:FBRequestConnection!, result:AnyObject!, error:NSError!){

        if let gotError = error{
            println(gotError.description)
        }
        else{
            let graphData = result.valueForKey("data") as! Array<FBGraphObject>
            var albums = [AlbumModel] ()
            for obj:FBGraphObject in graphData{
                let desc = obj.description
               // println(desc)
                let name = obj.valueForKey("name") as! String
             //   println(name)
                if(name == "ETC"){
                    let test=""
                }
                let id = obj.valueForKey("id") as! String
                var cover = ""
                if let existsCoverPhoto : AnyObject = obj.valueForKey("cover_photo"){
                    let coverLink = existsCoverPhoto  as! String
                    cover = "/\(coverLink)/photos"
                }
                
                
                let link = "/\(id)/photos"
                

                
                
                let model = AlbumModel(name: name, link: link, cover:cover)
                albums.append(model)
                

             
            }
            NSNotificationCenter.defaultCenter().postNotificationName("albumNotification", object: nil, userInfo: ["data":albums])
        }
    }
    
    func fetchPhoto(link:String){
        let fbRequest = FBRequest.requestForMe()
        fbRequest.graphPath = link
        fbRequest.startWithCompletionHandler(fetchPhotosHandler)        

    }
    
    
    
    func fetchPhotosHandler(connection:FBRequestConnection!, result:AnyObject!, error:NSError!){
        if let gotError = error{
            
        }
        else{
            var pictures = [UIImage]()
            let graphData = result.valueForKey("data") as! Array<FBGraphObject>
            var albums = [AlbumModel] ()
            for obj:FBGraphObject in graphData{
             //   println(obj.description)
                let pictureURL = obj.valueForKey("picture") as! String
                let url = NSURL(string: pictureURL)
                let picData = NSData(contentsOfURL: url!)
                let img = UIImage(data: picData!)
                pictures.append(img!)
            }
            
            NSNotificationCenter.defaultCenter().postNotificationName("photoNotification", object: nil, userInfo: ["photos":pictures])
        }
    }
    
    
    
    
    func fetchAlbum(){

        let request =  FBRequest.requestForMe()
        request.graphPath = "me/albums"
        
        request.startWithCompletionHandler(fbAlbumRequestHandler)
    }
    
    
    func fbHandler(session:FBSession!, state:FBSessionState, error:NSError!){

        if let gotError = error{
            //got error
        }
        else{
            
            self.fbSession = session
            
            FBRequest.requestForMe()?.startWithCompletionHandler(self.fbRequestCompletionHandler)
        }
    }
    
    func fbRequestCompletionHandler(connection:FBRequestConnection!, result:AnyObject!, error:NSError!){
        
        if let gotError = error{
            //got error
        }
        else{


            let userImageURL = "https://graph.facebook.com/\(self.user.user_id)/picture?type=normal"
            
            let url = NSURL(string: userImageURL)
            
            let imageData = NSData(contentsOfURL: url!)
            
            let image = UIImage(data: imageData!)
            
        //    println("userFBID: \(self.user.user_id)  image: \(image)")
            
            var userModel = User_Photos(image: image!)
            
            
            NSNotificationCenter.defaultCenter().postNotificationName("PostData", object: userModel, userInfo: nil)
            

        }
    }
}