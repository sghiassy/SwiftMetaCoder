//
//  ViewController.swift
//  SwiftMetaCoder
//
//  Created by Shaheen Ghiassy on 2/3/18.
//  Copyright © 2018 Shaheen Ghiassy. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func userPressedDone(_ sender: NSButton) {
        print("done")
    }

}

