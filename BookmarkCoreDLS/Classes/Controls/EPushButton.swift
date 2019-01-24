//
//  SimplePushView.swift
//  BookmarkMobile
//
//  Created by M. Ensar Baba on 15.01.2019.
//  Copyright © 2019 Bookmark. All rights reserved.
//

import UIKit

public class EPushButton: UIControl {
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 60)
    }
    
    public lazy var titleLabel = ComponentFactory.makeLabel(with: TextStyles.regular)
    public lazy var carretView = UIImageView(image: UIImage.dlsImageFor(name: "carret")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
    
    public var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    public override var isHighlighted: Bool {
        didSet {
            if oldValue != isHighlighted {
                updateAppereance()
            }
        }
    }
    
    public override var isSelected: Bool {
        didSet {
            if oldValue != isEnabled {
                updateAppereance()
            }
        }
    }
    
    public override var isEnabled: Bool {
        didSet {
            if oldValue != isEnabled {
                updateAppereance()
            }
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    private func initialize() {
        backgroundColor = UIColor.white
        layoutMargins = UIEdgeInsets(top: Spacing.small, left: Spacing.small,
                                    bottom: Spacing.small, right: Spacing.small)
        
        carretView.tintColor = Colors.fGreen
        self.addSubview(titleLabel)
        self.addSubview(carretView)
        
        titleLabel.snp.makeConstraints{
            $0.centerY.equalTo(self)
            $0.left.equalTo(self.snp.leftMargin)
        }
        
        carretView.snp.makeConstraints{
            $0.width.height.equalTo(10)
            $0.centerY.equalTo(self)
            $0.right.equalTo(self.snp.rightMargin)
        }
    }
    
    private func updateAppereance() {
        if (isSelected || isHighlighted) && isEnabled {
            UIView.animate(withDuration: 0.15) {
                self.backgroundColor = Colors.fGreen.withAlphaComponent(0.2)
                self.carretView.transform = CGAffineTransform.init(scaleX: 1.4, y: 1.4)
            }
        } else {
            UIView.animate(withDuration: 0.15) {
                self.backgroundColor = UIColor.white
                self.carretView.transform = CGAffineTransform.identity
            }
        }
        
        alpha = isEnabled ? 1 : 0.3
    }
}

