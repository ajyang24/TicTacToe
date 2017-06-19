//
//  ViewController.swift
//  TicTacToe
//
//  Created by Andrew Yang on 6/15/17.
//  Copyright © 2017 Andrew Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var labelTopLeft: GridLabel!
    @IBOutlet weak var labelTopCenter: GridLabel!
    @IBOutlet weak var labelTopRight: GridLabel!
    @IBOutlet weak var labelCenterLeft: GridLabel!
    @IBOutlet weak var labelCenterCenter: GridLabel!
    @IBOutlet weak var labelCenterRight: GridLabel!
    @IBOutlet weak var labelBottomLeft: GridLabel!
    @IBOutlet weak var labelBottomCenter: GridLabel!
    @IBOutlet weak var labelBottomRight: GridLabel!
    
    var labelsArray = [GridLabel]()
    var xTurn = true
    var canTap = true
    var gameOver = false
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        labelsArray = [labelTopLeft, labelTopCenter, labelTopRight, labelCenterLeft, labelCenterCenter, labelCenterRight, labelBottomLeft, labelBottomCenter, labelBottomRight]
        
    }
    
    func setXorO(sender : UITapGestureRecognizer, text : String)
    {

        for label in labelsArray
        {
        
        if (label.frame.contains(sender.location(in: backgroundView)))
                && label.canTap == true
            {
                label.text = text
                label.canTap = false
                xTurn = !xTurn
            }
        }
        checkForWinner()
        checkForTie()
        
        
    }
    func setCPUMove(text : String)
    {
        for label in labelsArray
        {
            
            if label.canTap == true
            {
                label.text = text
                label.canTap = false
                xTurn = !xTurn
                checkForWinner()
                checkForTie()
                return
            }
        }
    }

    
    func resetGame()
    {
        for label in labelsArray
        {
            label.text = ""
            label.canTap = true
            xTurn = true
            gameOver = false
        }
    }
    
    func displayWinningMessage(message:String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Reset", style: .default) {
            (action) -> Void in self.resetGame()
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        gameOver = true
    }
    
    func checkForWinner()
    {
        if (labelTopRight.text! == labelTopCenter.text! && labelTopCenter.text! == labelTopLeft.text!) && labelTopRight.canTap == false ||
            (labelCenterRight.text! == labelCenterCenter.text! && labelCenterCenter.text! == labelCenterLeft.text!) && labelCenterRight.canTap == false ||
            (labelBottomRight.text! == labelBottomCenter.text! && labelBottomCenter.text! == labelBottomLeft.text!) && labelBottomRight.canTap == false ||
            (labelTopLeft.text! == labelCenterLeft.text! && labelCenterLeft.text! == labelBottomLeft.text!) && labelTopLeft.canTap == false ||
            (labelTopCenter.text! == labelCenterCenter.text! && labelCenterCenter.text! == labelBottomCenter.text!) && labelTopCenter.canTap == false ||
            (labelTopRight.text! == labelCenterRight.text! && labelCenterRight.text! == labelBottomRight.text!) && labelTopRight.canTap == false ||
            (labelTopLeft.text! == labelCenterCenter.text! && labelCenterCenter.text! == labelBottomRight.text!) && labelTopLeft.canTap == false ||
            (labelTopRight.text! == labelCenterCenter.text! && labelCenterCenter.text! == labelBottomLeft.text!) && labelTopRight.canTap == false
        {
            displayWinningMessage(message: "You have won!")
            
        }
    }
    
    func checkForTie()
    {
        if gameOver == true
        {
            return
        }
        var emptyBoxLeft : Bool = false
        for label in labelsArray
        {
            if label.canTap == true
            {
                emptyBoxLeft = true
            }
    }
        if emptyBoxLeft == false
        {
            displayWinningMessage(message: "Cat's Game!")
        }
}
    
    @IBAction func onTappedGridLabel(_ sender: UITapGestureRecognizer)
    {
        if gameOver == true
        {
            print("Game over.")
            return
        }
        
        print("Tap executed.")
        if xTurn == true
        {
            setXorO(sender: sender, text : "X")
            setCPUMove(text : "O")
        }
    }
}

