//
//  ELabel.swift
//  BookmarkCoreDLS_Example
//
//  Created by Murat Yılmaz on 15.01.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

public class ELabel: UILabel {
    public var textStyle: TextStyle? {
        didSet {
            textColor = textStyle?.color
            font = textStyle?.font
        }
    }
}
