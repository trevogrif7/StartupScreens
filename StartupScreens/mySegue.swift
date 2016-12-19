//
//  mySegue.swift
//  StartupScreens
//
//  Created by Trevor Griffin on 12/18/16.
//  Copyright © 2016 TREVOR E GRIFFIN. All rights reserved.
//

import UIKit

class mySegue: UIStoryboardSegue {

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
