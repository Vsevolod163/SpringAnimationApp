//
//  ViewController.swift
//  SpringAnimationApp
//
//  Created by Vsevolod Lashin on 02.05.2023.
//

import UIKit
import SpringAnimation

final class MainViewController: UIViewController {

    @IBOutlet private var presetLabel: UILabel!
    @IBOutlet private var curveLabel: UILabel!
    @IBOutlet private var forceLabel: UILabel!
    @IBOutlet private var durationLabel: UILabel!
    @IBOutlet private var delayLabel: UILabel!
    
    @IBOutlet private var springView: SpringView!
    
    private let shared = DataStorage.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let animation = shared.animations.randomElement() ?? ""
        setUI(animation)
    }
    
    @IBAction private func runAnimation(_ sender: SpringButton) {
        sender.animation = "fadeIn"
        sender.duration = 3
        sender.animate()
        
        if shared.animation == "" {
            springView.animate()
            
            let animation = shared.animations.randomElement() ?? ""
            sender.setTitle("Run \(animation)", for: .normal)
            shared.animation = animation
        } else {
            var animation = shared.animation
            setUI(animation)
            
            animation = shared.animations.randomElement() ?? ""
            shared.animation = animation

            sender.setTitle("Run \(animation)", for: .normal)
            springView.animate()
        }
    }
    
    private func setUI(_ animation: String) {
        let curve = shared.curves.randomElement()
        let force = Float.random(in: 0.1...2.0)
        let duration = Float.random(in: 0.1...2.0)
        let delay = Float.random(in: 0.1...2.0)
        
        presetLabel.text = "preset: \(animation)"
        curveLabel.text = "curve: \(curve ?? "")"
        forceLabel.text = "force: \(String(format: "%.2f", force))"
        durationLabel.text = "duration: \(String(format: "%.2f", duration))"
        delayLabel.text = "delay: \(String(format: "%.2f", delay))"
        
        springView.animation = animation
        springView.curve = curve ?? ""
        springView.force = CGFloat(force)
        springView.duration = CGFloat(duration)
        springView.delay = CGFloat(delay)
    }
}

