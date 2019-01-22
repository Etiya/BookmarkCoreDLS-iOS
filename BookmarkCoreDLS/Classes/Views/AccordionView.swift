//
//  AccordionView.swift
//  BookmarkCoreDLS_Example
//
//  Created by Murat Yılmaz on 21.01.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public class AccordionView: UIScrollView {
    
    public var collapseWhenExpand = false
    private let stackView = UIStackView()
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        alwaysBounceVertical = true
        setupContentView()
    }
    
    private func setupContentView() {
        stackView.axis = .vertical
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    public func addRow(title: String, contentView: UIView) {
        let row = AccordionRow(title: title, contentView: contentView)
        row.delegate = self
        stackView.addArrangedSubview(row)
    }
}

extension AccordionView: AccordionRowViewDelegate {
    public func stateChanged(_ row: AccordionRow) {
        guard collapseWhenExpand else { return }
        stackView.arrangedSubviews.forEach { view in
            let rowView = view as! AccordionRow
            if rowView !== row && rowView.state == .expanded {
                rowView.state = .collapsed
            }
        }
    }
}
