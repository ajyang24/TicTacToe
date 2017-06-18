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
    }

    @IBAction func onTappedGridLabel(_ sender: UITapGestureRecognizer)
    {
        print("Tap executed.")

        if xTurn == true
        {
            setXorO(sender: sender, text : "X")
        }
        else
        {
            setXorO(sender: sender, text : "O")
        }
    }
}

