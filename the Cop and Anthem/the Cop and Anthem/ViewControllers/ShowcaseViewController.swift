//
//  ShowcaseViewController.swift
//  the Cop and Anthem
//
//  Created by April Zhou on 4/22/19.
//  Copyright © 2019 April Zhou. All rights reserved.
//

import UIKit

class ShowcaseViewController: UIViewController {
    var stage = 0
    let duration: Double = 0.05
    var count = 0
    let text = ["Your plan is to speak to a young woman.",
                "She should be a very nice young lady, who would not want a strange man to speak to her.",
                "She would ask the cop for help."]
    lazy var size = text.count
    @IBOutlet weak var checkoutBtn: UIButton!
    @IBOutlet weak var tryElseBtn: UIButton!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var tf: UITextView!
    @IBOutlet weak var lady1: UIImageView!
    @IBOutlet weak var lady2: UIImageView!

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
            if (count == size-1){
                self.checkoutBtn.isHidden = false
            }
            else{
                self.checkoutBtn.isHidden = true
            }
            tf.text = text[count]
            self.lady1.isHidden = true
            self.lady2.isHidden = true
        case 1:
            // waiter talk
            self.choice1.isHidden = false
            self.choice2.isHidden = false
            self.tryElseBtn.isHidden = true
            self.checkoutBtn.isHidden = true
            choice1.setTitle("Left", for: .normal)
            choice2.setTitle("Right", for: .normal)
            tf.text = "Which one are you talking to?"
            self.lady1.isHidden = false
            self.lady2.isHidden = false
        case 2:
            //lady 1
            tf.text = "Lady: Sure. I'd have spoke to you sooner, but the cop was watching."
            self.choice1.isHidden = true
            self.choice2.isHidden = true
            self.tryElseBtn.isHidden = false
            self.checkoutBtn.isHidden = true
            self.lady1.isHidden = false
            self.lady2.isHidden = true
        case 3:
            // lady 2
            tf.text = "Lady: Sure, if you'll buy me a cup of drink. I'd have spoke to you sooner, but the cop was watching."
            self.choice1.isHidden = true
            self.choice2.isHidden = true
            self.tryElseBtn.isHidden = false
            self.checkoutBtn.isHidden = true
            self.lady1.isHidden = true
            self.lady2.isHidden = false
        default:
            // do nothing
            break
        }
    }
    
    @IBAction func tapText(_ sender: Any) {
        if (count<size-1){
            count = count+1
        }
        gotoStage()
    }
    
    
    @IBAction func checkPressed(_ sender: UIButton) {
        stage = 1
        gotoStage()
    }
    
    @IBAction func lady1chosen(_ sender: UIButton) {
        stage = 2
        UIView.animate(withDuration: duration, animations: {self.moveRight(view: self.lady1)})
        UIView.animate(withDuration: duration, delay: 0.05, animations: {self.moveLeft(view: self.lady1)})
        UIView.animate(withDuration: duration, delay: 0.1, animations: {self.moveLeft(view: self.lady1)})
        UIView.animate(withDuration: duration, delay: 0.15, animations: {self.moveRight(view: self.lady1)})
        gotoStage()
    }
    
    @IBAction func lady2chosen(_ sender: UIButton) {
        stage = 3
        UIView.animate(withDuration: duration, animations: {self.moveRight(view: self.lady2)})
        UIView.animate(withDuration: duration, delay: 0.05, animations: {self.moveLeft(view: self.lady2)})
        UIView.animate(withDuration: duration, delay: 0.1, animations: {self.moveLeft(view: self.lady2)})
        UIView.animate(withDuration: duration, delay: 0.15, animations: {self.moveRight(view: self.lady2)})
        gotoStage()
        
    }
    
    
    // function used for swipe back to menu
    @objc func handleSwipe(sender:UISwipeGestureRecognizer){
        if (sender.state == .ended){
            performSegue(withIdentifier: "toMenu", sender: self)
        }
    }
    
    func moveRight(view:UIView){
        view.center.x += 30
    }
    func moveLeft(view:UIView){
        view.center.x -= 30
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
