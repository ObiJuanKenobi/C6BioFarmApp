//
//  Farm.swift
//  BioFarm
//
//  Created by Berns, Alex J on 12/11/14.
//  Last Modified by Alex Berns on Summer 2016
//
//

import Foundation
import AVFoundation

/***************************************************************************
 How to use: Farm manages plots of lands and is what is used by the GUI to know what graphics to display
 What it does: contains array for each plot of land and controls events and end of year processes.
 
 Could use a bit of renaming and redoing of certain variables. Land Array needs to be created.
 Make sure to keep decoupled from GUI and store all info needed here. GUI should not call anything but this.
 
 ***************************************************************************/
public class Farm {
    
    var fields : [Land]
    var cash: Float
    var event: Event
    var year: Int
    var cropCostPicker : Int
    
    var yield: Float
    var expense: Float
    var revenue : Float
    
    var reports: [Report]
    var currentReport : Report
    
    var lastCropPlanted : Crops
    
    /*
     Initalizes farm with the default farms saved in an Array, and 1 million dollars.
     */
    init(){
        fields = [Land(whichField: 0), Land(whichField: 1), Land(whichField: 2), Land(whichField: 3), Land(whichField: 4), Land(whichField: 5), Land(whichField: 6), Land(whichField: 7)]
        cash = 1000000
        event = Event()
        year = 0
        cropCostPicker = 0;
        
        yield = 0.0
        expense = 0.0
        revenue = 0.0
        
        reports = []
        currentReport = Report()
        
        lastCropPlanted = .Empty
    }
    
    
    /*********************
     
     Farm related Functions
     
     *********************/
    
    func startYear () {
        //Make new Report
        currentReport = Report()
        
        //Incriment Year
        year += 1
        
        //Modify Prices
        CropSellPrice.changePrices()
        
        //Add data to report
        currentReport.boyCash = cash
        currentReport.year = year
        
    }
    
    func endYear () {
        //Harvest Crops
        harvestAll()
        
        //Calculate new Cash
        cash -= expense
        cash += revenue
        
        //Add data to report
        currentReport.expense = expense
        currentReport.revenue = revenue
        currentReport.event = event.eventName
        currentReport.eventModifier = event.eventModifier
        currentReport.eoyCash = cash
        
        //Add Fields
        for i in 0 ..< 8 {
            currentReport.fields.append(fields[i].getReport())
        }
        
        //Store Report
        reports.insert(currentReport, atIndex: 0)
        
        //Reset
        reset()
        
        //Save Data
        //Storage.saveFarm(self)
    }
    
    
    func harvestAll() -> Float{
        //Trigger new Event
        event.doEvent()
        
        //Calc Expense
        calcExpense()
        
        //Calc Revenue
        calcRevenue()
        
        return revenue;
    }
    
    func reset(){
        //Reset Variables
        expense = 0.0
        revenue = 0.0
        
        
        //Reset Land
        for field in fields{
            field.resetLand()
        }
        
    }
    
    func plant (whichField : Int, crop : Crops){
        //Check if something is already planted
        if(hasPlanted(whichField)) {
            //Maybe do this
            // replacePlant(whichField, crop: crop)
            
            return
        }
        
        //Plant
        fields[whichField].plant(crop)
        
        //Subtract the money for planting
        expense += fields[whichField].expense
        
        //Tracking for buy view
        lastCropPlanted = crop
    }
    
    func replacePlant (whichField : Int, crop : Crops) {
        //Check for Switch Grass
        if(fields[whichField].getCrop() == Crops.Grass_O) {
            //Cant Replace Switchgrass after first year
            return
        }
        
        //Add back money
        expense -= fields[whichField].expense
        
        //Plant
        fields[whichField].plant(crop)
        
        //Subtract the money for planting
        expense += fields[whichField].expense
    }
    
    func isEmpty() -> Bool{
        for field in fields{
            if (field.getCrop() != Crops.Empty){
                return false
            }
            
        }
        return true
    }
    
    func canBuy() -> Bool{
        if(cash < 12000){
            return false
        }
        return true
    }
    
    func hasPlanted(whichfield : Int) -> Bool{
        if(fields[whichfield].getCrop() != Crops.Empty){
            return true
        }
        
        return false
    }
    
    func costOfPurchase(whichField : Int, whichCrop : Crops) -> Float{
        
        return Float(fields[whichField].getLandSize()) * whichCrop.getCropCost()
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
        return cash - expense
    }
    
    func getCrop(whichfield : Int) -> Crops{
        return fields[whichfield].getCrop()
    }
    
    func getYear() -> Int {
        return year
    }
    
    func getRevenue() -> Float {
        return revenue
    }
    
    /******
     
     Helper
     
     ******/
    
    func calcYield() -> Float{
        var totalYield: Float = 0.0;
        for field in fields{
            totalYield += field.calculateYield(event);
        }
        return totalYield;
    }
    
    func calcExpense() -> Float {
        expense = 0.0 //reset before offical calc
        for field in fields {
            expense += field.calcExpense();
        }
        //expense = round(expense * 100.0) / 100.0 //2 Decimal Precision
        return expense;
    }
    
    func calcRevenue() -> Float{
        revenue = 0.0 //reset before offical calc
        for field in fields {
            revenue += field.calculateRevenue(event);
        }
        //revenue = round(revenue * 100.0) / 100.0 //2 Decimal Precision
        return revenue;
    }
}