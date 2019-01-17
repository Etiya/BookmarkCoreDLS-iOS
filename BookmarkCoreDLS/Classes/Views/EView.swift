//
//  EView.swift
//  BookmarkCoreDLS_Example
//
//  Created by Murat Yılmaz on 17.01.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public class EView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    internal func commonInit() {
        
    }
}
