//
//  ViewController.swift
//  FastTouch
//
//  Created by Moises Gil on 4/29/17.
//  Copyright © 2017 Moises Gil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var touchButton: UIButton!
    @IBOutlet weak var maxPointLabel: UILabel!
    
    
    var timer:Timer?
    var seconds = 0
    var touches = 0
    var maxPoint = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultValues()
    }


    @IBAction func countTouches(_ sender: UIButton) {
        
        if(touches == 0){
            startGame()
            touchButton.setTitle("Touch!", for: UIControlState.normal)
        }
        
        touches += 1
        counterLabel.text = String(touches)
        
    }
    
    func count(){
        seconds -= 1
        
        timerLabel.text = String(seconds)
        
        if(seconds == 0){

           self.timer!.invalidate()
           self.timer = nil
            
            let alert = UIAlertController(title: "Time Over!", message: "You pushed \(touches) time(s)!", preferredStyle: UIAlertControllerStyle.alert)
            
            
            alert.addAction(UIAlertAction(title: "Play again", style: UIAlertActionStyle.default, handler:{
                
                _ in
                
                if(self.touches > self.maxPoint){
                    self.maxPoint = self.touches
                    self.maxPointLabel.text = String(self.maxPoint)
                }
                
                self.setDefaultValues()
                
            }))
            
            
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    func setDefaultValues(){
        
        seconds = 60
        touches = 0
        
        counterLabel.text = String(touches)
        timerLabel.text = String(seconds)
        
        touchButton.setTitle("Ready?", for: UIControlState.normal)
        
    }
    
    func startGame() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.count), userInfo: nil, repeats: true)
    }


}

