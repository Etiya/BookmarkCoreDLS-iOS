//
//  Colors.swift
//  BookmarkCoreDLS
//
//  Created by Murat Yılmaz on 14.01.2019.
//

import Foundation

// Predefined Colors
public enum Colors {
    public static let fGreen = #colorLiteral(red: 0.1294117647, green: 0.8431372549, blue: 0.462745098, alpha: 1)
    public static let fDarkBlue = #colorLiteral(red: 0.1019607843, green: 0.1725490196, blue: 0.2784313725, alpha: 1)
    public static let fBlue = #colorLiteral(red: 0.1960784314, green: 0.3490196078, blue: 0.9333333333, alpha: 1)
    public static let fOrange = #colorLiteral(red: 1, green: 0.6235294118, blue: 0, alpha: 1)
    public static let fBlack = #colorLiteral(red: 0.1294117647, green: 0.1450980392, blue: 0.1607843137, alpha: 1)
    public static let fGray = #colorLiteral(red: 0.4235294118, green: 0.4588235294, blue: 0.4901960784, alpha: 1)
    public static let fLightGray = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.9019607843, alpha: 1)
    public static let fTitle = UIColor(hexString: "#212529")
    public static let fDescription = UIColor(hexString: "#6C757D")
}

fileprivate extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
