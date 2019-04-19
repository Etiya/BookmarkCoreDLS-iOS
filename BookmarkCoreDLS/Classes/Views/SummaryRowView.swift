//
//  SummaryRowView.swift
//  BookmarkCoreDLS_Example
//
//  Created by Murat Yılmaz on 22.01.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

public class SummaryRowView: EView {
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 60)
    }
    
    public lazy var titleLabel = ComponentFactory.makeLabel(with: TextStyles.regular)
    public lazy var priceLabel = ComponentFactory.makeLabel(with: TextStyles.title3)
    private lazy var stackView = UIStackView()
    
    public override func commonInit() {
        
        addSubview(stackView)
        priceLabel.textAlignment = .right
        priceLabel.setContentHuggingPriority(.required, for: .horizontal)
        priceLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.snp.makeConstraints {
            $0.edges.equalTo(self).inset(Spacing.small)
        }
    }
}
