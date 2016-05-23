
//
//  Land.swift
//  BioFarm
//
//  Created by Berns, Alex J on 12/11/14.
//  Last Modified by Alex Berns on Summer 2016
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
    var expense: Float = 0.0
    var revenue: Float = 0.0
    var yield: Float = 0.0
    let fieldSizes:[Int] = [175, 250, 180, 150, 60, 60, 65, 60]
    
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
        //Calc expense for crop (insured handled in getCropCost)
        expense = self.getCropCost() * Float(getLandSize())
    }
    
    
    func resetLand() {
        //Check for Switchgrass
        if(crop == .Grass) {
            //Check how long it has been planted
            if( numOldCrop % 6 != 0 || numOldCrop == 0) {
                numOldCrop += 1
            } else {
                //reset switchgrass if older than 7 years
                numOldCrop = 0
                crop = .Empty
            }
            //Reset internal values for money
            revenue = 0.0
            yield = 0.0
            //Reset Expense since you only pay once
            expense = 0.0
            return
        }
        
        if(oldCrop == crop){
            numOldCrop += 1
        }else{
            numOldCrop = 0
        }
        
        oldCrop = crop
        insured = false
        crop = Crops.Empty
        revenue = 0.0
        expense = 0.0
        yield = 0.0
        
    }
    
    /*
     Calculates the yield but does not take into account of flooding
     ? Where should we calculate flooding?
     */
    func calculateYield(event : Event) -> Float{
        
        if(getCrop() == .Corn && isInsured()){
            yield = crop.getCropYield() * Float(getLandSize()) * max(event.eventModifier, 0.75);
            
            checkCropRotation()
            
        }
        else if (getCrop() == .Corn && !(isInsured())){
            yield = crop.getCropYield() * Float(getLandSize()) * event.eventModifier;
            
            checkCropRotation()
            
        }else if (getCrop() == .Soy && isInsured()){
            yield = crop.getCropYield() * Float(getLandSize()) * max(event.eventModifier, 0.75);
            
            checkCropRotation()
            
        }else if (getCrop() == .Soy && !(isInsured())){
            yield = crop.getCropYield() * Float(getLandSize()) * event.eventModifier;
            
            checkCropRotation()
    
        }else if(getCrop() == .Grass){
            //If there is a flood, switchgrass is immune
            yield = crop.getCropYield() * Float(getLandSize()) * max(event.eventModifier, event.eventModifierGrass);
        }
        else{
            yield = 0.0;
        }
        
        return yield;
    }
    
    func checkCropRotation() {
        //Calculate crop rotation
        for _ in 0..<numOldCrop {
            yield *= 0.5;
        }
    }
    
    func calculateRevenue(event : Event) -> Float{
        calculateYield(event)
        revenue = CropSellPrice.getCropSellingPrice(crop) * yield;
        revenue = round(revenue * 100.0) / 100.0 // 2 decimal precision
        return revenue;
    }
    
    
    /*************************
     
     Getters
     
     *************************/
    
    func getYield() -> Float {
        return yield;
    }
    
    func getRevenue() -> Float {
        return revenue
    }
    
    func getExpense() -> Float {
        return expense
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
        if(insured){
            return crop.getCropInsuredCost()
        }else{
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
     Returns the name of the image that the land's crop has.
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
     Reutrns the size of the land in acres.
     */
    func getLandSize() -> Int {
        return size
    }
    
    func getLabel() -> String {
        return String(format: "%d acres of %@", getLandSize(), getCropName())
    }
    
    /*********************
     
     Setters
     
     *********************/
    /*
     Set whether the land is insured or not.
     */
    func setInsured (newInsured : Bool) {
        insured = newInsured
    }
    
    
    
    
    
    
    
}