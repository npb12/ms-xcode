//
//  SinglePhotoViewController.swift
//  ms
//
//  Created by Neil Ballard on 5/27/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import Foundation
//
//  singlePhotoViewController.swift
//  ms
//
//  Created by Neil Ballard on 5/27/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import Foundation
import UIKit



class SinglePhotoViewController: UIViewController {
    
     var photo:UIImage!
    
   
    @IBOutlet weak var photoLarge: UIImageView!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    override func viewDidLoad() {
        
        photoLarge.image = photo

        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    user.setImage(photo, frame)

    
    
}