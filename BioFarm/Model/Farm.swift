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
    var cash: Float
    var event: Event
    var year: Int
    
    /*
    Initalizes farm with the default farms saved in a dictionary, and 1 million dollars.
    
    */
    init(){
        fields = [Land(whichField: 1), Land(whichField: 2), Land(whichField: 3), Land(whichField: 4), Land(whichField: 5), Land(whichField: 6), Land(whichField: 7), Land(whichField: 8)]
        cash = 1000000
        event = Event()
        year = 1;
    }
    
    
    /*********************

    Farm related Functions

    *********************/
    
    
    func harvestAll() -> Double{
        
            event.doEvent()
//       var eventSound = eventInfo.eventSound
//        var eventText = eventInfo.eventText

   
        
        
        calcYield(event.eventModifier);
        var revenue = calcRevenue()
        reset()
        
        return revenue;
    }
    
    func reset(){
        //todo reset lands, 
        
        for field in fields{
            field.resetLand()
        }
        
        
    }
    
  
    
    //is this function still neccessary when we can just call it on land?
    func plant (whichField : Int, crop : CropType){
        fields[whichField - 1].plant(crop);
    }
    
    func isEmpty() -> Bool{
        for field in fields{
            if (field.getCrop() != CropType.Empty){
                return false
            }
            
        }
        return true
    }
    
    func cannotBuy() -> Bool{
        //todo 
        return false
    }
    
   
    
    /*******
     
    Getters
     
    *******/
    
     func getEventSound() -> String{
        return event.eventSound
    }
    
    func getModNumber() -> Float{
        return event.eventModifier
    }
    
    func getEventText() -> String{
        return event.eventText
    }
    
    func getCash() -> Float {
        return cash
    }
    
    
    /******
     
    Helper
    
    ******/

       func calcYield(modifierNum: Float) -> Float{
        var totalYield: Float = 0.0;
        for field in fields{
            totalYield += field.calculateYield(modifierNum);
        }
        return totalYield;
    }
    
    func calcRevenue() -> Double{
        var revenue : Double = 0.0;
        for field in fields{
            revenue += field.calculateRevenue();
        }
        return revenue;
    }
    
    func resetFarm(farmNumber : Int){
        for field in fields {
            field.resetLand();
        }
    }
    
    
     
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
    
   
}