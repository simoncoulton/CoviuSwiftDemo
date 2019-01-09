//
//  ViewController.swift
//  CoviuSwiftDemo
//
//  Created by Nathan Oehlman on 8/1/19.
//  Copyright © 2019 Coviu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let coviuView = CoviuSDKiOS();

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the Coviu View to point at your desired URL, and display
        coviuView.addCoviuView(view, withURL: "https://coviu.com/sign_in");
    }

    // Hide the status bar, as Coviu is designed to work full screen
    override var prefersStatusBarHidden: Bool {
        return true
    }

}

