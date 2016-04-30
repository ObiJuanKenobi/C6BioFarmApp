
//
//  Land.swift
//  BioFarm
//
//  Created by Berns, Alex J on 12/11/14.
//
//

import Foundation
//let ARC4RANDOM_MAX 0x100000000

/***************************************************************************
 How to use: Land is to be used in an array in Farm.
 What it does: Handles each plot and manages planting cost and yeild.
 
 Need to change some enums to be updated. Also need to add the Biomass.
 Clean some old values out and rename some functions to be more descriptive.
 ***************************************************************************/

//Land should stay as a class becuase it can be very useful for further changes, but the methods
//need to be changed so that it accurately calculates and stores data
// this is very long but can be adjusted and simplified for better management
//Juan: I would actually like to use this in the game

//should Crops be seperated from this class and have its own seperate catagory?
//Juan: I believe it would be best because enums can have function which can simplify
//some of the functions being used in this class



/*
 An Enumerated type for the for the different crops.
 take it out and have it seperated
 */


class Land {
    private var size : Int
    private var crop : Crops
    private var insured : Bool
    var revenue: Float = 0.0
    let fieldSizes:[Int] = [175, 250, 180, 150, 60, 60, 65, 60]
    var fieldYield : Float = 0.0;
    
    //Crop Rotation Variables
    var oldCrop : Crops = Crops.Empty
    var numOldCrop : Int = 0
    
    /*
     Intializes the land object with the specified size an empty Crops and no insurance.
     */
    init(whichField: Int) {
        size = fieldSizes[whichField];
        crop = Crops.Empty
        insured = false
    }
    
    
    /********************
     
     Land related Functions
     
     ********************/
    
    
    
    /*
     Sets the crop type of the land to the specified crop type.
     */
    func plant (toPlant : Crops){
        crop = toPlant
    }
    
    
    func resetLand() {
        if(crop == .Grass) {
            if( numOldCrop % 7 != 0 || numOldCrop == 0) {
                numOldCrop += 1;
            } else {
                //reset grass stuff
                numOldCrop = 0;
                crop = .Empty;
            }
            revenue = 0.0;
            fieldYield = 0.0;
            return;
        }
        
        if(oldCrop == crop){
            numOldCrop += 1;
        }else{
            numOldCrop = 0
        }
        
        oldCrop = crop;
        insured = false;
        crop = Crops.Empty;
        revenue = 0.0;
        fieldYield = 0.0;
        
    }
    
    /*
     Calculates the yield but does not take into account of flooding
     ? Where should we calculate flooding?
     */
    func calculateYield(modifier : Float) -> Float{
        if(getCrop() == .Corn && isInsured()){
            fieldYield = crop.getCropYield() * Float(getLandSize()) * max(modifier, 0.75);
            //Calculate crop rotation
            for(var i = 0; i < numOldCrop; i += 1){
                fieldYield *= 0.5;
            }
        }
        else if (getCrop() == .Corn && !(isInsured())){
            fieldYield = crop.getCropYield() * Float(getLandSize()) * modifier;
            //Calculate crop rotation
            for(var i = 0; i < numOldCrop; i += 1){
                fieldYield *= 0.5;
            }
        }else if (getCrop() == .Soy && isInsured()){
            fieldYield = crop.getCropYield() * Float(getLandSize()) * max(modifier, 0.75);
            //Calculate crop rotation
            for(var i = 0; i < numOldCrop; i += 1){
                fieldYield *= 0.5;
            }
        }else if (getCrop() == .Soy && !(isInsured())){
            fieldYield = crop.getCropYield() * Float(getLandSize()) * modifier;
            //Calculate crop rotation
            for(var i = 0; i < numOldCrop; i += 1){
                fieldYield *= 0.5;
            }
        }else if(getCrop() == .Grass){
            fieldYield = crop.getCropYield() * Float(getLandSize()) * modifier;
            
            for(var i = 0; i < numOldCrop; i += 1){
                fieldYield *= 0.5
            }
        }
        else{
            fieldYield = 0.0;
        }
        
        return fieldYield;
    }
    
    func calculateRevenue() -> Float{
        revenue = crop.getCropSellingPrice() * fieldYield;
        return revenue;
    }
    
    
    /*************************
     
     Getters
     
     *************************/
    
    /*
     Returns the yield of the field but this value is calculated in another function
     alex: made this since we need it in Farm
     */
    
    func getPreviousCrop() -> Crops {
        return oldCrop
    }
    
    func getYield() -> Float {
        return fieldYield;
    }
    
  
    func getCrop() -> Crops {
        return crop
    }
    
    func getOldCrop() -> Crops {
        return oldCrop
    }
    
    /*
     Returns the cost of buying the crop type of the land.
     This fuction could be simplified if the enum Crops had a
     return crop cost function
     */
    func getCropCost() -> Float {
        if(insured && crop == .Corn){
            return 800.0;
        }else if(insured && crop == .Soy){
            return 600.0
        }else{
            //alex: Um this makes a recusive loop, I think
            return crop.getCropCost()
        }
        
    }
    
    /*
     Returns the current crop name.
     */
    func getCropName() ->String {
        return crop.getCropName();
    }
    
    func getCropSprite() -> String {
        return crop.getCropSprite();
    }
    
    
    /*
     Reurns the name of the image that the land's crop has.
     */
    
    func getLandSprite(whichField: Int) -> String{
        
        return crop.getLandSprite(whichField + 1);
    }
    /*
     Returns whether the land is insured or not.
     */
    func isInsured() -> Bool {
        return insured
    }
    
    /*
     Set whether the land is insured or not.
     */
    func setInsured (newInsured : Bool) {
        insured = newInsured
    }
    
    /*
     Reutrns the size of the land in acres.
     */
    func getLandSize() -> Int {
        return size
    }
    
    /*********************
     
     Setters
     
     *********************/
    
    /*
     Sets the lands crop to the specified type.
     */
    func setCrop (newCrop : Crops) {
        crop = newCrop
    }
    
    
    
    
    
    
    
}