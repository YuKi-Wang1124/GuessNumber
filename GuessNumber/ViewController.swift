//
//  ViewController.swift
//  GuessNumber
//
//  Created by Peter Pan on 2021/8/31.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var guessWrongCountLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    var answer = Int.random(in: 1...100)
    var guessWrongCount = 0
    var miniNumber = 0
    var maxNumber = 100

    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberTextField.layer.cornerRadius = 30
        resultLabel.text = "   小豬佩奇猜數字"
        titleLabel.text = "猜 0~100 的數字，有6次機會！"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .brown
        titleLabel.font = UIFont.systemFont(ofSize: 24)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         view.endEditing(true)
     }
     
    
    @IBAction func guess(_ sender: Any) {
        let numberText = numberTextField.text!
        let number = Int(numberText)
        
        if number != nil, number! <= maxNumber, number! >= miniNumber {
            let guessNumber = number!
            
            if guessNumber == answer {
                resultLabel.text = "就是 \(guessNumber) ，你猜對了"
            } else if guessNumber < answer {
                miniNumber = guessNumber
                resultLabel.text = "\(miniNumber) ~ \(maxNumber) 之間"
                numberTextField.text = ""
                guessWrongCount += 1
            }  else if guessNumber > answer {
                maxNumber = guessNumber
                resultLabel.text = "\(miniNumber) ~ \(maxNumber)  之間"
                numberTextField.text = ""
                guessWrongCount += 1
            }
            
            guessWrongCountLabel.text = "剩下 \(6 - guessWrongCount) 次機會！"
        }
        
        if number != nil , number! > maxNumber {
            resultLabel.text = "\(miniNumber) ~ \(maxNumber)  之間的數字喔～～～"
            guessWrongCountLabel.text = "不給你猜～～"
        }
        
        if number == nil {
            resultLabel.text = "請輸入 \(miniNumber) ~ \(maxNumber) 之間的數字!!!!!"
            guessWrongCountLabel.text = "不給你猜～～"
        }
        
       
        if guessWrongCount == 6 {
            numberTextField.text = ""
            gameOverLabel.isHidden = false
        }
        
        numberTextField.endEditing(true)
    }
    
    
    @IBAction func replay(_ sender: Any) {
        
        answer = Int.random(in: 1...100)
        numberTextField.text = ""
        miniNumber = 0
        maxNumber = 100
        resultLabel.text = "請輸入 \(miniNumber) ~ \(maxNumber) 之間的數字!!!!!"
        guessWrongCount = 0
        guessWrongCountLabel.text = "有\(6 - guessWrongCount)次機會！"
        gameOverLabel.isHidden = true 

    }
    
}

