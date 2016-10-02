//
//  HLSignalView.swift
//  Signal View
//
//  Created by Herman on 2016/8/1.
//  Copyright © 2016年 Herman Liang. All rights reserved.
//

import UIKit

#if swift(>=3.0)
@IBDesignable
open class HLSignalView: UIView {

    fileprivate var _intensity: Int = 0
    fileprivate var _colorInactive: UIColor = UIColor.gray
    fileprivate var _colorActive: UIColor = UIColor.purple
    
    @IBInspectable open var intensity: Int {
        get {
            return _intensity
        }
        set (newValue) {
            _intensity = newValue
            setNeedsDisplay()
        }
    }
    
    @IBInspectable open var colorInactive: UIColor {
        get {
            return _colorInactive
        }
        set (newValue) {
            _colorInactive = newValue
            setNeedsDisplay()
        }
    }
    
    @IBInspectable open var colorActive: UIColor {
        get {
            return _colorActive
        }
        set (newValue) {
            _colorActive = newValue
            setNeedsDisplay()
        }
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override open func draw(_ rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        let myFrame = self.bounds
        let width = myFrame.size.width
        let height = myFrame.size.height
        let rectWidth = width * 0.16
        let hInterval = width * 0.02
        let vInterval = height * 0.2
        let offsetX = -rectWidth - hInterval * 2
        
        self.intensity = self.intensity > 5 ? 5 : self.intensity
        self.intensity = self.intensity < 0 ? 0 : self.intensity
        
        if (self.intensity < 5) {
            context?.setFillColor(colorInactive.cgColor)
        } else {
            context?.setFillColor(colorActive.cgColor)
        }
        
        var rect1: CGRect
        rect1 = CGRect(x: 0, y: 0, width: rectWidth, height: height)
        rect1 = rect1.offsetBy(dx: width + offsetX + hInterval, dy: 0)
        UIRectFill(rect1)
        
        for i in 1...4 {
            if (self.intensity < (5 - i)) {
                context?.setFillColor(colorInactive.cgColor)
            } else {
                context?.setFillColor(colorActive.cgColor)
            }
            
            rect1 = rect1.offsetBy(dx: offsetX, dy: vInterval)
            UIRectFill(rect1)
        }
        
    }
}
#else
@IBDesignable
public class HLSignalView: UIView {
    
    private var _intensity: Int = 0
    private var _colorInactive: UIColor = UIColor.grayColor()
    private var _colorActive: UIColor = UIColor.purpleColor()
    
    @IBInspectable public var intensity: Int {
        get {
            return _intensity
        }
        set (newValue) {
            _intensity = newValue
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var colorInactive: UIColor {
        get {
            return _colorInactive
        }
        set (newValue) {
            _colorInactive = newValue
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var colorActive: UIColor {
        get {
            return _colorActive
        }
        set (newValue) {
            _colorActive = newValue
            setNeedsDisplay()
        }
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override public func drawRect(rect: CGRect) {
        // Drawing code
        if let context = UIGraphicsGetCurrentContext() {
            let myFrame = self.bounds
            let width = myFrame.size.width
            let height = myFrame.size.height
            let rectWidth = width * 0.16
            let hInterval = width * 0.02
            let vInterval = height * 0.2
            let offsetX = -rectWidth - hInterval * 2
            
            self.intensity = self.intensity > 5 ? 5 : self.intensity
            self.intensity = self.intensity < 0 ? 0 : self.intensity
            
            if (self.intensity < 5) {
                CGContextSetFillColorWithColor(context, colorInactive.CGColor)
            } else {
                CGContextSetFillColorWithColor(context, colorActive.CGColor)
            }
            
            var rect1: CGRect
            rect1 = CGRectMake(0, 0, rectWidth, height)
            rect1 = CGRectOffset(rect1, width + offsetX + hInterval, 0)
            UIRectFill(rect1)
            
            for i in 1...4 {
                if (self.intensity < (5 - i)) {
                    CGContextSetFillColorWithColor(context, colorInactive.CGColor)
                } else {
                    CGContextSetFillColorWithColor(context, colorActive.CGColor)
                }
                
                rect1 = CGRectOffset(rect1, offsetX, vInterval)
                UIRectFill(rect1)
            }
        }
    }
}

#endif
