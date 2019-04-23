//
//  StreetDayViewController.swift
//  the Cop and Anthem
//
//  Created by April Zhou on 4/21/19.
//  Copyright © 2019 April Zhou. All rights reserved.
//

import UIKit

class StreetDayViewController: UIViewController, UITabBarControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set gesture to menu
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        upSwipe.direction = .up
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(upSwipe)

    }
    
    // function used for swipe back to menu 
    @objc func handleSwipe(sender:UISwipeGestureRecognizer){
        if (sender.state == .ended){
            performSegue(withIdentifier: "toTab", sender: self)
        }
    }
    
    
    // if text is touched
    @IBAction func touchText(_ sender: UITapGestureRecognizer) {
        // next text
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
