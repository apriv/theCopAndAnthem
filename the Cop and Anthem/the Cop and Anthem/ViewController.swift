//
//  ViewController.swift
//  the Cop and Anthem
//
//  Created by April Zhou on 4/20/19.
//  Copyright © 2019 April Zhou. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load all true data
        let defaults = UserDefaults.standard
        var img_bools = defaults.object(forKey: "stored_bool_list") as? [Bool] ?? [false,true,true,true,true,true,true,true,true]
        defaults.set(img_bools, forKey: "stored_bool_list")
    }
    
}

