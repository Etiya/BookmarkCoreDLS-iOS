//
//  TextStyles.swift
//  BookmarkCoreDLS
//
//  Created by Murat Yılmaz on 14.01.2019.
//

import Foundation

public struct TextStyle {
    public var font: UIFont
    public var color: UIColor
}

// Predefined TextSyles
public enum TextStyles {
    
    /// Roboto-Bold - 44
    public static let title1 = TextStyle(font: FontsManager.fontFor(name: "Roboto-Bold", size: 44), color: Colors.fBlack)
    /// Roboto-Bold - 32
    public static let title2 = TextStyle(font: FontsManager.fontFor(name: "Roboto-Bold", size: 32), color: Colors.fBlack)
    /// Roboto-Medium - 24
    public static let title3 = TextStyle(font: FontsManager.fontFor(name: "Roboto-Medium", size: 24), color: Colors.fBlack)
    /// Roboto-Regular - 19
    public static let large = TextStyle(font: FontsManager.fontFor(name: "Roboto-Regular", size: 19), color: Colors.fGray)
    /// Roboto-Regular - 17
    public static let regular = TextStyle(font: FontsManager.fontFor(name: "Roboto-Regular", size: 17), color: Colors.fGray)
    /// Roboto-Bold - 17
    public static let regular_bold = TextStyle(font: FontsManager.fontFor(name: "Roboto-Bold", size: 17), color: Colors.fBlack)
    /// Roboto-Regular - 14
    public static let small = TextStyle(font: FontsManager.fontFor(name: "Roboto-Regular", size: 14), color: Colors.fGray)
    /// Roboto-Regular - 8
    public static let micro = TextStyle(font: FontsManager.fontFor(name: "Roboto-Regular", size: 8), color: Colors.fGray)
}


