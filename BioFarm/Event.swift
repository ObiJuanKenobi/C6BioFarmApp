//
//  Event.swift
//  BioFarm
//
//  Created by Voigt, Camden J on 12/11/14.
//
//chooses random event and does animation

import Foundation

/***************************************************************************
 How to use: Create a new Event each year and get variables created by the event
 What it does: contains the info for event text, sound file name and modifiers
 
 currently very coupled, need to seperate certain methods into seperate calls.
 Also would be good to redo some naming here and use enums for various things.
 ***************************************************************************/


//Stay as class redo function call so no tuple


class Event{
    
    var rand: Int = 0
    var eventModifier : Float =  0.0
    var eventID : Int = 0
    var eventText : String = ""
    var eventName : String = ""
    var eventSound : String = "applause"
    
    /*
     Returns the Modifer of the Event that has been chosen
     */
    
    init(){
        
    }
    
    func getModifier() -> Float {
        return eventModifier;
    }
    
    /*
     Returns the Text of the Event that has been chosen
     */
    func getText() -> String {
        return eventText;
    }
    
    func getName() -> String {
        return eventName;
    }
    
    /*
     Returns the Text of the Event that has been chosen
     */
    func getSound() -> String {
        return eventSound;
    }
    
    /*
     Returns the ID for the event that just occured
     */
    func getID() -> Int{
        return eventID
    }
    
    /*
     Returns a tuple with a randomly choosen event for the year with a modifier, text and sound.
     */
    func doEvent() -> (eventModifier: Float, eventText: String, eventSound: String) {
        rand = Int(arc4random_uniform(1000)) + 1
        //rand = 1 //DEBUG Quick Override for debuging
        eventID = 0
        switch rand{
        case 0...600:
            eventModifier = 1.0
            eventName = "Good Year"
            eventText = "You had a good year!"
            eventSound = "applause"
        case 601...760:
            eventModifier = 0.6
            eventName = "Drought"
            eventText = "There was a drought this year -40% yeild."
            eventSound = "Wind"
        case 761...868:
            eventModifier = 0.7
            eventName = "Moisture"
            eventText = "There was a lot of excess moisture this year. -30% yeild."
            eventSound = "Water"
        case 869...896:
            eventModifier = 0.0
            eventName = "Flood"
            eventText = "There was a flood this year -100% yeild."
            eventSound = "Water"
            eventID = 1;
        case 897...944:
            eventModifier = 0.6
            eventName = "Wind"
            eventText = "There was high wind this year -40% yeild."
            eventSound = "Wind"
        case 945...952:
            eventModifier = 0.6
            eventName = "Pests"
            eventText = "There was insects and pest damage to your fields. -40% yeild."
            eventSound = "Bug"
        case 953...960:
            eventModifier = 0.6
            eventName = "Disease"
            eventText = "There was a plant disease outbreak this year. -40% yeild."
            eventSound = "Wind"
        case 961...972:
            eventModifier = 0.7
            eventName = "Wind"
            eventText = "There was wind damage to your crops. -30% yeild."
            eventSound = "Wind"
        case 973...975:
            eventModifier = 0.7
            eventName = "Wind"
            eventText = "There was wind damage to your crops. -30% yeild."
            eventSound = "Wind"
        case 976...980:
            eventModifier = 0.8
            eventName = "Car"
            eventText = "Someone tore through your fields Dukes of Hazard style. -20% yeild."
            eventSound = "Car"
        case 981...985:
            eventModifier = 0.9
            eventName = "Aliens"
            eventText = "Aliens left crop circles in your fields. -10% yeild."
            eventSound = "UFO"
        case 986...990:
            eventModifier = 0.4
            eventName = "Snow"
            eventText = "There was a freak snowstorm this year. -60% yeild."
            eventSound = "Wind"
        case 991...995:
            eventModifier = 0.0
            eventName = "Fire"
            eventText = "Lightning started a fire in your fields. -100% yeild."
            eventSound = "Fire"
        case 996...1000:
            eventModifier = 0.0
            eventName = "Fire"
            eventText = "Your combine lit on fire. -100% yeild."
            eventSound = "Fire"
        default:
            eventModifier = 1.0
            eventName = "Good Year"
            eventText = "You had a good year!"
            eventSound = "applause"
        }
        
        return (eventModifier, eventText, eventSound)
    }
}