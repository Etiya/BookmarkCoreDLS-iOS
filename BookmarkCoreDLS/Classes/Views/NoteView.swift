//
//  NoteView.swift
//  BookmarkCoreDLS_Example
//
//  Created by Murat Yılmaz on 17.01.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public class NoteView: EView {
    
    public lazy var label = ELabel()
    private lazy var mainSV = UIStackView()
    private lazy var iconView = UIImageView()
    
    
    /// Icon for your note
    public var icon: UIImage? {
        didSet {
            iconView.image = icon
            addIconViewIfNeeded()
        }
    }
    
    /// Tint color for your icon. Default color is fOrange
    public var iconTintColor: UIColor = Colors.fOrange {
        didSet {
            iconView.tintColor = iconTintColor
        }
    }
    
    private func addIconViewIfNeeded() {
        if !mainSV.arrangedSubviews.contains(iconView) {
            mainSV.insertArrangedSubview(iconView, at: 0)
        }
    }
    
    public override func commonInit() {
        
        label.textStyle = TextStyles.small
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        iconView.tintColor = iconTintColor
        iconView.contentMode = .scaleAspectFit
        iconView.setContentHuggingPriority(.required, for: .horizontal)
        
        layoutMargins = UIEdgeInsets.zero
        mainSV.axis = .horizontal
        mainSV.spacing = Spacing.tiny
        mainSV.addArrangedSubview(label)
        addSubview(mainSV)
        mainSV.snp.makeConstraints { $0.edges.equalTo(self.snp.margins) }
    }
}
