//
//  TextStyles.swift
//  BookmarkCoreDLS
//
//  Created by Murat Yılmaz on 14.01.2019.
//

import Foundation

public class Dummy {}
public let kBundle = "BookmarkCoreDLS.bundle"

public struct TextStyle {
    public let font: UIFont
    public let color: UIColor
}

// Predefined TextSyles
public enum TextStyles {
    public static let title1 = TextStyle(font: FontsManager.fontFor(name: "Roboto-Bold", size: 44), color: Colors.fBlack)
    public static let title2 = TextStyle(font: FontsManager.fontFor(name: "Roboto-Bold", size: 32), color: Colors.fBlack)
    public static let title3 = TextStyle(font: FontsManager.fontFor(name: "Roboto-Medium", size: 24), color: Colors.fBlack)
    public static let large = TextStyle(font: FontsManager.fontFor(name: "Roboto-Regular", size: 19), color: Colors.fGray)
    public static let regular = TextStyle(font: FontsManager.fontFor(name: "Roboto-Regular", size: 17), color: Colors.fGray)
    public static let small = TextStyle(font: FontsManager.fontFor(name: "Roboto-Regular", size: 14), color: Colors.fGray)
    public static let micro = TextStyle(font: FontsManager.fontFor(name: "Roboto-Regular", size: 8), color: Colors.fGray)
}


