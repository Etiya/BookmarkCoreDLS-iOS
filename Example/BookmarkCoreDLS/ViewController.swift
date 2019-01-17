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
        
        /*let style = TextStyles.title1
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
        }*/
        
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
        
        bottomPriceView.ctaButton.tapHandler = {
            print("Confirm tap...")
        }
        
        // extra detail view
        let extraDetailView = ExtraDetailView(frame: .zero)
        extraDetailView.titleLabel.text = "Title"
        extraDetailView.subtitleLabel.text = "Subtitle"
        extraDetailView.extraDetailLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ullamcorper non velit et"
        view.addSubview(extraDetailView)
        extraDetailView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Spacing.xlarge)
            $0.leading.trailing.equalToSuperview()
        }
        
        // note view
        let noteView = NoteView(frame: .zero)
        noteView.icon = #imageLiteral(resourceName: "note_icon")
        noteView.label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ullamcorper non velit et."
        view.addSubview(noteView)
        noteView.snp.makeConstraints {
            $0.top.equalTo(extraDetailView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }

}

