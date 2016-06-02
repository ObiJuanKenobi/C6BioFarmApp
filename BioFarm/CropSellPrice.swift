//
//  CropSellingPrice.swift
//  BioFarm
//
//  Created by Alex Berns on 5/19/16.
//  Last Modified by Alex Berns on Summer 2016
//

import Foundation

class CropSellPrice {
    static var corn : Float = 4.5
    static var soy : Float = 12.0
    static var grass : Float = 50.0
    
    static func changePrices() {
        let i = arc4random_uniform(100)
        if (i<25) { //25%
            priceLow()
        } else if (i < 75) { //50%
            priceMid()
        } else { //25%
            priceHigh()
        }
    }
    
    private static func priceLow() {
        //Corn Price: 3.5 - 4.5
        corn = Float(arc4random_uniform(100)) / 100.0 + 3.5
        //Soy Price: 4.0 - 8.0
        soy = Float(arc4random_uniform(200)) / 100.0 + 6.0
        //Grass Price: 30 - 35
        grass = Float(arc4random_uniform(500)) / 100.0 + 30.0
    }
    
    private static func priceMid() {
        //Corn Price: 4.5 - 5.5
        corn = Float(arc4random_uniform(100)) / 100.0 + 4.5
        //Soy Price: 8.0 - 12.0
        soy = Float(arc4random_uniform(400)) / 100.0 + 8.0
        //Grass Price: 35 - 45
        grass = Float(arc4random_uniform(1000)) / 100.0 + 35.0
    }
    
    private static func priceHigh() {
        //Corn Price: 5.5 - 6.0
        corn = Float(arc4random_uniform(50)) / 100.0 + 5.5
        //Soy Price: 12.0 - 14.0
        soy = Float(arc4random_uniform(200)) / 100.0 + 12.0
        //Grass Price: 45 - 50
        grass = Float(arc4random_uniform(500)) / 100.0 + 45.0
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