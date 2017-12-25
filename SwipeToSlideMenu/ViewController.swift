//
//  ViewController.swift
//  SwipeToSlideMenu
//
//  Created by Alexander Yakovenko on 12/25/17.
//  Copyright © 2017 Alexander Yakovenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBOutlet weak var sideView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add clipToBounds for blurView in Atribute Inspector
        blurView.layer.cornerRadius = 15
        sideView.layer.shadowColor = UIColor.black.cgColor
        sideView.layer.shadowOpacity = 0.8
        sideView.layer.shadowOffset = CGSize(width: 5, height: 0)
        
        // hide side Menu
        viewConstraint.constant = -175
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func penPerform(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .began || sender.state == .changed {
            
            //translation - length linie of gest (when we work swipe)
            let translation = sender.translation(in: self.view).x
            if translation > 0 {
                // swipe right
                if viewConstraint.constant < 20 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.viewConstraint.constant += translation / 10
                        self.view.layoutIfNeeded()
                    })
                    
                }
                
                self.viewConstraint.constant += translation
            } else {
                // swipe left
                if viewConstraint.constant > -175 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.viewConstraint.constant += translation / 10
                        self.view.layoutIfNeeded()
                    })
                    
                }
            }
            
        } else if sender.state == .ended {
            
            if viewConstraint.constant < -100 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.viewConstraint.constant = -175
                    self.view.layoutIfNeeded()
                })
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.viewConstraint.constant = 0
                    self.view.layoutIfNeeded()
                })
            }
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

