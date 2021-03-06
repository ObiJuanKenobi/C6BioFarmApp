//
//  GameOverViewController.swift
//  BioFarm
//
//  Created by Juan Venegas on 7/13/15.
//  Last Modified by Alex Berns on Summer 2016
//

import UIKit

class GameOverViewController: UIViewController {

    /******************************
        Passed In Variables
     ******************************/
    var yearsPassed: Int = 0
    var currentMoney: Float = 0.0
    
    /******************************
        UI Variables
     ******************************/
    @IBOutlet var lbl_gameInfo: UILabel!
    
    /******************************
     System Methods
     ******************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        let nf = NSNumberFormatter()
        nf.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        let temp = nf.stringFromNumber(currentMoney)
        lbl_gameInfo.text = String(format:"Your farm lasted \(yearsPassed) years and it has \n%@", temp!)
    }
    
    override func viewWillAppear(animated: Bool) {
        //self.navigationController!.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.hidesBackButton = true
    }
    
    /******************************
     Button Methods
     ******************************/
    @IBAction func button_GoToMainMenu(sender: AnyObject) {
        
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
