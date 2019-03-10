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
    private var soundSource: AKNode = AKOscillator()
    private var env = AKAmplitudeEnvelope(AKOscillator())
    
    
    // MARK: - Actions
    
    @IBAction func frequencySliderChanged(_ sender: UISlider) {
        oscillator.frequency = sender.value * 880.0
    }
    
    
    @IBAction func playTouchStarted(_ sender: Any) {
        oscillator.start()
    }
    
    @IBAction func playTouchEnded(_ sender: Any) {
        oscillator.stop()
//        toggleOscillator()
    }
    
    private func toggleOscillator() {
        if oscillator.isStarted { oscillator.stop() }
        else { oscillator.start() }
    }
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configureOscillator()
        
        env = applyEnvelope(osc: oscillator)
        AudioKit.output = env
        
        try? AudioKit.start()
    }
    
    private func configureOscillator() {
        oscillator.amplitude = 0.3
        oscillator.rampDuration = 0.6
    }
    
    private func applyEnvelope(osc: AKOscillator) -> AKAmplitudeEnvelope {
        let envelope = AKAmplitudeEnvelope(osc)
        envelope.attackDuration = 0.1
        envelope.decayDuration = 0.1
        envelope.sustainLevel = 0.1
        envelope.releaseDuration = 0.3
        return envelope
    }


}

