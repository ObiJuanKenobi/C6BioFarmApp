//
//  BuyViewController.swift
//  BioFarm
//
//  Created by Alex Berns on 1/24/15.
//  Last Modified by Alex Berns on Summer 2016


import Foundation
import UIKit

class BuyViewController: UIViewController {
    //
    
    /******************************
        Passed in Variables
    ******************************/
    var selectedFarm : Int = 1
    var farmInBuyView : Farm?
    
    /******************************
        UI Variables
     ******************************/

    // Segment Controller for crop choice
    @IBOutlet var seg_CropChoice: UISegmentedControl!
    
    // Labels
    @IBOutlet var lbl_Calculation: UILabel!
    @IBOutlet var lbl_Insur: UILabel!
    @IBOutlet var lbl_Price: UILabel!
    @IBOutlet var lbl_CropInfo: UILabel!
    @IBOutlet var lbl_OtherCropInfo: UILabel!

    // Switch
    @IBOutlet var swt_Insur: UISwitch!
    
    // Images
    @IBOutlet var img_Crop: UIImageView!
    
    // Buttons
    @IBOutlet var btn_Buy: OBShapedButton!
  
    /******************************
     Internal Variables
     ******************************/
    var isInsured : Bool = true
    var cropToBuy : Crops = Crops.Empty
    var calculatedCost : Double = 0
    var cropSellingPrice: Float = 0
    
    
    //Some colors that reflect Iowa State these were actually given to me to put in the game
    private var redColor : UIColor = UIColor(red: 206.0/255.0, green: 17.0/255.0, blue: 38.0/255.0, alpha: 1.0)
    private var greenColor: UIColor = UIColor(red: 7.0/255.0, green: 109.0/255.0, blue: 84.0/255.0, alpha: 1.0)
    
    /******************************
        System Methods
     ******************************/
    /*
        A defualt function to set up the view when its first loaded. Sets up an image of the farms current crop
        and sets the label to show the price of that crop for the farm. Then updates the crop to whatever the 
        selector has set.
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
         //Set Crop Image
        img_Crop.image = UIImage(named: farmInBuyView!.fields[selectedFarm].getCropSprite())

        
        //Show Price of land
        lbl_Price.text = String(format: "$%.2f", farmInBuyView!.costOfPurchase(selectedFarm, whichCrop: Crops.Corn))
        
        //Set Starting Selection
        switch farmInBuyView!.fields[selectedFarm].getCrop() {
        case .Corn:
            seg_CropChoice.selectedSegmentIndex = 0
        case .Soy:
            seg_CropChoice.selectedSegmentIndex = 1
        case .Grass:
            seg_CropChoice.selectedSegmentIndex = 2
        default:
            seg_CropChoice.selectedSegmentIndex = 0
        }
        
        cropUpdate(self)
    }
    
    /*
        A defualt function to deal with memory warnings.
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /******************************
        GUI Methods
     ******************************/
    /*
        Updates the image displayed based on the segment selected. then changes calls change Insurance.
    */
    
    @IBAction func cropUpdate(sender: AnyObject) {
        
        switch seg_CropChoice.selectedSegmentIndex {
            case 0: //Corn
            cropToBuy = Crops.Corn
            swt_Insur.hidden = false
            swt_Insur.on = false
            
            case 1: //Soybean
            cropToBuy = Crops.Soy
            swt_Insur.hidden = false
            swt_Insur.on = false

            case 2: //Switchgrass
            cropToBuy = Crops.Grass
            swt_Insur.hidden = true
            //changes insure switch off since switch grass has no insurance
            swt_Insur.setOn(false, animated: false)
            farmInBuyView!.fields[selectedFarm].setInsured(false)
            

            default: break
        }
        
        //sets what C6 will say in his text bubbles
        setSpeechBubble()
        
        //Show Crop Info
        lbl_CropInfo.text = cropToBuy.getCropInfo()
        
        //Set Crop Image
        img_Crop.image = UIImage(named: cropToBuy.getCropSprite())
        cropSellingPrice = cropToBuy.getCropSellingPrice()
        
        //Update Insur Policy
        changeInsurance(self)
    }
    
    func setSpeechBubble() {
        //sets what C6 will say in his text bubbles
        if(farmInBuyView!.getYear() != 1){
            lbl_OtherCropInfo.text = String(format: "This field contained \(farmInBuyView!.fields[selectedFarm].getOldCrop()) last year")
        }
        else{
            lbl_OtherCropInfo.text = "Remember to rotate your crops!"
        }
    }
    
    /*
        Changes the state of the insurance label depending on if the state of the insurance switch.
    */
    @IBAction func changeInsurance(sender: AnyObject) {
        // Change insur on crop
        if(swt_Insur.on) {
            lbl_Insur.text = "You are insured"
            farmInBuyView!.fields[selectedFarm].setInsured(true)
        }
        else{
            lbl_Insur.text = "You are not insured"
            farmInBuyView!.fields[selectedFarm].setInsured(false)
        }
        
        //Calls update on calculation text field
        updateCalculation()
    }
    
    /*
        Buys the selected crop on the selected farm. It also determines if the player can afford to purchase the crop
        and if not it changes the C6's text color to red and changes what he says.
    */
    @IBAction func buy() {
        if(farmInBuyView!.getCash() < farmInBuyView!.costOfPurchase(selectedFarm, whichCrop: cropToBuy)){
            lbl_OtherCropInfo.text = "You do not have enough money to buy that"
            lbl_OtherCropInfo.textColor = redColor
            return
        }
        else{
             farmInBuyView!.plant(selectedFarm, crop: cropToBuy)
            self.performSegueWithIdentifier("exitFromStore", sender: self)
        }
    }
    
    /*
        Updates the calculation label based on the current crop selected and its insurance. 
    */
    func updateCalculation () {
        //Make the number readable with a formatter
        let nf = NSNumberFormatter()
        nf.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        var cropCost : Float
        if(farmInBuyView!.fields[selectedFarm].isInsured()){
            cropCost = cropToBuy.getCropInsuredCost()
        }
        else {
            cropCost = cropToBuy.getCropCost()
        }
            
        lbl_Calculation.text = String(format: "%@\nNumber of acres: %@ \nPrice of crop: %@\n",
                                      cropToBuy.getCropName(),
                                      nf.stringFromNumber(farmInBuyView!.fields[selectedFarm].getLandSize())!,
                                      nf.stringFromNumber(cropCost)!)
                                      //nf.stringFromNumber(cropToBuy.getCropSellingPrice())!,
                                      //nf.stringFromNumber(cropToBuy.getCropYield())!)
        
        let calculatedCost = cropCost * Float (farmInBuyView!.fields[selectedFarm].getLandSize())
        lbl_Price.text = String(format: "$%@", nf.stringFromNumber(calculatedCost)!)
     
    }
}