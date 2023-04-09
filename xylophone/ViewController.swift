//
//  ViewController.swift
//  xylophone
//
//  Created by Kovs on 09.04.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
        // new AVAudio player

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        
        //print(sender.currentTitle)
        playSound(soundName: sender.currentTitle!)
        // ! means it will always have a title
        
        sender.alpha = 0.5
        // lower the opacity by half
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            // brings back the last opacity to the button:
            sender.alpha = 1.0
        }
    }
    
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        // get audio
        player = try! AVAudioPlayer(contentsOf: url!)
        // put file into player
        player.play()
        // play the sound
    }
}

