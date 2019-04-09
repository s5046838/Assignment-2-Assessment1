//
//  Animal.swift
//  GUIApp
//
//  Created by Kayn Critchley on 18/3/19.
//  Copyright © 2019 Kayn Critchley. All rights reserved.
//

import Foundation


class Location{
    var name: String = ""
    var address: String = ""
    var latitude: Double
    var longitude: Double
    
    init(name:String, address: String, latitude: Double, longitude: Double){
        self.name = name
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        
    }
}
