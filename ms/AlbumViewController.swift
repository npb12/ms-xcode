//
//  AlbumViewController.swift
//  ms
//
//  Created by Neil Ballard on 6/22/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import UIKit
import Foundation

let reuseIdentifier = "Cell1"

class AlbumViewController: UICollectionViewController, UICollectionViewDataSource {

    var albumModel:AlbumModel = AlbumModel(name: "", link: "", cover:"");
    var fbHelper:FBHelper?
    var sources = [UIImage]()
    var photo:UIImage?
            
    var user = User()
    
    var singlePhotoViewController:SinglePhotoViewController?
    
    func photoExecuted(notification:NSNotification){
        let photos:[UIImage]? = notification.userInfo?["photos"] as? [UIImage]
        self.sources = photos!
        self.collectionView!.reloadData()
    }
    
    func executePhoto(){
        self.fbHelper!.fetchPhoto(self.albumModel.link)
    }
    
    func coverPhotoExecuted(notification:NSNotification){
        let photos = notification.userInfo?["photos"] as! Array<UIImage>
        let backgroundImageUIImageView = UIImageView(image: photos[0])
        
        self.collectionView!.backgroundView!.addSubview(backgroundImageUIImageView)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
       // self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("photoExecuted:"), name: "photoNotification", object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("coverPhotoExecuted:"), name: "coverPhotoNotification", object: nil);
        
        self.navigationItem.title = self.albumModel.name;

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return self.sources.count
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! AlbumViewControllerCell
        
        //      cell.textLabel!.text = self.sources[indexPath.row] as String
        //        let imageView = UIImageView(frame: CGRectMake(2, 2, 100, 100));
        //        imageView.image = self.sources[indexPath.row];
        //      cell.contentView.addSubview(imageView);
        cell.backgroundColor = UIColor.blackColor()
        cell.photoimageView.image = self.sources[indexPath.row]
        //         println(self.sources[indexPath.row])
        // Configure the cell
    
        return cell
    }
    

    // MARK: UICollectionViewDelegate

    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        let photo = self.sources[indexPath.row] as UIImage
        
        user.setImage(photo)
        println(photo)
        singlePhotoViewController?.photo = photo
        //println(singlePhotoViewController?.photo)
        //  performSegueWithIdentifier("ShowEachSegue", sender: self)
        return true
    }
    

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
