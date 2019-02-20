//
//  SectionView.swift
//  BookmarkMobile
//
//  Created by M. Ensar Baba on 18.01.2019.
//  Copyright © 2019 Bookmark. All rights reserved.
//
import UIKit

public class LargeSectionView: UIView {
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 60)
    }
    
    public lazy var titleLabel = ComponentFactory.makeLabel(with: TextStyles.title3)
    
    public var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    private func initialize() {
//        layoutMargins = UIEdgeInsets(top: Spacing.small, left: Spacing.small, bottom: Spacing.small, right: Spacing.small)
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
        })
    }
    
}
