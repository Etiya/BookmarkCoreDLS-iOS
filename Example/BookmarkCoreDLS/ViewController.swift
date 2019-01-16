//
//  ViewController.swift
//  BookmarkCoreDLS
//
//  Created by muratyilmaz on 01/14/2019.
//  Copyright (c) 2019 muratyilmaz. All rights reserved.
//

import UIKit
import BookmarkCoreDLS
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let style = TextStyles.title1
        let label = UILabel()
        label.font = style.font
        label.textColor = style.color
        
        let label2 = UILabel()
        label2.font = TextStyles.large.font
        label2.textColor = TextStyles.large.color
        
        label.text = "HELLO WORLD"
        label2.text = "BOOKMARK DLS"
        
        let stackView = UIStackView(arrangedSubviews: [label, label2])
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        // FixedBottomPriceView Example
        let bottomPriceView = FixedBottomPriceView(frame: .zero)
        bottomPriceView.titleLabel.text = "My Add-Ons"
        bottomPriceView.subtitleLabel.text = "One-time charge"
        bottomPriceView.priceLabel.text = "$20.00"
        bottomPriceView.buttonTitleText = "Confirm my order"
        view.addSubview(bottomPriceView)
        bottomPriceView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }

}

