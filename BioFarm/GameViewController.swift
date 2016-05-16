//
//  GameViewController.swift
//  BioFarm
//
//  Created by Alex Berns on 1/23/15.
//  Last Modified by Alex Berns on 4/16/16
//
//  TODO: put a select all button for quick selection

import Foundation
import UIKit
import AVFoundation

class GameViewController : UIViewController{
    //Passed In Variables
    var effectsPlayer : AVAudioPlayer? = AVAudioPlayer()
    
    //Labels
    @IBOutlet var lbl_money : UILabel!
    @IBOutlet var lbl_harvestMod: UILabel!
    @IBOutlet var lbl_modiferText: UILabel!
    @IBOutlet var lbl_Farm1: UILabel!
    @IBOutlet var lbl_Farm2: UILabel!
    @IBOutlet var lbl_Farm3: UILabel!
    @IBOutlet var lbl_Farm4: UILabel!
    @IBOutlet var lbl_Farm5: UILabel!
    @IBOutlet var lbl_Farm6: UILabel!
    @IBOutlet var lbl_Farm7: UILabel!
    @IBOutlet var lbl_Farm8: UILabel!
    
    //Buttons
    @IBOutlet var btn_Farm1: OBShapedButton!
    @IBOutlet var btn_Farm2: OBShapedButton!
    @IBOutlet var btn_Farm3: OBShapedButton!
    @IBOutlet var btn_Farm4: OBShapedButton!
    @IBOutlet var btn_Farm5: OBShapedButton!
    @IBOutlet var btn_Farm6: OBShapedButton!
    @IBOutlet var btn_Farm7: OBShapedButton!
    @IBOutlet var btn_Farm8: OBShapedButton!
    @IBOutlet var btn_harvest: UIButton!
    
    //Iowa State red and Greeen colors
    private var redColor : UIColor = UIColor(red: 206.0/255.0, green: 17.0/255.0, blue: 38.0/255.0, alpha: 1.0)
    private var greenColor: UIColor = UIColor(red: 7.0/255.0, green: 109.0/255.0, blue: 84.0/255.0, alpha: 1.0)
    
    //Other Instance Variables
    private var selectedFarm : Int = 1
    private var farm : Farm = Farm()
    
    private var modifier: Float = 0.0
    private var eventText: String = ""
    private var profit : Float = 0.0
    private var totalMoney: Float = 0.0
    
    
    //System Methods
    
    /*
     A defualt function to set up the view when it is first loaded. It sets up the buttons with defualt imagesa
     and aspect ratios.
     */
    override func viewDidLoad(){
        //what runs when this view is first loaded
        super.viewDidLoad()
        
        //setting default outputs
        self.refresh()
        setButtonAspect()
        //lbl_harvestMod.text = "Year: \(farm.getYear())"
        lbl_harvestMod.text = "Test"
    }
    
    /*
     This method checks if it is game over for the player by checking if the player can still buy land, but only
     if the field is empty.
     */
    override func viewDidAppear(animated: Bool) {
        if(farm.cannotBuy() && farm.isEmpty()){
            //self.performSegueWithIdentifier("toGameOverView", sender: self)
        }
    }
    
    
    /*
     A defualt function that deals with memory warnings.
     */
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
        //super.didReceiveMemoryWarning()/Users/jstaker/Documents/Jackson-/BioFarm_NEW/BioFarm/BioFarm/GameViewController.swift
    }
    
    /*
     Sets the aspect ratio for all the picturs in the farm buttons.
     */
    func setButtonAspect() {
        btn_Farm1.imageView?.contentMode = .ScaleAspectFit
        btn_Farm2.imageView?.contentMode = .ScaleAspectFit
        btn_Farm3.imageView?.contentMode = .ScaleAspectFit
        btn_Farm4.imageView?.contentMode = .ScaleAspectFit
        btn_Farm5.imageView?.contentMode = .ScaleAspectFit
        btn_Farm6.imageView?.contentMode = .ScaleAspectFit
        btn_Farm7.imageView?.contentMode = .ScaleAspectFit
        btn_Farm8.imageView?.contentMode = .ScaleAspectFit
    }
    
    /*
     Refreshes the information on all labels on the game screen. These labels are temporary and used for debugging.
     "People like the labels so keep them on or modify them." - Juan
     */
    func refresh(){
        //Updates the amount of money shown
        lbl_money.text = String(format: "$%.2f", farm.getCash())
/*
        //Update labels for each farm
        lbl_Farm1.text = String(format: "%.0f acres of %@", farm.fields[0].getLandSize(), farm.fields[0].getCropName())
        lbl_Farm2.text = String(format: "%.0f acres of %@", farm.fields[1].getLandSize(), farm.fields[1].getCropName())
        lbl_Farm3.text = String(format: "%.0f acres of %@", farm.fields[2].getLandSize(), farm.fields[2].getCropName())
        lbl_Farm4.text = String(format: "%.0f acres of %@", farm.fields[3].getLandSize(), farm.fields[3].getCropName())
        lbl_Farm5.text = String(format: "%.0f acres of %@", farm.fields[4].getLandSize(), farm.fields[4].getCropName())
        lbl_Farm6.text = String(format: "%.0f acres of %@", farm.fields[5].getLandSize(), farm.fields[5].getCropName())
        lbl_Farm7.text = String(format: "%.0f acres of %@", farm.fields[6].getLandSize(), farm.fields[6].getCropName())
        lbl_Farm8.text = String(format: "%.0f acres of %@", farm.fields[7].getLandSize(), farm.fields[7].getCropName())
*/
    }
    
    
    /*
     Refreshs all button images after a new crop has been planted.
     */
    func refreshImages(){
        let tempImage : UIImage = UIImage(named: farm.fields[selectedFarm].getLandSprite(selectedFarm))!
        switch selectedFarm{
        case 0:btn_Farm1.setBackgroundImage(tempImage, forState: btn_Farm1.state)
        case 1:btn_Farm2.setBackgroundImage(tempImage, forState: btn_Farm2.state)
        case 2:btn_Farm3.setBackgroundImage(tempImage, forState: btn_Farm3.state)
        case 3:btn_Farm4.setBackgroundImage(tempImage, forState: btn_Farm4.state)
        case 4:btn_Farm5.setBackgroundImage(tempImage, forState: btn_Farm5.state)
        case 5:btn_Farm6.setBackgroundImage(tempImage, forState: btn_Farm6.state)
        case 6:btn_Farm7.setBackgroundImage(tempImage, forState: btn_Farm7.state)
        case 7:btn_Farm8.setBackgroundImage(tempImage, forState: btn_Farm8.state)
        default: return//btn_Farm1.setImage(tempImage, forState: btn_Farm1.state)
        }
    }
    
    /*
     The following is a reset method used for clearing certain information after a year.
     It clears certain information from the farm class, and resets the background images for the buttons
     */
    
    func reset() {
        farm.reset()
        for(var i = 0; i < 8; i += 1){
            let tempImage : UIImage = UIImage(named: farm.fields[i].getLandSprite(i))!
            switch i{
            case 0:btn_Farm1.setBackgroundImage(tempImage, forState: btn_Farm1.state)
            case 1:btn_Farm2.setBackgroundImage(tempImage, forState: btn_Farm2.state)
            case 2:btn_Farm3.setBackgroundImage(tempImage, forState: btn_Farm3.state)
            case 3:btn_Farm4.setBackgroundImage(tempImage, forState: btn_Farm4.state)
            case 4:btn_Farm5.setBackgroundImage(tempImage, forState: btn_Farm5.state)
            case 5:btn_Farm6.setBackgroundImage(tempImage, forState: btn_Farm6.state)
            case 6:btn_Farm7.setBackgroundImage(tempImage, forState: btn_Farm7.state)
            case 7:btn_Farm8.setBackgroundImage(tempImage, forState: btn_Farm8.state)
            default: return//btn_Farm1.setImage(tempImage, forState: btn_Farm1.state)
            }
        }
        
    }
    
    /*
     Used when the harvest button is pressed. It gets the event for that year and cacluates the profit.
     It also plays a sound effect based on that event and resets all farms.
     */
    @IBAction func button_HarvestYear(sender: AnyObject) {
        //Checks if there is something in the farm first
        if(farm.isEmpty()){
            return
        }
        else{ //performs the procedures for harvesting a year
            //creates an event, mod number and then calculates the yield of each field based on the mod number
            //it then calculates the revenue made and finally adds the revenue to the current money of the farm
            
            //Harvest All handles calculation of revenue
            
            farm.harvestAll();
            
            //Check Money for Game Over
            if(farm.getCash() < 12000){
                self.performSegueWithIdentifier("toGameOverView", sender: self)
            }
            else{ //Game Over
                var eventSound : String = ""
                
                eventSound = farm.getEventSound()
                //Play sound
                prepareEventSound(eventSound)
                effectsPlayer!.play()
                
                //Temp Variable for profit and tempFarm for results view TODO
                profit = farm.getRevenue()
                modifier = farm.getModNumber()
                eventText = farm.getEventText()
                totalMoney = farm.getCash()
                
                //Print Year Results
                lbl_harvestMod.text = String(format: "Year: %d \nModifier: %.2f\nProfit: $%.2f", farm.getYear(), farm.getModNumber(), profit)
                
                //print flavor Text
                if(modifier == 1.0){
                    lbl_modiferText.textColor = greenColor
                    lbl_modiferText.text = farm.getEventText()
                }
                else{
                    lbl_modiferText.textColor = redColor
                    lbl_modiferText.text = farm.getEventText()
                }
                
                
                //Refresh Screen (for crops)
                reset()
                refresh()
                
                //toResultsView
                self.performSegueWithIdentifier("toResultsView", sender: self)
                
            }
            
        }
    }
    
    /*
     Prepares the the sound effect from the yearly event to be played.
     */
    func prepareEventSound(eventSound : String) {
        let sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(eventSound, ofType: "mp3")!)
        let tempVol = effectsPlayer!.volume
        effectsPlayer = try!AVAudioPlayer(contentsOfURL: sound, fileTypeHint: nil)
        effectsPlayer!.prepareToPlay()
        effectsPlayer!.volume = tempVol
    }
    
    /*
     When a farm button is pressed this button finds which button it was so that the correct farm is modified.
     It then sends the app to the buy screen.
     */
    @IBAction func button_GoToBuyScreen(sender: AnyObject) {
        //Decided what farm to send to buyView
        //the button also locks after a purchase is made
        
        switch sender {
        case btn_Farm1 as UIButton:
            if(farm.hasPlanted(0)){
                return
            }else{
                selectedFarm = 0
            }
        case btn_Farm2 as UIButton:
            if(farm.hasPlanted(1)){
                return
            }
            else{ selectedFarm = 1
            }
        case btn_Farm3 as UIButton:
            if(farm.hasPlanted(2)){
                return
            }else{
                selectedFarm = 2
            }
        case btn_Farm4 as UIButton:
            if(farm.hasPlanted(3)){
                return
            }else{
                selectedFarm = 3
            }
        case btn_Farm5 as UIButton:
            if(farm.hasPlanted(4)){
                return
            }else{
                selectedFarm = 4
            }
        case btn_Farm6 as UIButton:
            if(farm.hasPlanted(5)){
                return
            }else{
                selectedFarm = 5
            }
        case btn_Farm7 as UIButton:
            if(farm.hasPlanted(6)){
                return
            }else{
                selectedFarm = 6
            }
        case btn_Farm8 as UIButton:
            if(farm.hasPlanted(7)){
                return
            }else{
                selectedFarm = 7
            }
        default: selectedFarm = 0
        }
        //Do the segue to buy view
        self.performSegueWithIdentifier("toBuyView", sender: self)
    }
    
    /*
     Prepare Segue and pass required info to new view
     */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        segue.destinationViewController
        
        if(segue.identifier == "toBuyView"){
            let dest : BuyViewController = segue.destinationViewController as! BuyViewController
            
            dest.selectedFarm = self.selectedFarm
            dest.farmInBuyView = farm
        }
        else if(segue.identifier == "toResultsView"){
            let dest : ResultsTableViewController = segue.destinationViewController as! ResultsTableViewController
            
            dest.year = farm.getYear()
            dest.mod = farm.getModNumber()
            dest.modText = farm.getEventText()
            dest.profit = self.profit
            dest.totalMoney = farm.getCash()
            
        }
        else if(segue.identifier == "toGameOverView"){
            let dest: GameOverViewController = segue.destinationViewController as! GameOverViewController
            
            dest.yearsPassed = farm.getYear()
            dest.currentMoney = farm.getCash()
        }
        else if(segue.identifier == "toGoalView"){
            //let dest : TODO = segue.destinationViewController as! TODO
            
            //dest
        }
        else if(segue.identifier == "toBarnView"){
            //let dest : TODO = segue.destinationViewController as! TODO
            
            //dest
        }
    }
    
    /*
     Refreshes the images and labels after returning from the buy screen.
     */
    @IBAction func unwindFromBuy(unwindSegue: UIStoryboardSegue){
        refresh()
        refreshImages()
    }
    
}