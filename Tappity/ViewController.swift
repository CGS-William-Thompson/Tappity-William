//
//  ViewController.swift
//  Tappity
//
//  Created by William Thompson on 30/5/17.
//  Copyright © 2017 William Thompson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var scoreNum: Int = 0
    
    var timeNum: Int = 30
    
    var gameRunning = false
    let array = [UIColor.red, UIColor(red: 8/255, green: 255/255, blue: 0/255, alpha: 1.0), UIColor.yellow, UIColor.orange, UIColor.green, UIColor(red: 0.00, green: 61/255, blue: 161/255, alpha: 1.00), UIColor.gray, UIColor.purple, UIColor.magenta, UIColor.blue]
    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var time: UILabel!
    
    
    @IBAction func tapMe(_ sender: Any) {
        
        scoreNum += 1
        let scoreString = String(scoreNum)
        
        score.text = scoreString
        
        let rand = Int(arc4random_uniform(10))
        
        view.backgroundColor = array[rand]
        
        if gameRunning == false {
            gameRunning = true
            timer()
            
        }
        
        
    }
    
    func timer() {
        
        timeNum -= 1
        
        time.text = String(timeNum)
        
        
        
        if (timeNum != 0) {
            
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
                
                self.timer()
                
            }
            
        } else {
            
            gameRunning = false
        
        
            let gameOver = UIAlertController(title: "Game Over", message: "Your score was \(scoreNum)", preferredStyle: UIAlertControllerStyle.actionSheet)
            
            gameOver.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            
            present(gameOver, animated: true)
            
        }
    }
}
