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
        stackView.addRow(extraDetailView)

        /// STEPPER
        let stepper = EStepper(min: 0.5, max: 10.0, step: 0.5, valueType: "GB")
        stepper.minusIconImage = UIImage(named: "icon_minus")
        stepper.plusIconImage = UIImage(named: "icon_plus")
//        stepper.hideMinMaxLabel = true
        stackView.addRow(stepper)
        
        /// SEGMENTED CONTROL
        let sControl = ESegmentedControl(frame: CGRect.zero, buttonTitle: ["Phone Number", "Email address"])
//        sControl.delegate = self
        stackView.addRow(sControl)
        
        /// INFORMATION VIEW
        let iv = EInformationView(infoText: "You can put any string here to inform your user, kind of alert hhh !")
        stackView.addRow(iv)
        
    }
}

extension ViewController {
    func showAlert() {
        let alertController = UIAlertController(title: "Test", message: "Test", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true)
    }
}
