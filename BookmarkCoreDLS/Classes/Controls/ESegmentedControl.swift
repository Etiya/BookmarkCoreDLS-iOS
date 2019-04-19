//
//  ESegmentedControl.swift
//  BookmarkMobile
//
//  Created by Enes Karaosman on 8.03.2019.
//  Copyright © 2019 Bookmark. All rights reserved.
//

import UIKit

public protocol ESegmentedControlDelegate: class {
    func changeToIndex(index: Int)
}

public class ESegmentedControl: EView {
    
    private var buttonTitles: [String]!
    public var buttons: [UIButton]!
    private var selectorView: UIView!
    
    public var textColor: UIColor = Colors.fGray
    public var selectorViewColor: UIColor = Colors.fGreen
    public var selectorTextColor: UIColor = Colors.fGreen
    
    public weak var delegate: ESegmentedControlDelegate?
    
    public private(set) var selectedIndex: Int = 0
    
    convenience public init(frame: CGRect, buttonTitle: [String]) {
        self.init(frame: frame)
        self.buttonTitles = buttonTitle
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        updateView()
    }
    
    override public var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 50.0)
    }
    
    func setButtonTitles(buttonTitles: [String]) {
        self.buttonTitles = buttonTitles
        self.updateView()
    }
    
    func setIndex(index: Int) {
        buttons.forEach({ $0.setTitleColor(textColor, for: .normal) })
        let button = buttons[index]
        selectedIndex = index
        button.setTitleColor(selectorTextColor, for: .normal)
        let selectorPosition = frame.width / CGFloat(buttonTitles.count) * CGFloat(index)
        UIView.animate(withDuration: 0.15) {
            self.selectorView.frame.origin.x = selectorPosition
        }
    }
    
    @objc func buttonAction(sender: UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                let selectorPosition = frame.width / CGFloat(buttonTitles.count) * CGFloat(buttonIndex)
                selectedIndex = buttonIndex
                delegate?.changeToIndex(index: selectedIndex)
                UIView.animate(withDuration: 0.2) {
                    self.selectorView.frame.origin.x = selectorPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
}

//Configuration View
extension ESegmentedControl {
    
    private func updateView() {
        createButton()
        configStackView()
        configSelectorView()
    }
    
    private func configStackView() {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        addSubview(stack)
        stack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let seperator = UIView.makeSeperator()
        addSubview(seperator)
        seperator.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
    
    private func configSelectorView() {
        let selectorWidth = frame.width / CGFloat(self.buttonTitles.count)
        selectorView = UIView(frame: CGRect(x: 0, y: self.frame.height - 1, width: selectorWidth, height: 1))
        selectorView.backgroundColor = selectorViewColor
        addSubview(selectorView)
    }
    
    private func createButton() {
        buttons = [UIButton]()
        buttons.removeAll()
        subviews.forEach({$0.removeFromSuperview()})
        for buttonTitle in buttonTitles {
            let button = UIButton()
            button.titleLabel?.font = TextStyles.regular.font
            button.setTitle(buttonTitle, for: .normal)
            button.addTarget(self, action: #selector(ESegmentedControl.buttonAction(sender:)), for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
    }
    
}
