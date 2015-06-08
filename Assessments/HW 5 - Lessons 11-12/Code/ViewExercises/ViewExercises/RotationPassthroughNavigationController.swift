//
//  RotationPassthroughNavigationController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/11/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class RotationPassthroughNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func shouldAutorotate() -> Bool {
        return self.visibleViewController.shouldAutorotate()
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return self.visibleViewController.supportedInterfaceOrientations()
    }
}
