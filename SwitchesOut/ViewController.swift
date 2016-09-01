//
//  ViewController.swift
//  SwitchesOut
//
//  Created by jgoble52 on 9/1/16.
//  Copyright © 2016 tangital. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lightSwitches: [LightSwitch]!
    @IBOutlet weak var winnerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetGame()
    }
    
    func resetGame() {
        
        winnerLabel.hidden = true
        
        for lightSwitch in lightSwitches {
            
            let onOrOff: Bool = arc4random_uniform(2) == 1
            
            lightSwitch.setOn(onOrOff, animated: true)
        }
    }
    
    @IBAction func lightSwitched(sender: LightSwitch) {
        
        var winningGame: Bool = true
        
        for lightSwitch in lightSwitches {
            
            if sender.column == lightSwitch.column {
                if sender.row - 1 == lightSwitch.row || sender.row + 1 == lightSwitch.row {
                    lightSwitch.setOn(!lightSwitch.on, animated: true)
                }
            }
            
            if sender.row == lightSwitch.row {
                if sender.column - 1 == lightSwitch.column || sender.column + 1 == lightSwitch.column {
                    lightSwitch.setOn(!lightSwitch.on, animated: true)
                }
            }
            
            if lightSwitch.on {
                winningGame = false
            }
        }
        
        if winningGame {
            winnerLabel.hidden = false
        }
    }
    
    @IBAction func onResetTapped(sender: UIButton) {
        
        resetGame()
    }
}
