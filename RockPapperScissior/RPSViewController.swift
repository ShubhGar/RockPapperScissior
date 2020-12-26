//
//  ViewController.swift
//  RockPapperScissior
//
//  Created by shubham Garg on 09/06/20.
//  Copyright © 2020 shubham Garg. All rights reserved.
//

import UIKit

class RPSViewController: UIViewController {
    
    @IBOutlet weak var computerSelectionLbl: UILabel!
    
    var selectionArray = ["Rock", "Scissior", "papper"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func rockBtnAxn(_ sender: Any) {
        // check winner for Rock
        checkWinner(selection: self.selectionArray[0])
    }
    
    @IBAction func scissiorBtnAxn(_ sender: Any) {
        //Check winner for scissior
        checkWinner(selection: self.selectionArray[1])
    }
    
    @IBAction func papperBtnAxn(_ sender: Any) {
        //Check winner for papper
        checkWinner(selection: self.selectionArray[2])
    }
    
    func checkWinner(selection: String){
        //take a random number in [0, 1, 2] for computer selection
        let random = Int.random(in: 0 ..< 3)
        computerSelectionLbl.text = self.selectionArray[random]
        if selection == self.selectionArray[random]{
            showWinner(message: "Game is Tie.")
        }
            // if user select rock
        else if selection == selectionArray[0]{
            //Computer select scissior
            if random == 1{
                showWinner(message: "Player Won.")
            }
                //computer select papper
            else{
                showWinner(message: "Computer Won.")
            }
        }
            // if user select Scissior
        else if selection == selectionArray[1]{
            //computer select papper
            if random == 2{
                showWinner(message: "Player Won.")
            }
                //computer select Rock
            else{
                showWinner(message: "Computer Won.")
            }
        }
        // if user select papper
        else{
            //computer select rock
            if random == 0{
                showWinner(message: "Player Won.")
            }
                //Computer select scissior
            else{
                showWinner(message: "Computer Won.")
            }
        }
        
        
    }
    
    func showWinner(message: String){
        //Create alert
        let alert = UIAlertController(title: "Winner", message: message, preferredStyle: .alert)
        //add action in alert
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.cleanUp()
        }))
        // present alert on the screen
        self.present(alert, animated: true, completion: nil)
    }
    
    func cleanUp(){
        self.computerSelectionLbl.text = ""
    }
}

