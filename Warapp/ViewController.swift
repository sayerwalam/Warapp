//
//  ViewController.swift
//  Warapp
//
//  Created by Mohammed Sayerwala on 4/25/18.
//  Copyright © 2018 Mohammed Sayerwala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftScoreLabel: UILabel!
    @IBOutlet weak var rightScoreLabel: UILabel!
    @IBOutlet weak var playerName: UILabel!
    
    var leftScore = 0
    var rightScore = 0
    var winner:String?
    var name:String?
    var player:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let nameToDisplay = name{
        playerName.text = nameToDisplay
        }
        if playerName.text == ""
        {
            playerName.text = "Player 1"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func dealTapped(_ sender: Any) {
    
        let leftRandomNumber = arc4random_uniform(13) + 2
        let rightRandomNumber = arc4random_uniform(13) + 2
        
        leftImageView.image = UIImage(named: "card\(leftRandomNumber)")
        rightImageView.image = UIImage(named :"card\(rightRandomNumber)")
        
        if leftRandomNumber > rightRandomNumber{
            leftScore += 1
            leftScoreLabel.text = String(leftScore)
        }
        else if rightRandomNumber > leftRandomNumber{
            rightScore += 1
            rightScoreLabel.text = String(rightScore)
        }
        else{
            
            leftScore += 1
            rightScore += 1
            leftScoreLabel.text = String(leftScore)
            rightScoreLabel.text = String(rightScore)
        }
        }
    
    
    @IBAction func showResult(_ sender: UIButton) {
        
        player = playerName.text
        var diff = 0
                
        if leftScore > rightScore
        {
            diff = leftScore - rightScore
            winner = "Congrats \(player!), you won the game by \(String(diff)) point."
                performSegue(withIdentifier: "SecondVC", sender: self)
        }
        else if rightScore > leftScore
        {
            diff = rightScore - leftScore
             winner = "Sorry, the CPU won the game by \(String(diff)) point."
            performSegue(withIdentifier: "SecondVC", sender: self)
        }
        else if leftScore == rightScore
        {
            winner = "It was a tie"
            performSegue(withIdentifier: "SecondVC", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SecondViewController{
            destination.result = winner
        }
    }
}
