//
//  RestaurantViewController.swift
//  the Cop and Anthem
//
//  Created by April Zhou on 4/22/19.
//  Copyright © 2019 April Zhou. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController {
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var stepInsideBtn: UIButton!
    @IBOutlet weak var tryElseBtn: UIButton!
    @IBOutlet weak var tf: UITextView!
    
    var stage = 0
    var count = 0
    var count2 = 0
    let text = ["Maybe the most pleasant way is to go and have a good dinner at some fine restaurant",
                "Then you can say no money to pay",
                "Then the police will be called",
                "Thinking this way, you stopped at a large and brightly lighted restaurant."]
    let text2 = ["No one stopped you.",
                 "You have a big dinner.",
                 "You: Money and I are strangers. Just call the police!",
                 "Waiter: No police for you!",
                 "You got threw on the street by two waiters."]
    lazy var size = text.count
    lazy var size2 = text2.count
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set gesture to menu
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        upSwipe.direction = .up
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(upSwipe)
        
        gotoStage()
    }
    
    // do stuff accoring int stage
    func gotoStage(){
        switch stage{
        case 0:
            // bg story
            self.choice1.isHidden = true
            self.choice2.isHidden = true
            self.tryElseBtn.isHidden = true
            self.stepInsideBtn.isHidden = true
            tf.text = text[count]
        case 1:
            // waiter talk
            self.choice1.isHidden = false
            self.choice2.isHidden = false
            self.tryElseBtn.isHidden = true
            self.stepInsideBtn.isHidden = true
            choice1.setTitle("Directly go into restaurant", for: .normal)
            choice2.setTitle("Use coat to cover your leg", for: .normal)
            tf.text = "You are sure you looked alright, but not sure about pants. \nYou choose to:"
        case 2:
            //choice 1
            tf.text = "Waiter: You cannot afford this restaurant. Get out!"
            self.choice1.isHidden = true
            self.choice2.isHidden = true
            self.tryElseBtn.isHidden = false
            self.stepInsideBtn.isHidden = true
        case 3:
            // choice 2
            tf.text = text2[count2]
            self.choice1.isHidden = true
            self.choice2.isHidden = true
            self.tryElseBtn.isHidden = true
            self.stepInsideBtn.isHidden = true
        case 4:
            tf.text = text[count]
            self.stepInsideBtn.isHidden = false
        case 5:
            tf.text = text2[count2]
            self.tryElseBtn.isHidden = false
        default:
            // do nothing
            break
        }
    }
    
    // function used for swipe back to menu
    @objc func handleSwipe(sender:UISwipeGestureRecognizer){
        if (sender.state == .ended){
            performSegue(withIdentifier: "toMenu", sender: self)
        }
    }
    
    @IBAction func stepInsidePressed(_ sender: UIButton) {
        stage = 1
        gotoStage()
    }
    
    @IBAction func textTap(_ sender: Any) {
        if(stage==3){
            if (count2<size2-1){
                stage = 3
                print(count2)
                count2 = count2+1
            }
            else{
                print("enter")
                stage = 5;
            }
        }
        else{
            if (count<size-1){
                count = count+1
            }
            else{
                stage = 4;
            }
        }
        
        gotoStage()
    }
    
    
    
    // what happen when choice1 pressed
    @IBAction func choice1Pressed(_ sender: UIButton) {
        stage = 2
        gotoStage()
    }
    
    // what happen when choice2 pressed
    @IBAction func choice2Pressed(_ sender: UIButton) {
        stage = 3
        gotoStage()
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
