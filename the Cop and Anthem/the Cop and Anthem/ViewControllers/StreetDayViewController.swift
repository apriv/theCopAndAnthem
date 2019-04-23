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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        tabBarController?.selectedIndex=1
        
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
