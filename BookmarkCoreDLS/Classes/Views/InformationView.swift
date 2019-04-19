//
//  InformationView.swift
//  BookmarkMobile
//
//  Created by M. Ensar Baba on 15.01.2019.
//  Copyright © 2019 Bookmark. All rights reserved.
//

import UIKit

public class InformationView: EView {
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 80)
    }
    
    public lazy var titleLabel = ComponentFactory.makeLabel(with: TextStyles.large)
    public lazy var detailLabel = ComponentFactory.makeLabel(with: TextStyles.small)
    
    public var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    public var detailText: String? {
        didSet {
            detailLabel.text = detailText
        }
    }
    
    public override func commonInit() {
        layoutMargins = UIEdgeInsets(top: Spacing.small, left: Spacing.small, bottom: Spacing.small, right: Spacing.small)
        let containerView = UIView()
        addSubview(containerView)
        containerView.snp.makeConstraints { $0.edges.equalTo(self.snp.margins) }
        containerView.addSubview(titleLabel)
        containerView.addSubview(detailLabel)
        
        titleLabel.snp.makeConstraints({ (make) in
            make.centerY.leading.equalToSuperview()
        })
        
        detailLabel.snp.makeConstraints({ (make) in
            make.trailing.centerY.equalToSuperview()
        })
    }
    
}

