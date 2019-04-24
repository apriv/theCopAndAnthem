//
//  ViewController.swift
//  the Cop and Anthem
//
//  Created by April Zhou on 4/20/19.
//  Copyright © 2019 April Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // load all true data
        let defaults = UserDefaults.standard
        var img_bools = defaults.object(forKey: "stored_bool_list") as? [Bool] ?? [true,true,true,true,true,true,true,true,true]
        defaults.set(img_bools, forKey: "stored_bool_list")
    }

    @IBAction func btnPressed(_ sender: UIButton) {
        //create variable
        let defaults = UserDefaults.standard
        // retrieve the stored list from the phone
        var img_bools = defaults.object(forKey: "stored_bool_list") as? [Bool] ?? [false,true,true,true,true,true,true,true,false]
        
        // store the generated game code on the user's phone
        defaults.set(img_bools, forKey: "stored_bool_list")
        
        print("btn Pressed")
        print(img_bools)
    }
    
}

