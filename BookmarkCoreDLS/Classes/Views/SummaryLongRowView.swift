//
//  SummaryLongRowView.swift
//  BookmarkCoreDLS_Example
//
//  Created by Murat Yılmaz on 22.01.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public class SummaryLongRowView: UIView {
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 80)
    }
    
    private lazy var stackView = UIStackView()
    public lazy var titleLabel = ComponentFactory.makeLabel(with: TextStyles.large)
    public lazy var subtitleLabel = ComponentFactory.makeLabel(with: TextStyles.small)
    public lazy var priceLabel = ComponentFactory.makeLabel(with: TextStyles.title3)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        
        subtitleLabel.numberOfLines = 0
        subtitleLabel.lineBreakMode = .byWordWrapping
        
        priceLabel.textAlignment = .right
        priceLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        
        titleLabel.textStyle?.color = Colors.fBlack
        stackView.axis = .horizontal
        stackView.spacing = Spacing.tiny
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Spacing.small)
        }
        
        let leftSV = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        leftSV.axis = .vertical
        stackView.addArrangedSubview(leftSV)
        stackView.addArrangedSubview(priceLabel)
    }
}
