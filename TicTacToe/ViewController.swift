//
//  ViewController.swift
//  TicTacToe
//
//  Created by Brandon Escobar on 11/15/19.
//  Copyright © 2019 Brandon Escobar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var gridLabel0: GridLabel!
    @IBOutlet weak var gridLabel1: GridLabel!
    @IBOutlet weak var gridLabel2: GridLabel!
    @IBOutlet weak var gridLabel3: GridLabel!
    @IBOutlet weak var gridLabel4: GridLabel!
    @IBOutlet weak var gridLabel5: GridLabel!
    @IBOutlet weak var gridLabel6: GridLabel!
    @IBOutlet weak var gridLabel7: GridLabel!
    @IBOutlet weak var gridLabel8: GridLabel!
    @IBOutlet weak var computerMode: UIButton!
    var labelsArray = [GridLabel]()
    var xTurn = true
    var gameOver = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelsArray.append(gridLabel0)
        labelsArray.append(gridLabel1)
        labelsArray.append(gridLabel2)
        labelsArray.append(gridLabel3)
        labelsArray.append(gridLabel4)
        labelsArray.append(gridLabel5)
        labelsArray.append(gridLabel6)
        labelsArray.append(gridLabel7)
        labelsArray.append(gridLabel8)
    }

    @IBAction func onTappedGridLabel(sender: UITapGestureRecognizer) {
        //print("Tapped somewhere")// uncomment to test
        for label in labelsArray {
            if label.canTap && label.frame.contains(sender.location(in:backgroundView)) {
                if xTurn {
                    label.text = "X"
                } else {
                    label.text = "O"
                }
                xTurn = !xTurn
                label.canTap = false
                checkForWinner()
            }
        }
        
        
    }
    
    func displayWinningMessage(message: String){
        print(message)
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Reset", style: .default){
            (action) -> Void in self.resetGame()
        }
        print("RESET")
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        gameOver = true
    }
    
    func checkForWinner() {
        
        checkLines(a: gridLabel0.text!, b: gridLabel1.text!, c: gridLabel2.text!)
        checkLines(a: gridLabel3.text!, b: gridLabel4.text!, c: gridLabel5.text!)
        checkLines(a: gridLabel6.text!, b: gridLabel7.text!, c: gridLabel8.text!)
        
        checkLines(a: gridLabel0.text!, b: gridLabel3.text!, c: gridLabel6.text!)
        checkLines(a: gridLabel1.text!, b: gridLabel4.text!, c: gridLabel7.text!)
        checkLines(a: gridLabel2.text!, b: gridLabel5.text!, c: gridLabel8.text!)
        
        checkLines(a: gridLabel0.text!, b: gridLabel4.text!, c: gridLabel8.text!)
        checkLines(a: gridLabel2.text!, b: gridLabel4.text!, c: gridLabel6.text!)
        
        var countToy = 0
        
        for label in labelsArray {
            if label.text == ""{
                countToy += 1// How many moves you got left?
            }
        }
        
        if countToy == 0 {
            displayWinningMessage(message: "Cat's game")
        } else if countToy == 1 {
            print("\(countToy) move left")
        } else {
            print("\(countToy) move(s) left")
        }
        
    }
    
    func checkLines(a: String, b: String, c: String){
        if a != "" && b != "" && c != ""{
            if a == b && b == c && c == a {
                displayWinningMessage(message: "\(a)'s win")
            }
        }
    }
    
    func resetGame() {
        for label in labelsArray {
            label.text = ""
            label.canTap = true
        }
        xTurn = true
        gameOver = false
    }
}

