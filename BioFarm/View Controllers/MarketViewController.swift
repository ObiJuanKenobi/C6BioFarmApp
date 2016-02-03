//
//  MarketViewController.swift
//  BioFarm
//
//  Created by Jay Staker on 12/1/15.
//
//

import UIKit

class MarketViewController: UIViewController {
    
    @IBOutlet var mass_Stepper: UIStepper!
    @IBOutlet var environment_Lbl: UILabel!
    @IBOutlet var amount_Lbl: UILabel!
    @IBOutlet var sell_Btn: UIButton!
    @IBOutlet var money_Lbl: UILabel!

    var money: Double = 0.0;
    var mass: Int = 10;
    
    //this will set up the environment only once
    override func viewDidLoad() {
        super.viewDidLoad()
        environment_Lbl.text = "\(mass) Tons of BioMass";
        money_Lbl.text = "$ \(money)";
        
        mass_Stepper.wraps = true;
        mass_Stepper.maximumValue = Double(mass);
        mass_Stepper.autorepeat = true;
    }
    
    //this will set up the environment anytime it loads
    override func viewDidAppear(animated: Bool) {
        environment_Lbl.text = "\(mass) Tons of BioMass";
        money_Lbl.text = "$ \(money)";
        
        mass_Stepper.wraps = true;
        mass_Stepper.maximumValue = Double(mass);
        mass_Stepper.autorepeat = true;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func amountValueChanged(sender: UIStepper) {
         amount_Lbl.text = " \(Int(sender.value))";
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
