//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var audioPlayer : AVAudioPlayer!
    var selectedSoundFileName : String = ""
    let soundArray = ["notee1", "notee2", "notee3", "notee4", "notee5", "notee6", "notee7", "notee8", "notee9", "notee10", "notee11", "notee12", "notee13", "notee14", "notee15", "notee16", "notee17", "notee18", "notee19", "notee20", "notee21", "notee22", "notee23", "notee24", "notee25", "notee26", "notee27", "notee28"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func notePressed(_ sender: UIButton) {
        selectedSoundFileName = soundArray[sender.tag - 1]
        buttonAnimtion(theButtonTag: sender.tag)
        print(selectedSoundFileName)
        playSound()
    }
    
    func buttonAnimtion(theButtonTag: Int) {
        UIView.animate(withDuration: 0.15, animations: {
                   self.view.viewWithTag(theButtonTag)?.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
               }, completion: { _ in
                if theButtonTag < 21 {
                   self.view.viewWithTag(theButtonTag)?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                } else {
                    self.view.viewWithTag(theButtonTag)?.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                }
               })
    }
    func playSound() {
        let soundUrl = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav")
        do {
            audioPlayer = try! AVAudioPlayer(contentsOf: soundUrl!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
    }
  

}

