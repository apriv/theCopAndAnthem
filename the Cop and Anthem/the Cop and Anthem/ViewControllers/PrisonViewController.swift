//
//  PrisonViewController.swift
//  the Cop and Anthem
//
//  Created by April Zhou on 4/22/19.
//  Copyright © 2019 April Zhou. All rights reserved.
//

import UIKit
import AVFoundation

class PrisonViewController: UIViewController {
    var stage = 0
    @IBOutlet weak var tf: UITextView!
    @IBOutlet weak var enjoy: UIButton!
    let AssortedMusics = Bundle.main.path(forResource: " OldThreads", ofType: ".mp3")
    var music = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add Background Music
        music = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: AssortedMusics!))
        
        print(self.music.isPlaying)
        music.prepareToPlay()
        music.numberOfLoops = -1
        music.play()
        // Set gesture to menu
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        upSwipe.direction = .up
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(upSwipe)
        
        // store data
        let defaults = UserDefaults.standard
        var img_bools = defaults.object(forKey: "stored_bool_list") as? [Bool] ?? [false,true,true,true,true,true,true,true,true]
        img_bools[8] = false
        defaults.set(img_bools, forKey: "stored_bool_list")
        
        gotoStage()
    }
    //
    
    // do stuff accoring int stage
    func gotoStage(){
        switch stage{
        case 0:
            // hide choices
            self.enjoy.isHidden = false
            tf.text = "You ended up with 3 month in jail on an island. Your dream finally come true. But you just changed your mind 30 sec ago."
        case 1:
            // show choices
            
            tf.text = "2nd text"
            
        default:
            // do nothing
            break
        }
    }
    
    @IBAction func enjoyPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toMenu", sender: self)
        music.stop()
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
