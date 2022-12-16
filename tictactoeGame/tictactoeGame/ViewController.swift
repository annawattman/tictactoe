//
//  ViewController.swift
//  tictactoeGame
//
//  Created by Anna Wattman on 2022-12-01.
//

import UIKit

class ViewController: UIViewController {
    
    enum Turn {
        case Nought
        case Cross
    }
    
    
    @IBOutlet weak var turnLabel: UILabel!
    /* ---------- IMAGES -----------*/
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var imageThree: UIImageView!
    @IBOutlet weak var imageFour: UIImageView!
    @IBOutlet weak var imageFive: UIImageView!
    @IBOutlet weak var imageSix: UIImageView!
    @IBOutlet weak var imageSeven: UIImageView!
    @IBOutlet weak var imageEight: UIImageView!
    @IBOutlet weak var imageNine: UIImageView!
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    
    
    var NOUGHT = UIImage(named: "cross")
    var CROSS = UIImage(named: "nought")
    var board = [UIImageView]()
    var xPoints = 0
    var oPoints = 0
    
    
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var xPointsLabel: UILabel!
    @IBOutlet weak var oPointsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
        
    }
    
    func initBoard() {
        board.append(imageOne)
        board.append(imageTwo)
        board.append(imageThree)
        board.append(imageFour)
        board.append(imageFive)
        board.append(imageSix)
        board.append(imageSeven)
        board.append(imageEight)
        board.append(imageNine)
    }
    
    
    @IBAction func tappedTile(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as? UIImageView
        
            if (imageView?.image == nil) {
                if (currentTurn == Turn.Cross) {
                    imageView?.image = CROSS
                    currentTurn = Turn.Nought
                    turnLabel.text = "X"
                    if checkIfWinning() {
                        getPoints()
                        resetBoard()
                    }
                    else if fullBoard() {
                        resetBoard()
                    }
                    
                } else if (currentTurn == Turn.Nought) {
                    imageView?.image = NOUGHT
                    currentTurn = Turn.Cross
                    turnLabel.text = "O"
                    if checkIfWinning() {
                        getPoints()
                        resetBoard()
                    }
                    else if fullBoard() {
                        resetBoard()
                    }
                }
        }
    }
    
    func fullBoard() -> Bool {
        for imageView in board {
            if imageView.image == nil {
                print("Falsk")
                return false
            }
        }
        print("Sann")
        return true
    
    }
    
    func checkIfWinning() -> Bool {
        //Horisontalt
        if (imageOne.image == imageTwo.image && imageTwo.image == imageThree.image && imageOne.image != nil) {
            return true
        }
        
        if (imageFour.image == imageFive.image && imageFive.image == imageSix.image && imageFour.image != nil) {
            return true
        }
        
        if (imageSeven.image == imageEight.image && imageEight.image == imageNine.image && imageSeven.image != nil) {
            return true
        }
        
        //Vertikalt
        
        if (imageOne.image == imageFour.image && imageFour.image == imageSeven.image && imageOne.image != nil ) {
            return true
        }
        
        if (imageTwo.image == imageFive.image && imageFive.image == imageEight.image && imageTwo.image != nil) {
            return true
        }
        
        if (imageThree.image == imageSix.image && imageSix.image == imageNine.image && imageThree.image != nil) {
            return true
        }
        
        // Diagonalt
        if (imageOne.image == imageFive.image && imageFive.image == imageNine.image && imageOne.image != nil) {
            return true
        }
        
        if (imageThree.image == imageFive.image && imageFive.image == imageSeven.image && imageThree.image != nil) {
            return true
        }
        return false
    }

    func getPoints() {
                    if(currentTurn == Turn.Cross)
                    {
                        xPoints += 1
                        xPointsLabel.text = "\(xPoints)"
                    }
                    else
                    {
                        oPoints += 1
                        oPointsLabel.text = "\(oPoints)"
                    }
            
                    let winner = currentTurn == Turn.Cross ? "Crosses" : "Noughts"
                   // alertMessage = winner + "Wins!"
                   // showAlert = true
                }
    
    func resetBoard() {
       for tile in imageContainer.subviews {
                    if let imageView = tile as? UIImageView {
                        imageView.image = nil
                    }
                }
    }
}

