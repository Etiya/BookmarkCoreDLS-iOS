//
//  InstructionView.swift
//  BookmarkCoreDLS_Example
//
//  Created by Murat Yılmaz on 19.02.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public class InstructionView: EView {
    
    private let labelContainer = UIStackView()
    private lazy var thumbnailView: UIImageView = {
        let view = UIImageView(image: nil)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    public var thumbnailImage: UIImage? {
        didSet {
            self.thumbnailView.image = thumbnailImage
        }
    }
    
    public lazy var titleLabel = ComponentFactory.makeLabel(with: TextStyles.regular)
    public lazy var descriptionLabel = ComponentFactory.makeLabel(with: TextStyles.small)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    public override func commonInit() {
        
        titleLabel.textStyle?.color = Colors.fDarkBlue
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        
        addSubview(thumbnailView)
        thumbnailView.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(Spacing.small)
            $0.size.equalTo(CGSize(width: 50, height: 50))
        }
        
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        labelContainer.axis = .vertical
        //labelContainer.spacing = Spacing.tiny
        labelContainer.addArrangedSubview(titleLabel)
        labelContainer.addArrangedSubview(descriptionLabel)
        addSubview(labelContainer)
        labelContainer.snp.makeConstraints {
            $0.top.equalTo(thumbnailView)
            $0.leading.equalTo(thumbnailView.snp.trailing).offset(Spacing.tiny)
            $0.trailing.equalToSuperview().inset(Spacing.small)
            $0.bottom.equalToSuperview().inset(Spacing.small)
        }
    }
}
