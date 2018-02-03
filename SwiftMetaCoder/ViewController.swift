//
//  ViewController.swift
//  SwiftMetaCoder
//
//  Created by Shaheen Ghiassy on 2/3/18.
//  Copyright © 2018 Shaheen Ghiassy. All rights reserved.
//

import Cocoa
import Stencil
import StencilSwiftKit

class ViewController: NSViewController {

    @IBOutlet weak var inputTextField: NSTextField!
    @IBOutlet weak var templateTextField: NSTextField!
    @IBOutlet weak var outputTextField: NSTextField!


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
        print("Input Field: \(inputTextField.stringValue)")
        print("Template Field: \(templateTextField.stringValue)")
        let environment = Environment()

        let context = ["name": "Shaheen"]
        let output = try? environment.renderTemplate(string: "Hello {{ name }}", context: context)
        print("Output Field: \(output ?? "fail")")
    }

}

