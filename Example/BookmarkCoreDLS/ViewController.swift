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
import AloeStackView

class ViewController: AloeStackViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        if #available(iOS 11.0, *) {
            stackView.contentInsetAdjustmentBehavior = .always
        }
    
        stackView.separatorInset = UIEdgeInsets.init(top: 0, left: 16, bottom: 0, right: 16)
        
        let button = ComponentFactory.makeLineActionButton()
        button.setTitle("Hello", for: .normal)
        stackView.addRow(button)
        
        /// INSTRUCTION VIEW
        let instructionView = InstructionView()
        instructionView.titleLabel.text = "ThumbnailedView"
        instructionView.descriptionLabel.text = "DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescr"
        stackView.addRow(instructionView)
        
        /// DROPDOWN BUTTON
        let dropdownButton = DropdownButton()
        dropdownButton.titleLabel.text = "I'am movingI'am movingI'am movingI'am movingI'am movingI'am movingI'am movingI'am movingI'am movingI'am moving"
        stackView.addRow(dropdownButton)
        
        /// LARGE SECTION VIEW
        let largeSectionView = LargeSectionView()
        largeSectionView.titleText = "Hello"
        stackView.addRow(largeSectionView)
        
        /// LARGE SECTION WITH SUBTITLE
        let largeSectionWithSubtitle = LargeSectionWithSubtitleView()
        largeSectionWithSubtitle.title = "I'am movingI'am moving"
        largeSectionWithSubtitle.subTitle = "Description Description Description Description"
        stackView.addRow(largeSectionWithSubtitle)
        
        /// EXTRA DETAIL VIEW
        let extraDetailView = ExtraDetailView()
        extraDetailView.titleLabel.text = "Extra Detail View"
        extraDetailView.subtitleLabel.text = "Extra Subtitle Detail"
        extraDetailView.extraDetailLabel.text = "Description"
//        stackView.addRow(extraDetailView)
        
        let d = EStepper(min: 0.5, max: 10.0, step: 0.1, valueType: "GB")
        d.minusIconImage = UIImage(named: "icon_minus")
        d.plusIconImage = UIImage(named: "icon_plus")
        stackView.addRow(d)
        
    }
}

extension ViewController {
    func showAlert() {
        let alertController = UIAlertController(title: "Test", message: "Test", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true)
    }
}
