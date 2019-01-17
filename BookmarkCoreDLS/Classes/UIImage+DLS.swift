//
//  UIImage+DLS.swift
//  BookmarkCoreDLS
//
//  Created by Murat Yılmaz on 17.01.2019.
//

import UIKit

public extension UIImage {
    
    public static func dlsImageFor(name: String) -> UIImage? {
        
        let bundle = Bundle(for: Dummy.self)
        
        guard let imageBundleURL = bundle.url(forResource: "BookmarkCoreDLS", withExtension: "bundle") else {
            return nil
        }
        
        guard let imageBundle = Bundle(url: imageBundleURL) else {
            fatalError("Cannot find image bundle")
        }
        
        guard let imgPath = imageBundle.path(forResource: name, ofType: "png") else {
            fatalError("Cannot find file in image bundle path")
        }
        
        let image = UIImage(contentsOfFile: imgPath)
        return image
    }
}


