//
//  ResultsTableViewController.swift
//  BioFarm
//
//  Created by Juan Venegas on 2/19/15.
//  Last Modified by Alex Berns on Summer 2016
//

import Foundation

class ResultsTableViewController: UITableViewController{
    /******************************
        Passed In Variables
     ******************************/
    var reports : [Report]?
//    var year: Int = 0
//    var profit: Float = 0.0
//    var mod: Float = 0.0
//    var modText: String = "Error"
//    var totalMoney: Float = 0.0
    
    /******************************
        Interal Variables
     ******************************/
    var redColor : UIColor = UIColor(red: 206/255, green: 17/255, blue: 38/255, alpha: 1.0)
    var greenColor: UIColor = UIColor(red: 7/255, green: 109/255, blue: 84/255, alpha: 1.0)
    
    /******************************
        System Methods
     ******************************/
    
    /******************************
     Internal Methods
     ******************************/
    /*
        Reutrns the number of cells in the table view.
        Cell size was decreased because players were confused by the empty farms when the table popped up
    */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return reports!.count;
    }
    
    /******************************
     UI Methods
     ******************************/
    /*
     creates a cell to be used for the table view.
     The color of the text changes depending whether there is a good event or bad event (green or red)
     
     */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("ReportCell", forIndexPath: indexPath) as! ReportTableViewCell
        
        let i = indexPath.row
        let report = reports![i]
        
        //Make the number readable with a formatter
        let nf = NSNumberFormatter()
        nf.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        
        //Set label for current year
        if(i == 0) {
            cell.lbl_year.text = String(report.year) + " current"
        } else {
            cell.lbl_year.text = String(report.year)
        }
        
        //Print values for report data
        cell.lbl_event.text = report.event + " (" + String(report.eventModifier) + ")"
        cell.lbl_expense.text = nf.stringFromNumber(report.expense)!
        cell.lbl_revenue.text = nf.stringFromNumber(report.revenue)!
        cell.lbl_profit.text = nf.stringFromNumber(report.profit())!
        
        //Change color of money for positive or negative values
        if(report.profit() <= 0) {
            cell.lbl_profit.textColor = redColor
        }
        else {
            cell.lbl_profit.textColor = greenColor
        }
        
        //Modulate the backgorund for seperation of years
        if(i % 2 == 0) {
            cell.contentView.backgroundColor = UIColor.lightGrayColor()
        }
        else {
            cell.contentView.backgroundColor = UIColor.grayColor()
        }
        
        
        cell.accessoryType = UITableViewCellAccessoryType.None
        
        return cell
    }
}
