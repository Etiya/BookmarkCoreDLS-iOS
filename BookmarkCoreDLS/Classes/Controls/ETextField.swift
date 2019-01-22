//
//  ETextField.swift
//  BookmarkCoreDLS_Example
//
//  Created by Murat Yılmaz on 22.01.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public class ETextField: UITextField {
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 60)
    }
    
//    private let placeHolderAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: Colors.fGray,
//                                 NSAttributedString.Key.font: TextStyles.regular.font]
    
    private let padding = UIEdgeInsets(top: 0, left: Spacing.tiny, bottom: 0, right: Spacing.tiny)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        tintColor = Colors.fBlack
        font = TextStyles.regular.font
        textColor = Colors.fBlack
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
