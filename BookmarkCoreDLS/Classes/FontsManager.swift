//
//  FontsManager.swift
//  BookmarkCoreDLS
//
//  Created by Murat Yılmaz on 15.01.2019.
//

import Foundation

public class FontsManager {
    
    public static let kBundle = "BookmarkCoreDLS.bundle"
    
    /// returns font for given name and size
    ///
    /// - Parameters:
    ///   - name: name of font
    ///   - size: size of font
    /// - Returns: if your custom does'nt exist it will return systemFont for given size
    public static func fontFor(name: String, size: CGFloat) -> UIFont {
        var font = UIFont(name: name, size: size)
        if font == nil && register(name) {
            font = UIFont(name: name, size: size)
        }
        return font ?? UIFont.systemFont(ofSize: size)
    }
    
    /// in order to dynamically register font
    ///
    /// - Parameter fontName: Font name that you want to register
    /// - Returns: return whether success/failure
    private static func register(_ fontName: String) -> Bool {
        let resourceName = "\(kBundle)/\(fontName)"
        let bundle = Bundle(for: Dummy.self)
        guard let url = bundle.url(forResource: resourceName, withExtension: "ttf") else {
            fatalError("Couldn't find font \(fontName)")
        }
        guard let fontDataProvider = CGDataProvider(url: url as CFURL) else {
            fatalError("Couldn't load data from the font \(fontName)")
        }
        
        guard let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        var error: Unmanaged<CFError>?
        let success = CTFontManagerRegisterGraphicsFont(font, &error)
        return success
    }
}
