//
//  ShowcaseGirlViewController.swift
//  the Cop and Anthem
//
//  Created by April Zhou on 4/22/19.
//  Copyright © 2019 April Zhou. All rights reserved.
//

import UIKit

class ShowcaseGirlViewController: UIViewController {
    var stage = 0
    @IBOutlet weak var doBtn: UIButton!
    @IBOutlet weak var doElseBtn: UIButton!
    @IBOutlet weak var tf: UITextView!
    @IBOutlet weak var glass: UIButton!
    @IBOutlet weak var bgimg: UIImageView!
    
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
            tf.text = "You see a glass, breaking it may get you in prison."
            doElseBtn.isHidden = true
            glass.isHidden = true
        case 1:
            tf.text = "No Text"
            tf.isHidden = true
            doBtn.isHidden = true
            doElseBtn.isHidden = true
            glass.isHidden = false
        case 2:
            tf.isHidden = false
            doElseBtn.isHidden = false
            doBtn.isHidden = true
            glass.isHidden = true
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
    
    @IBAction func doPressed(_ sender: UIButton) {
        stage = 1
        gotoStage()
    }
    
    @IBAction func tabbing(_ sender: UITapGestureRecognizer) {
        stage = 2
        bgimg.image = UIImage(named:"showcase_broken")
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
