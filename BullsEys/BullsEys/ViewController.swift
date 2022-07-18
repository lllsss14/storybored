//
//  ViewController.swift
//  BullsEys
//
//  Created by lishan on 2022/7/17.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 50
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }

    @IBAction func showAlert() {
//        var difference: Int
//
//        if currentValue > targetValue {
//            difference = currentValue - targetValue
//        } else if targetValue > currentValue {
//            difference = targetValue - currentValue
//        } else  {
//            difference = 0
//        }
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good!"
            if difference == 1 {
                points += 50
            }
        } else {
            title = "Not even close..."
        }
        score += points
        
//        let message = "The value of the slider is: \(currentValue)" + "\nThe target value is：\(targetValue)" + "\n The difference is: \(difference)"
        let message = "You scored \(points) points"
        
        let alert = UIAlertController (
            title:  title,
            message: message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { _ in
                self.startNewRound()
            }
        )
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        print(" The value of the slider is now:\(currentValue)")
    }
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
        currentValue = 50
        targetValue = 0
        startNewRound()
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    
    func updateLabels() {
        targetLabel.text = String(targetValue)   //将生成的随机数显示在那段话之后
        scoreLabel.text = String(score)        //更新Score
        roundLabel.text = String(round)        //更新Round
    }
}

