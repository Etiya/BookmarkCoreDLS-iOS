//
//  EInformationView.swift
//  BookmarkMobile
//
//  Created by Enes Karaosman on 12.03.2019.
//  Copyright © 2019 Bookmark. All rights reserved.
//

import UIKit
import SnapKit

public class EInformationView: UIView {
    
    public lazy var infoLabel: UILabel = {
        let lbl = ELabel()
        lbl.textStyle = TextStyles.regular
        lbl.textAlignment = .center
        lbl.textColor = Colors.fBlack
        lbl.numberOfLines = 0
        return lbl
    }()
    
    public var containerBackgroundColor: UIColor? {
        didSet {
            self.backgroundColor = containerBackgroundColor
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 56)
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        setupUI()
    }
    
    public init(infoText: String) {
        super.init(frame: CGRect.zero)
        self.infoLabel.text = infoText
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func setupUI() {
        
        self.addSubview(infoLabel)
        self.containerBackgroundColor = Colors.fOrange.withAlphaComponent(0.1)
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.layer.borderWidth = 2.0
        self.layer.borderColor = Colors.fOrange.cgColor
        self.applyShadow(apply: true, color: Colors.fGray, offset: CGSize.zero, opacity: 0.4, radius: 8.0, shadowRect: nil)
        
        self.infoLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Spacing.small)
        }
        
    }
    
}
