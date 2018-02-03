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
        let environment = Environment()

        if let json = inputTextField.stringValue.json {
            if let context = json as? [String: Any] {
                if let output = try? environment.renderTemplate(string: templateTextField.stringValue, context: context) {
                    outputTextField.stringValue = output
                } else {
                    outputTextField.stringValue = "Couldn't render the template against the provided JSON"
                }
            } else {
                outputTextField.stringValue = "Couldn't cast JSON to [String:Any] Swift type"
            }
        } else {
            outputTextField.stringValue = "Couldn't parse JSON input"
        }
    }
}

extension String {

    var json: AnyObject? {

        let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false)

        if let jsonData = data {
            // Will return an object or nil if JSON decoding fails
            return try? JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
        } else {
            // Lossless conversion of the string was not possible
            return nil
        }
    }
}
