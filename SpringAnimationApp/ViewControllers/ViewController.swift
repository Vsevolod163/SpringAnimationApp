//
//  ViewController.swift
//  SpringAnimationApp
//
//  Created by Vsevolod Lashin on 02.05.2023.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {

    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    private let shared = DataStorage.shared
    
    @IBOutlet var springView: SpringView!

    @IBAction func runAnimation(_ sender: UIButton) {
        let animation = shared.animations.randomElement()
        let curve = shared.curves.randomElement()
        let force = Float.random(in: 0.0...2.0)
        let duration = Float.random(in: 0.0...2.0)
        let delay = Float.random(in: 0.0...2.0)
        
        
    }
}

