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
        let r = reports![i]
        
        // Configure the view for the selected state
        var listCrop : [UILabel] = []
        listCrop.append(cell.lbl_f1_crop)
        listCrop.append(cell.lbl_f2_crop)
        listCrop.append(cell.lbl_f3_crop)
        listCrop.append(cell.lbl_f4_crop)
        listCrop.append(cell.lbl_f5_crop)
        listCrop.append(cell.lbl_f6_crop)
        listCrop.append(cell.lbl_f7_crop)
        listCrop.append(cell.lbl_f8_crop)
        
        var listExpense : [UILabel] = []
        listExpense.append(cell.lbl_f1_expense)
        listExpense.append(cell.lbl_f2_expense)
        listExpense.append(cell.lbl_f3_expense)
        listExpense.append(cell.lbl_f4_expense)
        listExpense.append(cell.lbl_f5_expense)
        listExpense.append(cell.lbl_f6_expense)
        listExpense.append(cell.lbl_f7_expense)
        listExpense.append(cell.lbl_f8_expense)
        
        var listRevenue : [UILabel] = []
        listRevenue.append(cell.lbl_f1_revenue)
        listRevenue.append(cell.lbl_f2_revenue)
        listRevenue.append(cell.lbl_f3_revenue)
        listRevenue.append(cell.lbl_f4_revenue)
        listRevenue.append(cell.lbl_f5_revenue)
        listRevenue.append(cell.lbl_f6_revenue)
        listRevenue.append(cell.lbl_f7_revenue)
        listRevenue.append(cell.lbl_f8_revenue)
        
        
        cell.lbl_year.text = String(r.year)
        
        //Make the number readable with a formatter
        let nf = NSNumberFormatter()
        nf.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        
        //Set label for current year
        cell.lbl_year.text = String(r.year)
        
        //Set Crop Labels
        for i in 0...7 {
            listCrop[i].text = r.fields[i].crop.getCropShortName()
        }
        
        //Set Expense Labels
        for i in 0...7 {
            listExpense[i].text = nf.stringFromNumber(r.fields[i].expense)
        }
        
        //Set Revenue Labels
        for i in 0...7 {
            listRevenue[i].text = nf.stringFromNumber(r.fields[i].revenue)
        }
        
        
        //Print values for report data
        cell.lbl_event.text = r.event + " (" + String(r.eventModifier) + ")"
        cell.lbl_profit.text = nf.stringFromNumber(r.profit())!
        
        //Change color of money for positive or negative values
        if(r.profit() <= 0) {
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
