//
//  Crops.swift
//  
//
//  Created by Juan Venegas on 2/14/16.
//
//

import Foundation


enum CropType {
    case Corn, Grass, Soy, Empty
    
    func getCropName() -> String{
        if(self == .Corn){
            return "Corn"
        }
        else if(self == .Soy){
            return "Soybean"
        }
        else if(self == Grass){
            return "Switchgrass"
        }
        else{
            return "Empty"
        }
    }
    
    func getCropCost() -> Float{
        switch self{
        case .Corn:
            return 600.0
        case .Soy:
            return 450.0
        case Grass:
            return 200.0
        default:
            return 0.0
            
        }
    }
    
    func getCropSellingPrice() -> Float{
        switch self{
        case .Corn:
            return 4.75
        case .Soy:
            return 11.0
        case .Grass:
            return 50.0
        default:
            return 0.0
        }
    }
    
    func getCropYield() -> Float{
        switch self{
        case .Corn:
            return 160.0
        case .Soy:
            return 45.0
        case .Grass:
            return 6.0
        default:
            return 0.0
        }
    }
    
    func getCropSprite() -> String {
        switch self {
        case .Corn : return "R-corn.png"
        case .Soy : return "R-soybean.png"
        case .Grass : return "R-switchgrass.png"
        case .Empty : return ""
        }
    }
    
    func getLandSprite(farmNum : Int) -> String{
        switch self{
        case .Corn: return String(format:"R-map%d_corn", farmNum)
        case .Soy: return String(format:"R-map%d_bean", farmNum)
        case .Grass: return String(format:"R-map%d_grass", farmNum)
        default : return String(format:"R-map%d", farmNum)
        }
    }
    
    
}