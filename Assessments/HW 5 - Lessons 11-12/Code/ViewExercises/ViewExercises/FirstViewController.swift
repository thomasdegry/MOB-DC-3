//
//  FirstViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FirstViewController: ExerciseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 1"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Create a red box (10px tall, the width of the screen) with a black border on the very top of the screen below the nav bar,
        and a black box with a red border on the very bottom of the screen (same dimensions), above the toolbar.
        
        Use Springs & Struts to lay out these views.
        
        Your view should be in self.exerciseView, not self.view
        */
        
        // INSTRUCTOR SAMPLE SOLN
        let height = CGFloat(10.0)
        let width = self.exerciseView.bounds.width
        
        let redBox = UIView(frame: CGRectMake(0,
            CGRectGetMaxY(self.navigationController!.navigationBar.frame),
            CGRectGetWidth(self.exerciseView.frame),
            height))
        redBox.backgroundColor = UIColor.redColor()
        redBox.layer.borderColor = UIColor.blackColor().CGColor
        redBox.layer.borderWidth = 1
        self.exerciseView.addSubview(redBox)
        
        let blackBox = UIView(frame:
            CGRectMake(
                0,
                CGRectGetMinY(self.toolbar.frame) - height,
                CGRectGetWidth(self.exerciseView.frame),
                height))
        blackBox.backgroundColor = UIColor.blackColor()
        blackBox.layer.borderColor = UIColor.redColor().CGColor
        blackBox.layer.borderWidth = 1
        self.exerciseView.addSubview(blackBox)
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
    
    func next() {
        self.performSegueWithIdentifier("two", sender: nil)
    }
}
