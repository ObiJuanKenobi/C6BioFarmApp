//
//  Crops.swift
//
//
//  Created by Juan Venegas on 2/14/16.
//  Last Modified by Alex Berns on Summer 2016
//

import Foundation

enum Crops{
    case Corn, Grass, Grass_O, Soy, Empty
    
    func getCropName() -> String{
        switch self {
        case .Corn:
            return "Corn"
        case .Soy:
            return "Soybean"
        case .Grass, .Grass_O:
            return "Switchgrass"
        default:
            return "Nothing"
        }
    }
    
    func getCropShortName () -> String {
        switch self {
        case .Corn:
        return "Corn"
        case .Soy:
        return "Soy"
        case .Grass, .Grass_O:
        return "SGrass"
        default:
        return "Nothing"
    }
    }

    /*
     Returns the cost / acre
     */
    func getCropCost() -> Float{
        switch self{
        case .Corn:
            return 600.0
        case .Soy:
            return 450.0
        case .Grass:
            return 200.0
        case .Grass_O:
            return 125.0
        default:
            if(Options.idleCostOn) {
                return 75.0
            }
            else {
                return 0.0
            }
        }
    }
    
    /*
     Returns the cost / acre
     */
    func getCropInsuredCost() -> Float {
        switch self{
        case .Corn:
            return 800.0
        case .Soy:
            return 600.0
        default:
            return self.getCropCost()
            
        }
    }
    
    /*
     Returns the Dollars per Bushel/Ton
     */
    func getCropSellingPrice() -> Float{
        switch self{
        case .Corn:
            return CropSellPrice.corn
        case .Soy:
            return CropSellPrice.soy
        case .Grass, .Grass_O:
            return CropSellPrice.grass
        default:
            return 0.0
        }
    }
    
    /*
     Returns the Bushels/Ton per Acre
     */
    func getCropYield() -> Float{
        switch self{
        case .Corn:
            return 160.0
        case .Soy:
            return 45.0
        case .Grass, .Grass_O:
            return 5.0
        default:
            return 0.0
        }
    }
    
    func getCropSprite() -> String {
        switch self {
        case .Corn : return "R-corn.png"
        case .Soy : return "R-soybean.png"
        case .Grass, .Grass_O : return "R-switchgrass.png"
        default : return ""
        }
    }
    
    func getNConsumed() -> Float {
        
        return 0.0
    }
    
    func getPConsumed() -> Float {
        
        return 0.0
    }
    
    func getKConsumed() -> Float {
        
        return 0.0
    }
    
    func getNRestored() -> Float {
        
        return 0.0
    }
    
    func getPRestored() -> Float {
        
        return 0.0
    }
    
    func getKRestored() -> Float {
        
        return 0.0
    }
    
    func getCropPlantInfo() -> String {
        switch self {
        case .Corn : return "Corn is the most profitable of the crops, with a high yield per acre and decent selling price."
        case .Soy : return "Soybeans are riskier than corn but replenish the nutrients taken by the corn. This helps with crop rotation."
        case .Grass, .Grass_O : return "Switchgrass is a hardy crop. It resists many of the negative effects that would harm the other crops and it is not lost during a flood."
        default : return ""
        }
    }
    
    func getCropInfo() -> String {
        switch self {
        case .Corn : return "Corn is processed for food for both humans and animals along with industrial products such as ethanol."
        case .Soy : return "Soybeans are processed for oil, animal feed, and other industrial products. A small percentage is used for human consumption such as soymilk, soy, and flour."
        case .Grass, .Grass_O : return "Switchgrass is used as feedstock for animals and other bio-friendly uses such as the development of bio-mass, methods for energy production, and cover for soil.\nSwitchgrass is also resistent to flooding."
        default : return ""
        }
    }
    
    func getLandSprite(farmNum : Int) -> String{
        switch self{
        case .Corn: return String(format:"R-map%d_corn", farmNum)
        case .Soy: return String(format:"R-map%d_bean", farmNum)
        case .Grass, .Grass_O: return String(format:"R-map%d_grass", farmNum)
        default : return String(format:"R-map%d", farmNum)
        }
    }
    
    
}