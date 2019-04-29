//
//  CigarShopViewController.swift
//  the Cop and Anthem
//
//  Created by April Zhou on 4/22/19.
//  Copyright © 2019 April Zhou. All rights reserved.
//

import UIKit

class CigarShopViewController: UIViewController {
    var stage = 0
    var count = 0
    
    @IBOutlet weak var tf: UITextView!
    @IBOutlet weak var findBtn: UIButton!
    @IBOutlet weak var tryBtn: UIButton!
    @IBOutlet weak var umbrellaBox: UIButton!
    @IBOutlet weak var bgImg: UIImageView!
    
    
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
            // hide choices, bg story
            tf.text = "you find a cigar shop."
            tf.isHidden = false
            findBtn.isHidden = true
            tryBtn.isHidden = true
            umbrellaBox.isHidden = true
            bgImg.image = UIImage(named:"restaurant_umbrella")
        case 1:
            // find sth btn
            tf.text = "find something to rob"
            tf.isHidden = false
            findBtn.isHidden = false
            tryBtn.isHidden = true
            umbrellaBox.isHidden = true
        case 2:
            // to find
            tf.isHidden = true
            findBtn.isHidden = true
            tryBtn.isHidden = true
            umbrellaBox.isHidden = false
        case 3:
            // found and end lines
            tf.text = "found"
            bgImg.image = UIImage(named:"restaurant_dark")
            tf.isHidden = false
            findBtn.isHidden = true
            tryBtn.isHidden = false
            umbrellaBox.isHidden = true
        default:
            // do nothing
            break
        }
    }
    
    @IBAction func findPressed(_ sender: UIButton) {
        stage = 2
        gotoStage()
    }
    
    @IBAction func umbFound(_ sender: UIButton) {
        stage = 3
        gotoStage()
    }
    
    @IBAction func tfPressed(_ sender: UITapGestureRecognizer) {
        if(stage==0){
            stage = 1
            gotoStage()
        }
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
