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
    }

    @IBAction func NextScene(_ sender: Any) {
        performSegue(withIdentifier: "Segue1", sender: self)
    }
    
}

