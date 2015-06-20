//
//  AlbumViewController.swift
//  ms
//
//  Created by Neil Ballard on 5/24/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import Foundation



import Foundation
class AlbumViewController:UITableViewController{
    
    var albumModel:AlbumModel = AlbumModel(name: "", link: "", cover:"");
    var fbHelper:FBHelper?
    var sources = [UIImage]();
    var photo:UIImage?
    var frame: Int!
    
    var user = User()
    
    var singlePhotoViewController:SinglePhotoViewController?

    func photoExecuted(notification:NSNotification){
        let photos:[UIImage]? = notification.userInfo?["photos"] as? [UIImage]
        self.sources = photos!
        self.tableView.reloadData()
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let img = self.sources[indexPath.row]
       // println(img.size.height)
        return img.size.height
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
  
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell1") as! UITableViewCell
  //      cell.textLabel!.text = self.sources[indexPath.row] as String
  //        let imageView = UIImageView(frame: CGRectMake(2, 2, 100, 100));
  //        imageView.image = self.sources[indexPath.row];
    //      cell.contentView.addSubview(imageView);
            cell.imageView!.image = self.sources[indexPath.row];
   //         println(self.sources[indexPath.row])
        return cell;
        
    
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sources.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
       
        let photo = self.sources[indexPath.row] as UIImage

        user.setImage(photo)
       // println(photo)
        singlePhotoViewController?.photo = photo
        //println(singlePhotoViewController?.photo)
      //  performSegueWithIdentifier("ShowEachSegue", sender: self)
        
    }
    
    
    
    func executePhoto(){
        self.fbHelper!.fetchPhoto(self.albumModel.link)
    }
 
    func coverPhotoExecuted(notification:NSNotification){
        let photos = notification.userInfo?["photos"] as! Array<UIImage>
        let backgroundImageUIImageView = UIImageView(image: photos[0])
        
        self.tableView.backgroundView!.addSubview(backgroundImageUIImageView)
    }

    override func viewDidLoad() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("photoExecuted:"), name: "photoNotification", object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("coverPhotoExecuted:"), name: "coverPhotoNotification", object: nil);
        
        self.navigationItem.title = self.albumModel.name;
        
        
        super.viewDidLoad();
    }
    
    override func viewDidDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "coverPhotoNotification", object: nil);
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "photoNotification", object: nil);
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(segue.identifier == "ShowEachSegue"){
            self.singlePhotoViewController = segue.destinationViewController as? SinglePhotoViewController
            
    }
  
}

}