//
//  MainViewController.swift
//  BioFarm
//
//  Created by Berns, Alex J on 12/9/14.
//  Last Modified by Alex Berns on Summer 2016
//
//

import UIKit
import AVFoundation

/*
Main Menu View
*/
class MainViewController: UIViewController {
    //variables that handle the music
    
    private var musicPlayer = AVAudioPlayer()
    private var effectsPlayer = AVAudioPlayer()
    
    /*
        Loads when the view is loaded. Initializes the Music player.
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSound()
        musicPlayer.play()
    }
    
    /*
    The following hides teh back button from the view controller.
    It is not needed in the main menu and prevents players from going back 
    to the game over page after they go to the main menu page.
    */
    override func viewWillAppear(animated: Bool) {
        //self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.hidesBackButton = true
    }

    /*
        A defualt function that deals with memomory warnings.
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
        Prepares app to move to the next scene by sending refrences to data that may be used there.
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "toOptionsView"){
            let dest : OptionsViewController = segue.destinationViewController as! OptionsViewController
            dest.musicPlayer = musicPlayer
            dest.effectsPlayer = effectsPlayer
        }
        else if(segue.identifier == "toGameViewID"){
            let dest : GameViewController = segue.destinationViewController as! GameViewController
            dest.effectsPlayer = effectsPlayer
        }
        else if(segue.identifier == "toCreditView"){
            
        }
    }
    
    /*
        Prepares the musicPlayer to play the background song. Sets default volume and inifite loops.
    */
    func prepareSound(){
        let backgroundSong = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Drankin Song", ofType: "mp3")!)
        self.musicPlayer = try! AVAudioPlayer(contentsOfURL: backgroundSong, fileTypeHint: nil)
        musicPlayer.numberOfLoops = -1
        musicPlayer.volume = 0.5
        musicPlayer.prepareToPlay()
        
      let sound = try! NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("applause", ofType: "mp3")!)
        effectsPlayer = try! AVAudioPlayer(contentsOfURL: sound, fileTypeHint: nil)
        effectsPlayer.volume = 0.3
    }
    
}