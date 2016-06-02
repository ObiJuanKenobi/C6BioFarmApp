//
//  OptionsViewController.swift
//  BioFarm
//
//  Created by Jackson Voigt on 1/22/15.
//  Last Modified by Alex Berns on Summer 2016
//

import Foundation
import UIKit
import AVFoundation

class OptionsViewController : UIViewController{
    /******************************
     Passed In Variables
     ******************************/
    
    var musicPlayer : AVAudioPlayer?
    var effectsPlayer : AVAudioPlayer?
    
    /******************************
     UI Variables
     ******************************/
    @IBOutlet var sld_Volume: UISlider!
    @IBOutlet var swt_Volume: UISwitch!
    @IBOutlet var swt_Effects: UISwitch!
    @IBOutlet var swt_idleLand: UISwitch!
    
    /******************************
     System Methods
     ******************************/
    /*
        A defualt function to set up the view when its first loaded. Sets the volume switch and slider based on the
        volume of the sound and whether the music is playing. 
    */
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let temp : AVAudioPlayer = musicPlayer{
//            sld_Volume.value = temp.volume
//            swt_Volume.on = temp.playing
//        }
        
        sld_Volume.value = Options.musicVol
        swt_Volume.on = Options.musicOn
        
//        if let temp1 : AVAudioPlayer = effectsPlayer{
//            if(temp1.volume == 0){
//                swt_Effects.on = false
//            }
//        }
        swt_Effects.on = Options.sfxOn
    }

    /******************************
     UI Methods
     ******************************/
    /*
        Changes the volume of the music player based on the state of the slider.
    */
    @IBAction func changeVolume(sender: UISlider) {
//        if let temp : AVAudioPlayer = musicPlayer {
//            temp.volume = sender.value
//            Options.musicVol = sender.value
//        }
        
        musicPlayer!.volume = sender.value
        Options.musicVol = sender.value
        
    }
    
    /*
        Turns the volume on or off depending on the state of the switch.
    */
    @IBAction func volumeOnOff(sender: UISwitch) {
//        if let temp : AVAudioPlayer = musicPlayer  {
//            if !swt_Volume.on {
//                temp.stop()
//                temp.currentTime = 0
//            }
//            else{
//                temp.play()
//            }
//        }
        Options.musicOn = swt_Volume.on
        if(swt_Volume.on) {
            musicPlayer!.volume = Options.musicVol
            musicPlayer!.play()
        }
        else {
            musicPlayer!.volume = 0.0
            musicPlayer!.stop()
            
        }
        
    }
    
    /*
        Turns the volume on or off depending on the state of the switch.
    */
    @IBAction func effectsOnOff(sender: UISwitch) {
        if(sender.on){
            effectsPlayer!.volume = Options.sfxVol
        }
        else{
            effectsPlayer!.volume = 0.0
        }
    }
    
    @IBAction func idleOnOff(sender: AnyObject) {
        Options.idleCostOn = sender.on
    }
    
}