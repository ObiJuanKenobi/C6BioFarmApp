//
//  ReportTableViewCell.swift
//  BioFarm
//
//  Created by Alex Berns on 5/18/16.
//  Last Modified by Alex Berns on Summer 2016
//

import UIKit

class ReportTableViewCell: UITableViewCell {
    
    @IBOutlet var lbl_year: UILabel!
    @IBOutlet var lbl_event: UILabel!
    
    @IBOutlet var lbl_f1_crop: UILabel!
    @IBOutlet var lbl_f2_crop: UILabel!
    @IBOutlet var lbl_f3_crop: UILabel!
    @IBOutlet var lbl_f4_crop: UILabel!
    @IBOutlet var lbl_f5_crop: UILabel!
    @IBOutlet var lbl_f6_crop: UILabel!
    @IBOutlet var lbl_f7_crop: UILabel!
    @IBOutlet var lbl_f8_crop: UILabel!
    
    @IBOutlet var lbl_f1_expense: UILabel!
    @IBOutlet var lbl_f2_expense: UILabel!
    @IBOutlet var lbl_f3_expense: UILabel!
    @IBOutlet var lbl_f4_expense: UILabel!
    @IBOutlet var lbl_f5_expense: UILabel!
    @IBOutlet var lbl_f6_expense: UILabel!
    @IBOutlet var lbl_f7_expense: UILabel!
    @IBOutlet var lbl_f8_expense: UILabel!
    
    @IBOutlet var lbl_f1_revenue: UILabel!
    @IBOutlet var lbl_f2_revenue: UILabel!
    @IBOutlet var lbl_f3_revenue: UILabel!
    @IBOutlet var lbl_f4_revenue: UILabel!
    @IBOutlet var lbl_f5_revenue: UILabel!
    @IBOutlet var lbl_f6_revenue: UILabel!
    @IBOutlet var lbl_f7_revenue: UILabel!
    @IBOutlet var lbl_f8_revenue: UILabel!
    
    @IBOutlet var lbl_profit: UILabel!
    
    /******************************
     Interal Variables
     ******************************/
    var redColor : UIColor = UIColor(red: 206/255, green: 17/255, blue: 38/255, alpha: 1.0)
    var greenColor: UIColor = UIColor(red: 7/255, green: 109/255, blue: 84/255, alpha: 1.0)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
