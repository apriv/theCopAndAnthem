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
    
    var music:AVAudioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        let AssortedMusics = Bundle.main.path(forResource: " OldThreads", ofType: ".mp3")
        music = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: AssortedMusics!))
        music.prepareToPlay()
        music.numberOfLoops = -1
        music.play()
    }

    @IBAction func NextScene(_ sender: Any) {
        performSegue(withIdentifier: "Segue1", sender: self)
    }
    
}

