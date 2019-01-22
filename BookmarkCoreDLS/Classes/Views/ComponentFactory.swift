//
//  ComponentFactory.swift
//  BookmarkCoreDLS_Example
//
//  Created by Murat Yılmaz on 15.01.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public class ComponentFactory {
    
    // Build an action button
    public static func makeActionButton() -> EButton {
        let button = EButton(frame: .zero)
        button.titleLabel?.font = TextStyles.regular.font
        button.setTitleColor(Colors.fBlack, for: .normal)
        button.setTitleColor(Colors.fBlack.withAlphaComponent(0.5), for: .highlighted)
        button.setTitleColor(Colors.fBlack.withAlphaComponent(0.3), for: .disabled)
        button.normalBackgroundColor = Colors.fGreen
        button.highlightedBackgroundColor = Colors.fGreen.withAlphaComponent(0.5)
        button.disabledBackgroundColor = Colors.fLightGray
        button.cornerRadius = 8
        return button
    }
    
    public static func makeLabel(with style: TextStyle) -> ELabel {
        let label = ELabel()
        label.textStyle = style
        return label
    }
    
    public static func makeCheckbox() -> Checkbox {
        let checkbox = Checkbox()
        checkbox.borderStyle = .square
        checkbox.checkmarkStyle = .tick
        checkbox.checkboxBackgroundColor = Colors.fBlue
        checkbox.checkmarkColor = UIColor.white
        return checkbox
    }
}