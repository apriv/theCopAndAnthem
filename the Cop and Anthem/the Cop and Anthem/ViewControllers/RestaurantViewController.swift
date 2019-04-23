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
            self.stepInsideBtn.isHidden = false
            tf.text = "Let's do it"
        case 1:
            // waiter talk
            self.choice1.isHidden = false
            self.choice2.isHidden = false
            self.tryElseBtn.isHidden = true
            self.stepInsideBtn.isHidden = true
            choice1.setTitle("say #1", for: .normal)
            choice2.setTitle("say #2", for: .normal)
            tf.text = "Waiter: You can't afford here. Get out. "
        case 2:
            //choice 1
            tf.text = "bad choice 1"
            self.choice1.isHidden = true
            self.choice2.isHidden = true
            self.tryElseBtn.isHidden = false
            self.stepInsideBtn.isHidden = true
        case 3:
            // choice 2
            tf.text = "bad choice 2"
            self.choice1.isHidden = true
            self.choice2.isHidden = true
            self.tryElseBtn.isHidden = false
            self.stepInsideBtn.isHidden = true
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
