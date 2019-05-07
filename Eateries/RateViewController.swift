//
//  RateViewController.swift
//  Eateries
//
//  Created by Nurtugan on 2/13/19.
//  Copyright © 2019 Nurtugan Nuraly. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {

    @IBOutlet weak var ratingStackView: UIStackView!
    @IBOutlet weak var badButton: UIButton!
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var brilliantButton: UIButton!
    
    var restRate: String?
    
    @IBAction func rateRestaurant(sender: UIButton) {
        switch sender.tag {
        case 0: restRate = "bad"
        case 1: restRate = "good"
        case 2: restRate = "brilliant"
        default: break
        }
        
        performSegue(withIdentifier: "unwindSegueToDVC", sender: sender)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // animation
        
//        UIView.animate(withDuration: 0.4) {
//            self.ratingStackView.transform = CGAffineTransform(scaleX: 1, y: 1)
//        }
        
        let buttonArray = [badButton, goodButton, brilliantButton]
        
        for (index, button) in buttonArray.enumerated() {
            let delay = Double(index) * 0.4
            UIView.animate(withDuration: 0.6, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                button?.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
        
        // ends...
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // animation of rating stack view
//        ratingStackView.transform = CGAffineTransform(scaleX: 0, y: 0)
        badButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        goodButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        brilliantButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        // ends...
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.insertSubview(blurEffectView, at: 1)
        
        // Do any additional setup after loading the view.
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
