//
//  DropdownButton.swift
//  BookmarkCoreDLS_Example
//
//  Created by Murat Yılmaz on 20.02.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public class DropdownButton: UIControl {
    
    public lazy var titleLabel = ComponentFactory.makeLabel(with: TextStyles.small)
    public lazy var carretView = UIImageView(image: UIImage.dlsImageFor(name: "carret")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override public var isHighlighted: Bool {
        didSet {
            if oldValue != isHighlighted {
                self.updateAppereance()
            }
        }
    }
    
    private func commonInit() {
        
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        
        carretView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        carretView.tintColor = Colors.fGreen
        addSubview(titleLabel)
        addSubview(carretView)
        
        titleLabel.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(self.snp.leading)
            $0.trailing.equalTo(carretView.snp.leading).offset(-Spacing.tiny)
        }
        
        carretView.snp.makeConstraints{
            $0.size.equalTo(10)
            $0.centerY.equalTo(self)
            $0.trailing.equalTo(self.snp.trailing)
        }
    }
    
    private func updateAppereance() {
        if isHighlighted && isEnabled {
            backgroundColor = Colors.fGray.withAlphaComponent(0.1)
        } else {
            backgroundColor = UIColor.white
        }
    }
}
