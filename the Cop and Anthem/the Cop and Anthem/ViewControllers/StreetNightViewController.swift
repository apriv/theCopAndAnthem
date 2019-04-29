//
//  StreetNightViewController.swift
//  the Cop and Anthem
//
//  Created by April Zhou on 4/22/19.
//  Copyright © 2019 April Zhou. All rights reserved.
//

import UIKit

class StreetNightViewController: UIViewController {
    var stage = 0
    var count = 0
    let text = ["The cop turned his back, said to another man.",
                "Cop: It 's just one of those college boys.",
                "Cop: He won't hurt anything.",
                "Cop: We had orders to let them shout."]
    lazy var size = text.count
    @IBOutlet weak var tf: UITextView!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var tryElseBtn: UIButton!
    
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
            tf.text = "You began to shout as if you have drank too much."
            self.choice1.isHidden = true
            self.choice2.isHidden = true
            self.tryElseBtn.isHidden = true
        case 1:
            // wait to choose
            self.choice1.isHidden = false
            self.choice2.isHidden = false
            self.tryElseBtn.isHidden = true
            choice1.setTitle("\"Stupid Cop!\"", for: .normal)
            choice2.setTitle("\"How is your night!\"", for: .normal)
        case 2:
            //choice 1
            tf.text = text[count]
            self.choice1.isHidden = true
            self.choice2.isHidden = true
            if(count == size-1){
                self.tryElseBtn.isHidden = false
            }
            else{
                self.tryElseBtn.isHidden = true
            }
        case 3:
            // choice 2
            tf.text = text[count]
            self.choice1.isHidden = true
            self.choice2.isHidden = true
            if(count == size-1){
                self.tryElseBtn.isHidden = false
            }
            else{
                self.tryElseBtn.isHidden = true
            }
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
    
    
    @IBAction func Taptext(_ sender: Any) {
        if(stage == 2 || stage == 3){
            if (count<size-1){
                count = count+1
            }
        }
        if(stage == 0){
            stage = 1
        }
        gotoStage()
    }
    
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
