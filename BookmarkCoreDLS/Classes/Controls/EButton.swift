//
//  File.swift
//  BookmarkMobile
//
//  Created by Murat Yılmaz on 13.11.2018.
//  Copyright © 2018 Bookmark. All rights reserved.
//

import UIKit

@IBDesignable
public class EButton: UIButton {
    
    public typealias TapHandler = (() -> Void)
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            super.setNeedsLayout()
        }
    }
    
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            super.setNeedsLayout()
        }
    }
    
    @IBInspectable public var borderColorHighlighted: UIColor = UIColor.clear {
        didSet {
            super.setNeedsLayout()
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            super.setNeedsLayout()
        }
    }
    
    @IBInspectable public var normalBackgroundColor: UIColor = UIColor.clear {
        didSet {
            self.setBackgroundColor(color: normalBackgroundColor, forUIControlState: .normal)
        }
    }
    
    @IBInspectable public var highlightedBackgroundColor: UIColor = UIColor.clear {
        didSet {
            self.setBackgroundColor(color: highlightedBackgroundColor, forUIControlState: .highlighted)
        }
    }
    
    @IBInspectable public var disabledBackgroundColor: UIColor = UIColor.clear {
        didSet {
            self.setBackgroundColor(color: disabledBackgroundColor, forUIControlState: .disabled)
        }
    }
    
    @IBInspectable public var selectedBackgroundColor: UIColor = UIColor.clear {
        didSet {
            self.setBackgroundColor(color: selectedBackgroundColor, forUIControlState: .selected)
        }
    }
    
    public var tapHandler: TapHandler? {
        didSet {
            self.removeTarget(self, action: #selector(tap), for: .touchUpInside)
            guard tapHandler != nil else { return }
            self.addTarget(self, action: #selector(tap), for: .touchUpInside)
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
//    public override var intrinsicContentSize: CGSize {
//        return CGSize(width: UIView.noIntrinsicMetric, height: 50)
//    }
//    
    @objc private func tap() { self.tapHandler?() }
    
    private func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius == 0.0 ? bounds.height / 2 : cornerRadius
        layer.borderColor = isHighlighted ? borderColorHighlighted.cgColor : borderColor.cgColor
        layer.borderWidth = borderWidth
    }
    
    private func imageWithColor(color: UIColor?) -> UIImage? {
        guard let color = color else { return nil }
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    private func setBackgroundColor(color: UIColor?, forUIControlState state: UIControl.State) {
        self.setBackgroundImage(imageWithColor(color: color), for: state)
    }
}
