//
//  EPopup.swift
//  BookmarkMobile
//
//  Created by Enes Karaosman on 29.03.2019.
//  Copyright © 2019 Bookmark. All rights reserved.
//

import UIKit

public class EPopup: UIView {
    
    public var completionHandler: (() -> Void)?
    
    public var buttons: [UIButton]? {
        didSet {
            setButtons(buttons: buttons ?? [])
        }
    }
    
    public var image: UIImage? {
        didSet {
            self.imageView.image = self.image
        }
    }
    
    public var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    public var messageText: String? {
        didSet {
            messageLabel.text = messageText
        }
    }
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = self.image
        return iv
    }()
    
    private lazy var imageContainer: UIView = {
        let v = UIView()
        v.addSubview(imageView)
        return v
    }()
    
    private lazy var stackViewContainer: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [closeBtnContainer, imageContainer, titleLabel, messageLabel, buttonStackView])
        sv.spacing = Spacing.tiny
        sv.distribution = .fill
        sv.axis = .vertical
        return sv
    }()
    
    private lazy var mainContainer: UIView = {
        let v = UIView()
        v.layer.cornerRadius = Spacing.small
        v.addSubview(stackViewContainer)
        v.backgroundColor = .white
        return v
    }()
    
    private lazy var closeBtn: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(self.closeAction), for: .touchUpInside)
        b.setImage(UIImage(named: "close_btn"), for: .normal)
        b.tintColor = .black
        return b
    }()
    
    private lazy var closeBtnContainer: UIView = {
        let d = UIView()
        d.addSubview(closeBtn)
        return d
    }()
    
    private lazy var titleLabel: ELabel = {
        let lbl = ComponentFactory.makeLabel(with: TextStyles.title3)
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    private lazy var messageLabel: UILabel = {
        let lbl = ComponentFactory.makeLabel(with: TextStyles.small)
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.textAlignment = .center
        return lbl
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [])
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = Spacing.tiny
        sv.alignment = .center
        return sv
    }()
    
    private func setButtons(buttons: [UIButton]) {
        self.buttonStackView.subviews.forEach(self.buttonStackView.removeArrangedSubview(_:))
        buttons.forEach(self.buttonStackView.addArrangedSubview(_:))
    }
    
    @objc func closeAction() {
        dismiss()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    public init(
        messageText: String,
        titleText: String? = nil,
        image: UIImage? = nil,
        buttons: [UIButton]? =  nil,
        completionHandler: (() -> Void)? = nil
        ) {
        super.init(frame: CGRect.zero)
        setPopup(messageText: messageText, titleText: titleText, image: image, buttons: buttons, completionHandler: completionHandler)
        setupUI()
    }
    
    public func setPopup(messageText: String, titleText: String?, image: UIImage?, buttons: [UIButton]?, completionHandler: (() -> Void)?) {
        self.messageText = messageText
        self.titleText = titleText
        self.image = image
        self.buttons = buttons
        self.completionHandler = completionHandler
        self.messageLabel.sizeToFit()
        self.titleLabel.sizeToFit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupUI() {
        
        self.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        self.addSubview(mainContainer)
        
        self.stackViewContainer.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Spacing.small)
        }
        
        self.mainContainer.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.8)
        }
        
        self.closeBtn.snp.makeConstraints {
            $0.right.top.bottom.equalToSuperview()
            $0.width.height.equalTo(20)
        }
        
        self.imageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
        }
        
    }
    
}

extension EPopup {
    
    public func show() {
        UIApplication.shared.keyWindow?.addSubview(self)
        
        self.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    public func dismiss() {
        self.removeFromSuperview()
        completionHandler?()
    }
    
}
