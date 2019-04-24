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
    var count = 0
    let text = ["Cop: Where's the man that did that?",
                "You: Don’t you think that I might have done it?",
                "Cop: Ah! Men who break windows do not stop there to talk to cops.",
                "The cop saw a man further along the street, running. He ran after him."]
    lazy var size = text.count
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
            
            tf.isHidden = true
            doBtn.isHidden = true
            doElseBtn.isHidden = true
            glass.isHidden = false
        case 2:
            tf.text = text[count]
            tf.isHidden = false
            if(count == size-1){
                doElseBtn.isHidden = false
            }
            else{
                doElseBtn.isHidden = true
            }
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
    
    
    @IBAction func tapText(_ sender: Any) {
        stage = 2
        if (count<size-1){
            count = count+1
        }
        gotoStage()
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
