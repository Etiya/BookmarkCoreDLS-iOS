//
//  LargePriceView.swift
//  BookmarkMobile
//
//  Created by M. Ensar Baba on 15.01.2019.
//  Copyright © 2019 Bookmark. All rights reserved.
//

import UIKit

public class LargePriceView: EView {
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 80)
    }
    
    public lazy var titleLabel = ComponentFactory.makeLabel(with: TextStyles.large)
    public lazy var largePriceLabel = ComponentFactory.makeLabel(with: TextStyles.title2)
    
    public var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    public var priceText: String? {
        didSet {
            largePriceLabel.text = priceText
        }
    }
    
    public override func commonInit() {
        largePriceLabel.textStyle?.color = Colors.fBlue
        layoutMargins = UIEdgeInsets(top: Spacing.small, left: Spacing.small, bottom: Spacing.small, right: Spacing.small)
        let containerView = UIView()
        addSubview(containerView)
        containerView.snp.makeConstraints { $0.edges.equalTo(self.snp.margins) }
        containerView.addSubview(titleLabel)
        containerView.addSubview(largePriceLabel)
        
        titleLabel.snp.makeConstraints({ (make) in
            make.centerY.leading.equalToSuperview()
        })
        
        largePriceLabel.snp.makeConstraints({ (make) in
            make.centerY.trailing.equalToSuperview()
        })
    }
    
}

