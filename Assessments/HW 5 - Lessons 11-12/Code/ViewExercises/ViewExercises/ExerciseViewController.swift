//
//  ExerciseViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController {
    let exerciseView = UIView()
    let exerciseDescription = UILabel()
    var toolbar = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.exerciseDescription.frame = self.view.frame
        self.exerciseDescription.numberOfLines = 0
        self.exerciseDescription.frame = self.view.frame
        self.exerciseDescription.textAlignment = NSTextAlignment.Center
        self.exerciseDescription.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        self.view.addSubview(self.exerciseDescription)
        
        self.exerciseView.frame = self.view.frame
        self.exerciseView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        self.exerciseView.alpha = 0.0
        self.exerciseView.hidden = true
        self.exerciseView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(exerciseView)
        
        self.toolbar.frame = CGRect(x: 0, y: CGRectGetMaxY(self.view.frame) - 44, width: CGRectGetWidth(self.view.frame), height: 44)
        self.view.addSubview(toolbar)
        toolbar.autoresizingMask = UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleWidth
        toolbar.setItems(
            [UIBarButtonItem(
                barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace,
                target: nil,
                action: nil
                ),
                UIBarButtonItem(
                    title: "Flip Views",
                    style: UIBarButtonItemStyle.Plain,
                    target: self,
                    action: "didTapFlip"
                )],
            animated: false
        )
    }
    
    func didTapFlip() {
        UIView.animateWithDuration(0.3,
            animations: { () -> Void in
                if self.exerciseView.hidden {
                    self.exerciseView.hidden = false
                }
                self.exerciseView.alpha = self.exerciseView.alpha == 0.0 ? 1.0 : 0.0
            },
            completion: { (success) -> Void in
                self.exerciseView.hidden = self.exerciseView.alpha == 0.0
        })
    }
}

