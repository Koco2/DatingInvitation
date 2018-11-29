//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    //Place your instance variables here
    
    var audioPlayer : AVAudioPlayer!
    let allQuestions = QuestionBank()
    var pickedAnswer: Int = 0
    var questionNum: Int = 0
    var NumOfQuestion: Int = 6
    var score: Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet var backImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Thread.sleep(forTimeInterval: 3.0) //延长3秒
        backImage.image = UIImage(named: "1")
        nextQuestion()
        
    }
    

    @IBAction func whenPressed(_ sender: UIButton) {
        
        backImage.image = UIImage(named: String(questionNum+2))
        pickedAnswer = sender.tag
        checkAnswer()
        questionNum += 1
        nextQuestion()
    }
    
    
    
    func playCorrectSound()
    {
        let soundURL = Bundle.main.url(forResource: "note-c4", withExtension: "wav")
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch
        {
            print(error)
        }
        audioPlayer.play()
    }
    
    func playErrorSound()
    {
        let soundURL = Bundle.main.url(forResource: "note-c3", withExtension: "wav")
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch
        {
            print(error)
        }
        audioPlayer.play()
    }
    
    
    func updateUI() {
        scoreLabel.text = "\(score)"
        progressLabel.text = "\(questionNum + 1)/6"
        
        progressBar.frame.size.width = (view.frame.size.width/6)*CGFloat(questionNum+1)
    }
    

    func nextQuestion() {
        updateUI()
        
        if questionNum <= 5
        {
            questionLabel.text = allQuestions.list[questionNum].questionText
            choice1.setTitle(allQuestions.list[questionNum].choice1, for: .normal)
            choice2.setTitle(allQuestions.list[questionNum].choice2, for: .normal)
            choice3.setTitle(allQuestions.list[questionNum].choice3, for: .normal)
        }
        else
        {
             backImage.image = UIImage(named: "6")
            score = 0
            let alert = UIAlertController(title: "正确答案", message: "你的微笑", preferredStyle: .alert)
           
            let restartAction = UIAlertAction(title: "勉强答应", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            
            alert.addAction(restartAction)
            
           
           
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNum].answer
        
        if pickedAnswer == correctAnswer || correctAnswer == 4
        {
            playCorrectSound()
            ProgressHUD.showSuccess("Correct")
            score += 1
        }else
        {
            playErrorSound()
            ProgressHUD.showError("Wrong")
        }
    }
    
    
    func startOver() {
        questionNum = 0
        nextQuestion()
    }
    

    
}
