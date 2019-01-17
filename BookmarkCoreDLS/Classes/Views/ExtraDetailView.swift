//
//  ExtraDetailView.swift
//  BookmarkCoreDLS_Example
//
//  Created by Murat Yılmaz on 17.01.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public class ExtraDetailView: UIView {
    
    public lazy var titleLabel = ELabel()
    public lazy var subtitleLabel = ELabel()
    public lazy var extraDetailLabel = ELabel()
    private lazy var mainSV = UIStackView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        titleLabel.textStyle = TextStyles.title3
        subtitleLabel.textStyle = TextStyles.small
        extraDetailLabel.textStyle = TextStyles.small
        extraDetailLabel.textStyle?.color = Colors.fBlack
        extraDetailLabel.numberOfLines = 0
        extraDetailLabel.lineBreakMode = .byWordWrapping
        self.layoutMargins = UIEdgeInsets(top: Spacing.small, left: Spacing.small, bottom: Spacing.small, right: Spacing.small)
        mainSV.addArrangedSubview(titleLabel)
        mainSV.addArrangedSubview(subtitleLabel)
        mainSV.addArrangedSubview(extraDetailLabel)
        mainSV.spacing = Spacing.tiny
        mainSV.axis = .vertical
        addSubview(mainSV)
        mainSV.snp.makeConstraints { $0.edges.equalTo(self.snp.margins) }
    }
}
