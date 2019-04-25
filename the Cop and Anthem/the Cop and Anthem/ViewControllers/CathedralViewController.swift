//
//  CathedralViewController.swift
//  the Cop and Anthem
//
//  Created by April Zhou on 4/22/19.
//  Copyright © 2019 April Zhou. All rights reserved.
//

import UIKit

class CathedralViewController: UIViewController {
    var stage = 0
    var count = 0
    let text = ["The moon is above, peaceful and bright.",
                "Through one colored-glass window comes a soft light.",
                "The anthem sudden and wonderful change in his soul.",
                "Sweet music caught and held you transfixed against the convolutions of the iron fence.",
                "It reminds you of the life containing such things as mothers and roses and ambitions and friends and immaculate thoughts and collars.",
                "You see your worthless days, your wrong desires, your dead hopes, the lost power of your mind.",
                "You would fight to change your life.",
                "You would make a man of yourself again.",
                "You feel a hand on your arm ---",
                "Cop: Hey, what are you doing here?"]
    lazy var size = text.count
    @IBOutlet weak var tf: UITextView!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var followCop: UIButton!
    @IBOutlet weak var goInside: UIButton!
    
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
            // hide choices
            self.choice1.isHidden = true
            self.choice2.isHidden = true
            self.followCop.isHidden = true
            self.goInside.isHidden = false
            tf.text = "You come to a quiet street.\nHere is an old, old church."
        case 1:
            // show choices
            if(count == size-1){
                self.choice1.isHidden = false
                self.choice2.isHidden = false
            }
            else{
                self.choice1.isHidden = true
                self.choice2.isHidden = true
            }
            self.followCop.isHidden = true
            self.goInside.isHidden = true
            tf.text = text[count]
        case 2:
            // Nothing
            self.choice1.isHidden = true
            self.choice2.isHidden = true
            self.followCop.isHidden = false
            self.goInside.isHidden = true
            tf.text = "Cop: You think I believe that? Come with me."
        case 3:
            // Confessing
            self.choice1.isHidden = true
            self.choice2.isHidden = true
            self.followCop.isHidden = false
            self.goInside.isHidden = true
            tf.text = "Cop: Doing nothing? Come with me."
            
        default:
            // do nothing
            break
        }
    }
    
    @IBAction func tapText(_ sender: Any) {
        if (count<size-1){
            stage = 1
            count = count+1
        }
        gotoStage()
    }
    
    
    
    @IBAction func goInsidePressed(_ sender: UIButton) {
        stage = 1
        gotoStage()
    }
    
    // 1 chosen
    @IBAction func c1Pressed(_ sender: UIButton) {
        stage = 2
        gotoStage()
    }
    
    // 2 chosen
    @IBAction func c2Pressed(_ sender: UIButton) {
        stage = 3
        gotoStage()
    }
    
    
    
    
    // function used for swipe back to menu
    @objc func handleSwipe(sender:UISwipeGestureRecognizer){
        if (sender.state == .ended){
            performSegue(withIdentifier: "toMenu", sender: self)
        }
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
