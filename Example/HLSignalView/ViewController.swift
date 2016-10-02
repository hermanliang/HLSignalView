//
//  ViewController.swift
//  HLSignalView
//
//  Created by Herman Liang on 08/01/2016.
//  Copyright (c) 2016 Herman Liang. All rights reserved.
//

import UIKit
import HLSignalView

class ViewController: UIViewController {

    @IBOutlet weak var signalView: HLSignalView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onValueChanged(_ sender: UIStepper) {
        self.signalView.intensity = Int(sender.value)
    }
    
    @IBAction func color1(_ sender: AnyObject) {
        self.signalView.colorInactive = UIColor.lightGray
    }

    @IBAction func color2(_ sender: AnyObject) {
        self.signalView.colorInactive = UIColor.gray
    }
    
    @IBAction func color3(_ sender: AnyObject) {
        self.signalView.colorActive = UIColor.blue
    }
    
    @IBAction func color4(_ sender: AnyObject) {
        self.signalView.colorActive = UIColor.purple
    }
    
    
}

