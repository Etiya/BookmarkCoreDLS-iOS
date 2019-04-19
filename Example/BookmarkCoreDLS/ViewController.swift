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
    
        stackView.backgroundColor = .clear
        stackView.separatorInset = UIEdgeInsets.small_LR
        
        let button = ComponentFactory.makeActionButton()
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
        
        let showPopup = ComponentFactory.makeLineActionButton()
        showPopup.addTarget(self, action: #selector(customPopup), for: .touchUpInside)
        showPopup.setTitle("Display Custom Button", for: .normal)
        stackView.addRow(showPopup)
        
    }
    
    @objc func noop() {}
    @objc private func customPopup() {
        
        let image = UIImage(named: "smallspot-911")
        let firstBtn: UIButton = {
            let b = ComponentFactory.makeActionButton()
            b.addTarget(self, action: #selector(noop), for: .touchUpInside)
            b.setTitle("Use", for: .normal)
            return b
        }()
        
        let secondBtn: UIButton = {
            let b = ComponentFactory.makeLineActionButton()
            b.addTarget(self, action: #selector(noop), for: .touchUpInside)
            b.setTitle("Gift", for: .normal)
            return b
        }()
        
        let popup = EPopup(
            messageText: "This is my message, i think its a bit long but anyway, im just testing it..",
            titleText: "Here is my title, why not making it multiple line as well..",
            image: nil, //nil,
            buttons: nil,//[firstBtn, secondBtn], //nil,
            completionHandler: nil
        )
        
        popup.show()
    }
    
}

extension ViewController {
    func showAlert() {
        let alertController = UIAlertController(title: "Test", message: "Test", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true)
    }
}
