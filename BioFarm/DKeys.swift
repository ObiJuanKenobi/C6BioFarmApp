//
//  DKeys.swift
//  BioFarm
//
//  Created by Jay Staker on 6/2/16.
//
//

import Foundation

//DO NOT USE
class Storage {
    static let data = NSUserDefaults.standardUserDefaults()
    /*
    static func saveFarm (farm: Farm) {
        data.setObject(farm, forKey: DKeys.farm)
        data.synchronize()
    }
    
    static func loadFarm() -> Farm {
        let temp = data.objectForKey(DKeys.farm)
        if(temp != nil) {
            return temp as! Farm
        }
        else {
            return Farm()
        }
    }
    */
}

struct DKeys {
    static let farm = "FARM"
    static let score = "SCORE"
}