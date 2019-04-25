//
//  StreetDayViewController.swift
//  the Cop and Anthem
//
//  Created by April Zhou on 4/21/19.
//  Copyright © 2019 April Zhou. All rights reserved.
//

import UIKit

class StreetDayViewController: UIViewController, UITabBarControllerDelegate {
    
    var stage = 0 // to control stage
    var count = 0
    let text = ["A dead leaf fell in Soapy's lap. That was Jack Frost's card.",
                "This is a sign that winter is coming",
                "You used to live on the bench at Madison square, but now, you need another place to stay.",
                "Three months on the Island was what his soul craved. ",
                "Three months of assured board and bed and congenial company, safe from Boreas and bluecoats, seemed to you the essence of things desirable.",
                "You come to the street.",
                "There are many ways of doing this so that cop arrrest you to the jail."]
    lazy var size = text.count
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var tf: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set gesture to menu
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        upSwipe.direction = .up
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(upSwipe)
        
        // go to stage 0
        gotoStage()
    }
    
    // do stuff accoring int stage
    func gotoStage(){
        switch stage{
        case 0:
            // hide choices
            self.choice1.isHidden = true
            self.choice2.isHidden = true
            tf.text = text[count]
        case 1:
            // show choices
            self.choice1.isHidden = false
            choice1.setTitle("try something", for: .normal)
            //self.choice2.isHidden = false
            tf.text = text[count]
            
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
    
    @IBAction func tapText(_ sender: UITapGestureRecognizer) {
        if (count<size-1){
            count = count+1
        }
        else{
            stage = 1
        }
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
