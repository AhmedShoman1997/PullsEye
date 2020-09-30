//
//  ViewController.swift
//  BullsEye
//
//  Created by Ahmed Shoman on 9/28/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit

class BullsEyeController: UIViewController {
    //MARK: - Constanst
    var score = 0
    var roundNum = 1
    var diff = 0
    var word = ""
    var message = ""
    var target = 0
    var sliderValue = 0
    var Sscore = 0
    let defaults = UserDefaults.standard
    
    //MARK: - Outlet
    @IBOutlet weak var targetLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var roundLbl: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
      
        inViewDidLoad()
        loadData()
        
    }
    
    //MARK: - IBAction
    @IBAction func hitmeBTN(_ sender: UIButton) {
        makeMath()
        makeRandomTarget()
        
    }
    @IBAction func resetBTN(_ sender: UIButton) {
        resetFunc()
        loadData()
    }

   
    
    //MARK: - HelperFunction
    
    func setupSlider() {
        
        let resizeable = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        slider.setThumbImage(#imageLiteral(resourceName: "SliderThumb-Normal"), for: .normal)
        slider.setThumbImage(#imageLiteral(resourceName: "SliderThumb-Highlighted"), for: .highlighted)
        
        let minimumImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let maxiMumImage = #imageLiteral(resourceName: "SliderTrackRight")
        
        let resizeminimumImage = minimumImage.resizableImage(withCapInsets: resizeable)
        let resizemaxiMumImage =  maxiMumImage.resizableImage(withCapInsets: resizeable)
        
        slider.setMinimumTrackImage(resizeminimumImage, for: .normal)
        slider.setMaximumTrackImage(resizemaxiMumImage, for: .normal)
        
    }
    func resetFunc()  {
        slider.value = 50
        removeData()
        scoreLbl.text = "\(0)"
        roundLbl.text = "\(1)"
        
    }
    
    func makeRandomTarget()  {
        target = Int.random(in: 1..<99)
        targetLbl.text = "\(target)"
    }
    
    func makeMath()  {
         sliderValue = Int(round(Double(slider.value)))
        
        diff = abs(target - sliderValue)
        
        if diff >= 0 && diff <= 5{
            word = "excellent"
            Sscore = 150
        }
        else if  diff > 6 && diff <= 15{
            word = "very Good"
            Sscore = 100
        }
        else if  diff > 16 && diff <= 25{
            word = "Good"
            Sscore = 50
        }
        else if  diff > 26 && diff <= 35{
            word = "accept"
            Sscore = 25
        }
        else{
            word = "try again"
        }
        score += Sscore
        afterHit()
    }
    func alert()   {
        let message =
        """
        Your Target Is : \(Int (targetLbl.text!) ?? 0)
        You Got :  \(sliderValue)
        So Your Difference Is :  \(diff)
        Your Score Is : \(score)
        """
        
        let alert = UIAlertController(title: word, message: message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(alertAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
   
   
    func afterHit()  {
         
        roundNum += 1
        scoreLbl.text = "\(score)"
        roundLbl.text = "\(roundNum)"
        slider.value = 50
        alert()
        saveData()
       
    }
    func inViewDidLoad()  {
        setupSlider()
               makeRandomTarget()
               slider.value = 50
               
      
    }
    func saveData()  {
        UserDefaults.standard.set(score, forKey: "score")
        UserDefaults.standard.set(roundNum, forKey: "round")
    }
    func loadData()  {
        score =  UserDefaults.standard.integer(forKey: "score")
        scoreLbl.text = "\(score)"
        roundNum = UserDefaults.standard.integer(forKey: "round")
        roundLbl.text = "\(roundNum)"
    }
    func removeData()  {
        UserDefaults.standard.removeObject(forKey: "score")
        UserDefaults.standard.removeObject(forKey: "round")
    }
}



