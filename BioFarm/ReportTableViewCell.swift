//
//  ReportTableViewCell.swift
//  BioFarm
//
//  Created by Jay Staker on 5/18/16.
//
//

import UIKit

class ReportTableViewCell: UITableViewCell {
//    var report : Report?
//    var year : String?
//    var event : String?
//    var expense : String?
//    var revenue : String?
//    var profit : String?
    
    @IBOutlet var lbl_year: UILabel!
    @IBOutlet var lbl_event: UILabel!
    @IBOutlet var lbl_expense: UILabel!
    @IBOutlet var lbl_revenue: UILabel!
    @IBOutlet var lbl_profit: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
