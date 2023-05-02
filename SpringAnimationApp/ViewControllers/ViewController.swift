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
    
    @IBOutlet var springView: SpringView!
    
    private let shared = DataStorage.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let animation = shared.animations.randomElement() ?? ""
        setUI(animation)
    }
    
    @IBAction func runAnimation(_ sender: UIButton) {
        if sender.currentTitle == "Run" {
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
        
        presetLabel.text = animation
        curveLabel.text = curve
        forceLabel.text = String(force)
        durationLabel.text = String(duration)
        delayLabel.text = String(delay)
        
        springView.animation = animation
        springView.curve = curve ?? ""
        springView.force = CGFloat(force)
        springView.duration = CGFloat(duration)
        springView.delay = CGFloat(delay)
    }
}

