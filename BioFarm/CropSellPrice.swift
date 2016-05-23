//
//  CropSellingPrice.swift
//  BioFarm
//
//  Created by Jay Staker on 5/19/16.
//
//

import Foundation

class CropSellPrice {
    static var corn : Float = 4.5
    static var soy : Float = 12.0
    static var grass : Float = 50.0
    
    static func changePrices() {
        corn = Float(arc4random_uniform(350)) / 100.0 + 3.5
        soy = Float(arc4random_uniform(1500)) / 100.0 + 4.0
    }
    
    static func getCropSellingPrice(crop : Crops) -> Float {
        switch crop{
        case .Corn:
            return corn
        case .Soy:
            return soy
        case .Grass:
            return grass
        default:
            return 0.0
        }
    }
    
}