//
//  StreetDayViewController.swift
//  the Cop and Anthem
//
//  Created by April Zhou on 4/21/19.
//  Copyright © 2019 April Zhou. All rights reserved.
//

import UIKit

class StreetDayViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    let text = ["I left the park and walked out of Madison Square to the place where the great street called Broadway and Fifth Avenue meet.","I stopped at a large and brightly lighted restaurant.","This was where the best food and the best people in the best clothes appeared every evening."]
    var count = -1

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func NextText(_ sender: Any) {
        count = count + 1
        if(count < text.count){
            textLabel.text = text[count]
        }
        else{
            performSegue(withIdentifier: "Segue2", sender: self)
        }
        
        
        
    }
    
    @IBAction func menu(_ sender: Any) {
        performSegue(withIdentifier: "toMenu", sender: self)
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
