//
//  SoundManager.swift
//  MatchCardiOS
//
//  Created by ben on 19/09/2019.
//  Copyright © 2019 ben. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
   static var audioPlayer: AVAudioPlayer?
    
    enum SoundEffect {
        case flip
        case shuffle
        case match
        case nomatch
    }
    
    //static because there's no point in creating this object
    //because only this method will be called, we won't be storing any data in it
  static func playSound(_ effect: SoundEffect) {
        var soundFileName = ""
        
        switch effect {
            case .flip:
                soundFileName = "cardflip"
                
            case .shuffle:
                soundFileName = "shuffle"
            case .match:
                soundFileName = "dingcorrect"
            case .nomatch:
                soundFileName = "dingwrong"
        }
        //path to the sound file
        let bundlepath = Bundle.main.path(forResource: soundFileName, ofType: "wav")
        guard bundlepath != nil else {
            print("Sound file not found")
            return
        }
        
        //create url obj from this path
        let soundURL = URL(fileURLWithPath: bundlepath!)
        
        //create the play and play the sound
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
            
        } catch {
            print("Could not create AVAudioPlayer object!")
        }
    }
}
