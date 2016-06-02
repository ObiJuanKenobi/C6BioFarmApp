
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
        calcExpense()
    }
    
    func resetLand() {
        //Check for Switchgrass
        if(crop == .Grass || crop == .Grass_O) {
            
            //Check how long it has been planted
            if( numOldCrop % 6 != 0 || numOldCrop == 0) {
                numOldCrop += 1
                crop = Crops.Grass_O
                
            } else {
                //reset switchgrass if older than 7 years
                numOldCrop = 0
                crop = .Empty
                oldCrop = .Grass
            }
            //Reset internal values for money
            revenue = 0.0
            yield = 0.0
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
    
    func calcExpense() -> Float {
        //Calc expense for crop (insured handled in getCropCost)
        expense = self.getCropCost() * Float(getLandSize())
        return expense
    }
    
    /*
     Calculates the yield
     */
    func calculateYield(event : Event) -> Float{
        
        if(getCrop() == .Corn && isInsured()){ // Insured Corn
            yield = crop.getCropYield() * Float(getLandSize()) * max(event.eventModifier, 0.75);
            
            checkCropRotation()
            
        }
        else if (getCrop() == .Corn && !(isInsured())){ // Uninsured Corn
            yield = crop.getCropYield() * Float(getLandSize()) * event.eventModifier;
            
            checkCropRotation()
            
        }else if (getCrop() == .Soy && isInsured()){ // Insured Soy
            yield = crop.getCropYield() * Float(getLandSize()) * max(event.eventModifier, 0.75);
            
            checkCropRotation()
            
        }else if (getCrop() == .Soy && !(isInsured())){ // Uninsured Soy
            yield = crop.getCropYield() * Float(getLandSize()) * event.eventModifier;
            
            checkCropRotation()
    
        }else if(getCrop() == .Grass || getCrop() == .Grass_O){ // Grass
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
        revenue = crop.getCropSellingPrice() * yield;
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
    
    func getReport() -> (crop : Crops, expense : Float, revenue : Float) {
        return (crop : crop, expense : expense, revenue : revenue)
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