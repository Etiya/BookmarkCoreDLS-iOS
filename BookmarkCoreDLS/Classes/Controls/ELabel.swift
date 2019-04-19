//
//  ELabel.swift
//  BookmarkCoreDLS_Example
//
//  Created by Murat Yılmaz on 15.01.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//
import UIKit

public class ELabel: UILabel {
    public var textStyle: TextStyle? {
        didSet {
            textColor = textStyle?.color
            font = textStyle?.font
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
