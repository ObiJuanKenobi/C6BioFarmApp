//
//  Farm.swift
//  BioFarm
//
//  Created by Berns, Alex J on 12/11/14.
//
//

import Foundation
import AVFoundation

/***************************************************************************
 How to use: Farm manages plots of lands and is what is used by the GUI to know what graphics to display
 What it does: contains array for each plot of land and controls events and end of year processes.
 
 Could use a bit of renaming and redoing of certain variables. Land Array needs to be created.
 Make sure to keep decoupled from GUI and store all info needed here. GUI should not call anything but this.

 Juan: This is very short, simplified and I like it. I would like to use this instead of my class so that it would be easier to maintain for future coders. The library will probably be replaced with something else depending on what we agree on. 
 ***************************************************************************/
public class Farm {
    
    var fields : [Land]
    var cash: Double
    var event: Event
    
    /*
    Initalizes farm with the default farms saved in a dictionary, and 1 million dollars.
    
    */
    init(){
        fields = [Land(whichField: 1), Land(whichField: 2), Land(whichField: 3), Land(whichField: 4), Land(whichField: 5), Land(whichField: 6), Land(whichField: 7), Land(whichField: 8)];
        cash = 1000000;
        
    }
    
    
    /*
    Harvest all farms stored in the farmLand array.
    */
    func harvestAll(modifier : Double) -> Double{
<<<<<<< Updated upstream
        var revenue : Double = 0.0;
        for field in fields {
            //alex: still need to check for flooding
            
            //Add revenue to total
            revenue += field.calculateYield(1.0); //Change mod to event mod
=======
        var eventInfo = event.doEvent();
        var modifierNumber = eventInfo.eventModifier;
        var eventSound = eventInfo.eventSound;
        var eventText = eventInfo.eventText;
        
        for(var i  = 0; i < 8; i++){
            fields[i].calculateYield(modifierNumber);
>>>>>>> Stashed changes
        }
        
        return revenue;
    }
    
    func plant (whichField : Int, crop : CropType){
        fields[whichField - 1].plant(crop);
    }
    
    //Money Methods $$
    
    /*
    Adds the amount of money that is sent to the function to cash.
    */
    func addMoney(amount : Double){
        cash = cash + amount
    }
    
    /*
    Subtracts the amount of money that is sent to the fuction from cash.
    */
    func subMoney(amount : Double){
        cash = cash - amount
    }
    
    /*
    Retruns the amount of cash that is in the farm.
    */
    func getCash() -> Double {
        return cash
    }
    
    /*
    Resets a farm based on the number of the farm. Sets crop to empty and insured to false. Readds money spent
    to buy that farm to cash.
    */
    func resetFarm(farmNumber : Int){
        for field in fields {
            field.resetLand();
        }
    }
   
   
}