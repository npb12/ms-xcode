//
//  File.swift
//  ms
//
//  Created by Neil Ballard on 6/30/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//

import Foundation



class MissedModel{

  
  var userid = ""
  var name = ""
  var photo = ""
  var pub = ""  //does user have any public info (boolean)
  var amount = "" //amount of public social networks
  


    init(userid:String, name:String, photo:String, pub:String, amount:String){
    
      self.userid = userid
      self.name = name
      self.photo = photo
      self.pub = pub
      self.amount = amount

    }

}