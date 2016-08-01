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
    
    @IBAction func onValueChanged(sender: UIStepper) {
        self.signalView.intensity = Int(sender.value)
    }
    
    @IBAction func color1(sender: AnyObject) {
        self.signalView.colorInactive = UIColor.lightGrayColor()
    }

    @IBAction func color2(sender: AnyObject) {
        self.signalView.colorInactive = UIColor.grayColor()
    }
    
    @IBAction func color3(sender: AnyObject) {
        self.signalView.colorActive = UIColor.blueColor()
    }
    
    @IBAction func color4(sender: AnyObject) {
        self.signalView.colorActive = UIColor.purpleColor()
    }
    
    
}

