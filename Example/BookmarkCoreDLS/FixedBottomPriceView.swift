//
//  BottomPriceView.swift
//  BookmarkCoreDLS
//
//  Created by Murat Yılmaz on 15.01.2019.
//

import UIKit
import SnapKit
import BookmarkCoreDLS

public class FixedBottomPriceView: UIView {
    
    private lazy var seperator = UIView()
    public lazy var titleLabel = ELabel()
    public lazy var subtitleLabel = ELabel()
    public lazy var priceLabel = ELabel()
    public lazy var ctaButton = ComponentFactory.makeActionButton()
    
    public var buttonTitleText: String = "" {
        didSet {
            ctaButton.setTitle(buttonTitleText, for: .normal)
        }
    }
    
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
        subtitleLabel.textStyle = TextStyles.regular
        priceLabel.textStyle = TextStyles.title2
        priceLabel.textAlignment = .right
        
        seperator.backgroundColor = Colors.fLightGray
        addSubview(seperator)
        seperator.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        let mainSV = UIStackView()
        mainSV.spacing = Spacing.small
        mainSV.axis = .vertical
        addSubview(mainSV)
        mainSV.snp.makeConstraints {
            $0.top.equalTo(seperator.snp.bottom).offset(Spacing.small)
            $0.leading.equalToSuperview().offset(Spacing.small)
            $0.trailing.equalToSuperview().offset(-Spacing.small)
            $0.bottom.equalToSuperview().offset(-Spacing.small)
        }
        
        let vertLabelSV = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        vertLabelSV.axis = .vertical
        
        let horLabelSV = UIStackView(arrangedSubviews: [vertLabelSV, priceLabel])
        horLabelSV.axis = .horizontal
        mainSV.addArrangedSubview(horLabelSV)
        
        mainSV.addArrangedSubview(ctaButton)
    }
}
