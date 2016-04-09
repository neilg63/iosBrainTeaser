//
//  GameVC.swift
//  BrainTeaser
//
//  Created by Neil Gardner on 07/04/2016.
//  Copyright © 2016 Neil Gardner. All rights reserved.
//

import UIKit
import pop

class GameVC: UIViewController {
    
    
    @IBOutlet weak var yesButton: CustomButton!
    
    @IBOutlet weak var noButton: CustomButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var currentCard: Card!
    
    var previousCard: Card!
    
    var timer: NSTimer!
    
    let GAME_SECONDS:Int64 = 60
    
    var seconds:Int64 = 0
    
    var correctMatches = 0
    
    var wrongMatches = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentCard = createCardFromNib()
        
        currentCard.center = AnimationEngine.screenCenterPosition
        
        self.view.addSubview(currentCard)
        self.seconds = GAME_SECONDS
    }
    
    @IBAction func yesPressed(sender:UIButton) {
        if sender.titleLabel?.text == "YES" {
            checkAnswer(sender)
        } else {
            resultLabel.hidden = true
            startTimer()
            titleLabel.text = "Does this card match the previous?"
        }
        showNextCard()
    }
    
    @IBAction func noPressed(sender:UIButton) {
        checkAnswer(sender)
        showNextCard()
    }
    
    func checkAnswer(sender: UIButton) {
        let isSame = currentCard.currentShape == previousCard.currentShape
        if let answer = sender.titleLabel?.text {
            if answer == "YES"{
                if isSame {
                    correctMatches++
                } else {
                    wrongMatches++
                }
            } else if answer == "NO" {
                if isSame {
                    wrongMatches++
                } else {
                    correctMatches++
                }
            }
        }
    }
    
    func showNextCard() {
        if let current = currentCard {
            let cardToRemove = current
            previousCard = current
            currentCard = nil
            AnimationEngine.animateToPosition(cardToRemove, position: AnimationEngine.offScreenLeftPosition, completion: { (anim:POPAnimation!,finished: Bool) -> Void in
                cardToRemove.removeFromSuperview()
            })
        }
        if let next = createCardFromNib() {
            next.center = AnimationEngine.offScreenRightPosition
            self.view.addSubview(next)
            currentCard = next
            
            if noButton.hidden {
                noButton.hidden = false
                yesButton.setTitle("YES", forState: .Normal)
            }

            AnimationEngine.animateToPosition(next, position: AnimationEngine.screenCenterPosition, completion: { (anim:POPAnimation!, finished: Bool) -> Void in
                //
            })
        }
    }
    
    func createCardFromNib() -> Card! {
        return NSBundle.mainBundle().loadNibNamed("Card", owner: self, options: nil)[0] as? Card
    }
    
    func startTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        if self.seconds > 0 {
            self.seconds--
            let minutes = seconds / 60
            self.timerLabel.text = "\(minutes):" + String(format:"%02d",self.seconds)
        } else {
            self.timerLabel.text = "1:00"
            self.timer.invalidate()
            self.resultLabel.text = "\(correctMatches) correct and \(wrongMatches) wrong"
            self.seconds = GAME_SECONDS
            self.yesButton.setTitle("START", forState: .Normal)
            self.noButton.hidden = true
            self.resultLabel.hidden = false
        }
    }
    
}
