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
