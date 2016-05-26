//
//  Report.swift
//  BioFarm
//
//  Created by Alex Berns on 5/16/16.
//  Last Modified by Alex Berns on Summer 2016
//
//

import Foundation


public class Report {
    
    /******************************
     Internal Variables
     ******************************/
    //Year
    var year : Int
    
    //Money
    var expense: Float
    var revenue: Float
    var boyCash: Float
    var eoyCash: Float
    
    //Farm
    var fields : [(crop: Crops, expense : Float, revenue : Float)]
    
    //Event
    var event: String
    var eventModifier: Float
    
    init () {
        year = 1
        expense = 0.0
        revenue = 0.0
        eoyCash = 0.0
        boyCash = 0.0
        
        event = ""
        eventModifier = 0.0
        fields = []
    }
    
    
    func profit() -> Float{
        return revenue - expense
    }
    
}

