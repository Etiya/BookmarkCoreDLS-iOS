//
//  SectionWithSubtitleView.swift
//  BookmarkMobile
//
//  Created by M. Ensar Baba on 15.01.2019.
//  Copyright © 2019 Bookmark. All rights reserved.
//

import UIKit

public class LargeSectionWithSubtitleView: EView {
    
    public lazy var titleLabel = ComponentFactory.makeLabel(with: TextStyles.title3)
    public lazy var subtitleLabel = ComponentFactory.makeLabel(with: TextStyles.regular)
    public lazy var iconView = UIImageView()
    
    public var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    public var subTitle: String? {
        didSet {
            subtitleLabel.text = subTitle
        }
    }
    
    public var iconImage: UIImage? {
        didSet {
            iconView.image = iconImage
        }
    }
    
    public var iconTapHandler: ( () -> Void )? {
        didSet {
            updateIconTapGesture()
        }
    }
    
    private lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleIconTap))
    
    public override func commonInit() {
//        layoutMargins = UIEdgeInsets(top: Spacing.small, left: Spacing.small, bottom: Spacing.small, right: Spacing.small)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.lineBreakMode = .byWordWrapping
        
        let labelSV = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        labelSV.axis = .vertical
        addSubview(labelSV)
        addSubview(iconView)
        
        labelSV.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
            $0.trailing.lessThanOrEqualTo(iconView.snp.leading).offset(-Spacing.base)
        }
        
        iconView.snp.makeConstraints {
            $0.width.height.equalTo(20)
            $0.trailing.equalTo(self.snp.trailing)
            $0.centerY.equalToSuperview()
        }
    }
    
    private func updateIconTapGesture() {
        if iconTapHandler != nil {
            iconView.isUserInteractionEnabled = true
            iconView.addGestureRecognizer(tapGesture)
        } else {
            iconView.isUserInteractionEnabled = false
            iconView.removeGestureRecognizer(tapGesture)
        }
    }
    
    @objc private func handleIconTap() {
        iconTapHandler?()
    }
}

