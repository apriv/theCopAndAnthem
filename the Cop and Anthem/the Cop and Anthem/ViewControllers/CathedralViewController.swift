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
            tf.text = "What a great life. I want to have a job, be a real man. "
        case 1:
            // show choices
            self.choice1.isHidden = false
            self.choice2.isHidden = false
            self.followCop.isHidden = true
            self.goInside.isHidden = true
            tf.text = "Cop: What are you doing here?"
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
