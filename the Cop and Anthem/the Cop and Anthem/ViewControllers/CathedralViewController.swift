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
                "Sweet music one to your ears.",
                "The anthem sudden and wonderful change in his soul.",
                "It reminds you of the life containing such things as mothers and flowers and high hopes and friends and clean thoughts and clean clothes.",
                "You see your worthless days, your wrong desires, his dead hopes, the lost power of his mind.",
                "You would fight to change your life.",
                "You would make a man of himself again.",
                "You feel a hand on your arm--",
                "Cop: What are you doing here?"]
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
            tf.text = "You come to a quiet street.\nHere is an old,old church."
        case 1:
            // show choices
            self.choice1.isHidden = false
            self.choice2.isHidden = false
            self.followCop.isHidden = true
            self.goInside.isHidden = true
            tf.text = text[count]
        case 2:
            // Nothing
            self.choice1.isHidden = true
            self.choice2.isHidden = true
            self.followCop.isHidden = false
            self.goInside.isHidden = true
            tf.text = "Cop: You are loafing, come with me."
        case 3:
            // Confessing
            self.choice1.isHidden = true
            self.choice2.isHidden = true
            self.followCop.isHidden = false
            self.goInside.isHidden = true
            tf.text = "Cop: No you are not come with me."
            
        default:
            // do nothing
            break
        }
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
