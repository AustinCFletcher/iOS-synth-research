//
//  ViewController.swift
//  AudioKitSynth
//
//  Created by Austin Fletcher on 3/9/19.
//  Copyright © 2019 Austin Fletcher. All rights reserved.
//

import UIKit
import AudioKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    private let oscillator = AKOscillator()
    
    // MARK: - Actions
    
    @IBAction func frequencySliderChanged(_ sender: UISlider) {
        oscillator.frequency = sender.value * 880.0
    }
    
    
    @IBAction func playTouchStarted(_ sender: Any) {
        oscillator.start()
    }
    
    @IBAction func playTouchEnded(_ sender: Any) {
        oscillator.stop()
    }
    
    
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        oscillator.amplitude = 0.3
        AudioKit.output = oscillator
        
        try? AudioKit.start()
    }


}

