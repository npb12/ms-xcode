//
//  AlbumsViewController.swift
//  ms
//
//  Created by Neil Ballard on 5/24/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import Foundation
import UIKit


class AlbumsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let fbHelper = FBHelper();
    var sources:  [AlbumModel] = []
    var currentAlbumModel = AlbumModel(name: "", link: "", cover:"");
    var destController:AlbumViewController!
    

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet var albumTable: UITableView!
    
    @IBOutlet var tableView: UITableView!

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        performSegueWithIdentifier("photoSegue", sender: self)
        self.currentAlbumModel = self.sources[indexPath.row]
        if((self.destController) != nil){
            self.destController!.albumModel = self.currentAlbumModel
            self.destController!.fbHelper = self.fbHelper
            self.destController!.executePhoto()
        }
    }
    
    func selectRowAtIndexPath(indexPath: NSIndexPath!, animated: Bool, scrollPosition: UITableViewScrollPosition){
        println("selectrowatindexpath")
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell:UITableViewCell = (tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell)!
        let data = self.sources[indexPath.row]
        cell.textLabel!.text = data.name
        cell.detailTextLabel?.text = data.link
        if(data.cover != ""){
            let coverPhotoURL = NSURL(string: data.cover)
            let coverPhotoData = NSData(contentsOfURL: coverPhotoURL!)
            
            //cell.imageView!.image = UIImage(data: coverPhotoData!)
            
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.sources.count
        
    }

    func executeAlbum(notification:NSNotification){
        let data:[AlbumModel]? = notification.userInfo?["data"] as? [AlbumModel]
        self.sources = data!
        self.albumTable?.reloadData()
        

    }

    func executeHandle(notification:NSNotification){
        let userData = notification.object as! User_Photos

        imgProfile.image = userData.image
        

    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "photoSegue"){
         
            let navVC = segue.destinationViewController as! UINavigationController

            
            let collectionVC = navVC.viewControllers.first as? AlbumViewController
            
            collectionVC?.albumModel = self.currentAlbumModel
            
            self.destController = collectionVC
        }

        println("trying to prepare")
    }

    override func viewDidDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "PostData", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "albumNotification", object: nil)
    }
    
    
    override func viewDidLoad() {
        
        
         NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("executeHandle:"), name: "PostData", object: nil)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("executeAlbum:"), name: "albumNotification", object: nil)
        
        fbHelper.fetchAlbum()

        
        self.albumTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    @IBAction func goBack(segue:UIStoryboardSegue) {
        
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
