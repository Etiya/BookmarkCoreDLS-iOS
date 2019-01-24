//
//  CreditCardView.swift
//  BookmarkMobile
//
//  Created by M. Ensar Baba on 21.01.2019.
//  Copyright © 2019 Bookmark. All rights reserved.
//

import UIKit
/*
public class CreditCardView: UIView {
    
    public let titleLabel = UILabel()
    public let checkmark  = UIImageView(image: UIImage(named: "checkmark"))
    public var paymentID  = String()
    
    public var title: String = "Title" {
        didSet {
            titleLabel.text = title
        }
    }

    public init() {
        super.init(frame: .zero)
        self.initialize()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    public func check() {
        checkmark.isHidden = checkmark.isHidden ? false : true
    }
    
    func initialize() {
        titleLabel.font = UIFont.robotoMedium14
        let imageView = UIImageView(image: UIImage(named: "creditCard"))
        checkmark.snp.makeConstraints { (make) in
            make.width.height.equalTo(20)
        }
        imageView.tintColor = .black
        checkmark.isHidden = true
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(checkmark)
        self.snp.makeConstraints { (make) in
            make.height.equalTo(50)
        }
        imageView.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self)
        })
        checkmark.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(self)
            make.width.height.equalTo(16)
        })
        titleLabel.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self)
            make.trailing.equalTo(checkmark.snp.leading).offset(15)
            make.leading.equalTo(imageView.snp.trailing).offset(15)
        })
    }
}*/
