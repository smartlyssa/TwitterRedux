//
//  ViewController.swift
//  TwitterRedux
//
//  Created by Lyssa Laudencia on 10/5/15.
//  Copyright © 2015 thegeekgoddess.net. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var menuView: UIView!
    var menuCenter: CGPoint!
    var isOpen: Bool = true
    
    @IBAction func onMenuPan(sender: UIPanGestureRecognizer) {
        
        // Absolute (x,y) coordinates in parent view
        let point = sender.locationInView(view)
        
        // Relative change in (x,y) coordinates from where gesture began.
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            print("Gesture began at: \(point)")
        } else if sender.state == UIGestureRecognizerState.Changed {
            print("Gesture changed at: \(point)")
            
            // closing
            if velocity.x < 0 {
                menuView.center = CGPoint(x: menuCenter.x + translation.x, y: menuCenter.y)
                self.isOpen = false
            } // opening
            else if velocity.x > 0 {
                menuView.center = CGPoint(x: menuCenter.x, y: menuCenter.y)
                self.isOpen = true
            }
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            print("Gesture ended at: \(point)")
//            menuView.center = CGPoint(x: menuCenter.x, y: menuCenter.y)
        }
        
        menuView.layoutIfNeeded()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // original postion
        menuCenter = menuView.center
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

