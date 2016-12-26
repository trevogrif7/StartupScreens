//
//  HelperFunctions.swift
//  My Helper Functions
//
//  Created by Trevor Griffin on 10/12/16.
//  Copyright © 2016 TREVOR E GRIFFIN. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    // Make UIView item fade in
    func fadeInView(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1
        })
    }
    
    // Make UIView item fade out
    func fadeOutView(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
        })
    }
    
    // Make UIView's background shift between three colors
    func animateBackgroundColor(iterations: Int, color1: UIColor = UIColor.lightGray, color2: UIColor = UIColor.gray, color3: UIColor = UIColor.darkGray) {
        
        // Iterator
        var iter = iterations
        
        // Animate background color transition. Recursivley call the
        // function infinitely.
        UIView.animate(withDuration: 0.8, delay: 0, options: [.allowUserInteraction], animations: {
            self.backgroundColor = color1
        }, completion: { (Bool)  in
            
            UIView.animate(withDuration: 0.8, delay: 0, options: [.allowUserInteraction], animations: {
                self.backgroundColor = color2
            }, completion: { (Bool) in
                
                UIView.animate(withDuration: 0.8, delay: 0, options: [.allowUserInteraction], animations: {
                    self.backgroundColor = color3
                }, completion: { (Bool) in
                    if iter == -1 {
                        
                        // A "-1" value for iteration will cause the animation to keep excuting forever
                        self.animateBackgroundColor(iterations: -1, color1: color1, color2: color2, color3: color3)
                    }
                    else if iter > 0
                    {
                        // Subtract 1 iterations
                        iter -= 1
                        
                        // Recursive call
                        self.animateBackgroundColor(iterations: iter, color1: color1, color2: color2, color3: color3)
                    }
                    
                })
            })
        })
    }
    
}

class zoomSegue: UIStoryboardSegue {
    
    override func perform() {
        zoom()
    }
    
    func zoom () {
        let currentViewController = self.source
        let nextViewController = self.destination
        
        let container = currentViewController.view.superview
        
        nextViewController.view.center = currentViewController.view.center
        nextViewController.view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        container?.addSubview(nextViewController.view)
        
        UIView.animate(withDuration: 0.3, animations: {
            nextViewController.view.transform = CGAffineTransform.identity
        }) { (complete) in
            currentViewController.present(nextViewController, animated: false, completion: nil)
        }
        
    }
    
}


