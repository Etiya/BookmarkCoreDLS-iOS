//
//  AmountSelectionView.swift
//  BookmarkMobile
//
//  Created by M. Ensar Baba on 18.01.2019.
//  Copyright © 2019 Bookmark. All rights reserved.
//

import UIKit

public struct AmountItem {
    public let price: Float
    public let currency: String
}

public protocol AmountSelectionViewDelegate: class {
    func didSelect(at index: Int)
}

public class AmountSelectionView: UIScrollView {
    
    public weak var selectionDelegate: AmountSelectionViewDelegate?
    private lazy var stackView = UIStackView()
    
    public var selectedIndex: Int?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        decelerationRate = .fast
        stackView.axis = .horizontal
        stackView.layoutMargins = UIEdgeInsets.init(top: Spacing.small, left: Spacing.small,
                                                    bottom: Spacing.small, right: Spacing.small)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.spacing = Spacing.tiny
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    public func addItems(_ items: [AmountItem] ) {
        items.forEach { self.addItem($0) }
    }
    
    public func addItem(_ item: AmountItem) {
        let button = ComponentFactory.makeAmountButton()
        button.addTarget(self, action: #selector(handleAmountTap(sender: )), for: .touchUpInside)
        let priceTitle = "\(item.currency) \(item.price)"
        button.setTitle(priceTitle, for: .normal)
        button.snp.makeConstraints {
            $0.width.equalTo(110)
            $0.height.equalTo(44)
        }
        stackView.addArrangedSubview(button)
    }
    
    public func removeAmount(at index: Int, animated: Bool = false) {
        let count = stackView.arrangedSubviews.count
        if selectedIndex == index { selectedIndex = nil }
        let item = stackView.arrangedSubviews[index]
        guard index >= 0 && index <= count - 1 else { return }
        self.stackView.removeArrangedSubview(item)
        item.removeFromSuperview()
        if animated {
            UIView.animate(withDuration: 0.3, animations: {
                self.layoutIfNeeded()
            }) { _ in }
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if stackView.bounds.width < bounds.width {
            let leftOffset = (bounds.width - stackView.bounds.width) * 0.5
            contentInset = UIEdgeInsets(top: 0, left: leftOffset, bottom: 0, right: leftOffset)
        }
    }
    
    @objc private func handleAmountTap(sender: EButton) {
        guard let index = stackView.arrangedSubviews.index(of: sender) else { return }
        guard index != selectedIndex else { return }
        if let selectedIndex = selectedIndex {
            (stackView.arrangedSubviews[selectedIndex] as! EButton).isSelected = false
        }
        sender.isSelected = true
        selectedIndex = index
        selectionDelegate?.didSelect(at: selectedIndex!)
        guard let superview = sender.superview?.superview else { return }
        scrollRectToVisible(convert(sender.frame, from: superview).inset(by: UIEdgeInsets(top: 0, left: -Spacing.small,
                                                                                          bottom: 0, right: -Spacing.small)), animated: true)
    }
}
