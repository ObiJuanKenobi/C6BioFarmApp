//
//  TheBarnViewController.swift
//  BioFarm
//
//  Created by Juan Venegas on 7/14/15.
//  Last Modified by Alex Berns on Summer 2016
//

import UIKit

class BarnViewController: UIViewController {

    /******************************
        Internal Variables
     ******************************/
    var whichInfoToPresent : Int = 0
    
    /******************************
        System Methods
     ******************************/
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /******************************
     Button Methods
     ******************************/
    @IBAction func btn_Carbon(sender: AnyObject) {
        whichInfoToPresent = 4
        self.performSegueWithIdentifier("toCropInfo", sender: self)
    }
    
    @IBAction func btn_Soybeans(sender: AnyObject) {
        whichInfoToPresent = 2
        self.performSegueWithIdentifier("toCropInfo", sender: self)
        
    }
    
    @IBAction func btn_Switchgrass(sender: AnyObject) {
        whichInfoToPresent = 3
        self.performSegueWithIdentifier("toCropInfo", sender: self)
        
    }
    
    @IBAction func btn_Corn(sender: AnyObject) {
        whichInfoToPresent = 1
        self.performSegueWithIdentifier("toCropInfo", sender: self)
    }

    @IBAction func btn_StemCareers(sender: AnyObject) {
        whichInfoToPresent = 5
        self.performSegueWithIdentifier("toCropInfo", sender: self)
        
        
    }
    @IBAction func btn_HowToPlay(sender: AnyObject) {
        self.performSegueWithIdentifier("toBarnInfo", sender: self)
        
    }
    
    /******************************
        Segue Methods
     ******************************/
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "toCropInfo"){
            let dest: CropViewController = segue.destinationViewController as! CropViewController
            
            dest.whichInfo = whichInfoToPresent
            
        }
        
    }
   

}
