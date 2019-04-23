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
            self.checkoutBtn.isHidden = false
            self.lady1.isHidden = true
            self.lady2.isHidden = true
            tf.text = "Check it out"
        case 1:
            // wait to choose
            self.choice1.isHidden = false
            self.choice2.isHidden = false
            self.tryElseBtn.isHidden = true
            self.checkoutBtn.isHidden = true
            choice1.setTitle("Lady #1", for: .normal)
            choice2.setTitle("Lady #2", for: .normal)
            self.lady1.isHidden = false
            self.lady2.isHidden = false
            tf.text = "Which one are you goin for"
        case 2:
            //lady 1
            tf.text = "Lady 1: Com'on Baby."
            self.choice1.isHidden = true
            self.choice2.isHidden = true
            self.tryElseBtn.isHidden = false
            self.checkoutBtn.isHidden = true
            self.lady1.isHidden = false
            self.lady2.isHidden = true
        case 3:
            // lady 2
            tf.text = "Lady 2: Com'on Baby."
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
    
    @IBAction func checkPressed(_ sender: UIButton) {
        stage = 1
        gotoStage()
    }
    
    // lady 1
    @IBAction func lady1chosen(_ sender: UIButton) {
        stage = 2
        gotoStage()
    }
    @IBAction func lady1Pinched(_ sender: UIPinchGestureRecognizer) {
        stage = 2
        gotoStage()
    }
    
    // lady 2
    @IBAction func lady2chosen(_ sender: UIButton) {
        stage = 3
        gotoStage()
    }
    @IBAction func lady2Pinched(_ sender: UIPinchGestureRecognizer) {
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
