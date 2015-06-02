//
//  AlbumModel.swift
//  ms
//
//  Created by Neil Ballard on 5/24/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import Foundation

class AlbumModel{
    var name = ""
    var link = ""
    var cover = ""
    init(name:String, link:String, cover:String){
        self.name = name
        self.link = link
        self.cover = cover
    }
}