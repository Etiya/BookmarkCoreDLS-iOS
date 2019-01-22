//
//  SelectablePriceCell.swift
//  BookmarkCoreDLS_Example
//
//  Created by Murat Yılmaz on 22.01.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public class SelectablePriceCell: UITableViewCell {
    
    private lazy var checkbox = ComponentFactory.makeCheckbox()
    public lazy var titleLabel = ComponentFactory.makeLabel(with: TextStyles.large)
    public lazy var priceLabel = ComponentFactory.makeLabel(with: TextStyles.title3)
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        checkbox.isChecked = selected
    }
    
    private func commonInit() {
        checkbox.isEnabled = false
        priceLabel.textAlignment = .right
        selectionStyle = .none
        contentView.addSubview(checkbox)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        
        checkbox.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(Spacing.small)
            $0.width.height.equalTo(20)
        }
        
        titleLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: UILayoutPriority.defaultHigh.rawValue - 1), for: NSLayoutConstraint.Axis.horizontal)
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(checkbox.snp.trailing).offset(Spacing.tiny)
            $0.centerY.equalTo(checkbox)
        }
        
        priceLabel.snp.makeConstraints {
            $0.trailing.equalTo(self).offset(-Spacing.small)
            $0.centerY.equalTo(titleLabel)
            $0.leading.greaterThanOrEqualTo(titleLabel.snp.trailing).offset(8)
        }
    }
}
