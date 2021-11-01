//
//  ViewController.swift
//  Music app
//
//  Created by IIFLUSER on 18/10/21.
//

import UIKit
import AVFoundation  /* Audiovisual Foundation Library added the capabilities to allow us to interact with audio hardware*/


class ViewController: UIViewController
{
/*keyword   variable_name       set datatype               */
    var         player:AVAudioPlayer?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cKey(_ sender: UIButton) {
        let pressedButtom: String = sender.currentTitle!
        playSound(pressedButtom: pressedButtom)
    }
    func playSound(pressedButtom: String) {
       
        guard let url = Bundle.main.url(forResource: pressedButtom, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}
