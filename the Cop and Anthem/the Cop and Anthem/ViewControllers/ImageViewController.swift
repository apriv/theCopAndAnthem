//
//  ImageViewController.swift
//  the Cop and Anthem
//
//  Created by Muzhen Li on 4/24/19.
//  Copyright © 2019 April Zhou. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var img0: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    @IBOutlet weak var img7: UIImageView!
    @IBOutlet weak var img8: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshImg()
    }
    
    func refreshImg(){
        let defaults = UserDefaults.standard
        var img_bools = defaults.object(forKey: "stored_bool_list") as? [Bool] ?? [true,true,true,true,true,true,true,true,true]
        defaults.set(img_bools, forKey: "stored_bool_list")
        img_bools[0] = false
        
        print(img_bools)
        
        // load or hide img
        self.img0.isHidden = img_bools[0]
        self.img1.isHidden = img_bools[1]
        self.img2.isHidden = img_bools[2]
        self.img3.isHidden = img_bools[3]
        self.img4.isHidden = img_bools[4]
        self.img5.isHidden = img_bools[5]
        self.img6.isHidden = img_bools[6]
        self.img7.isHidden = img_bools[7]
        self.img8.isHidden = img_bools[8]
        img0.isUserInteractionEnabled = true
        img1.isUserInteractionEnabled = true
        img7.isUserInteractionEnabled = true
    }
    
    
    @IBAction func toStreet(_ sender: Any) {
        print(1)
        performSegue(withIdentifier: "to0", sender: self)
    }
    
    @IBAction func toRestaurant(_ sender: Any) {
        performSegue(withIdentifier: "to1", sender: self)
    }
    
    @IBAction func toCathedral(_ sender: Any) {
        performSegue(withIdentifier: "to7", sender: self)
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
