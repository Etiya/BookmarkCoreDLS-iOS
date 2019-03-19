//
//  CommRatesView.swift
//  BookmarkMobile
//
//  Created by M. Ensar Baba on 15.02.2019.
//  Copyright © 2019 Bookmark. All rights reserved.
//

import UIKit

public class CommRatesView: UIView {
    
    public var walletImageView = UIImageView()
    
    public var walletImage: UIImage? {
        didSet {
            walletImageView.image = walletImage
        }
    }
    
    public var callLabel: UILabel = {
        let label = UILabel()
        label.text = "Calls"
        label.textAlignment = .left
        label.font = TextStyles.small.font
        label.textColor = TextStyles.small.color
        return label
    }()
    
    public var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Texts"
        label.textAlignment = .left
        label.font = TextStyles.small.font
        label.textColor = TextStyles.small.color
        return label
    }()
    public var dataLabel: UILabel = {
        let label = UILabel()
        label.text = "Data"
        label.textAlignment = .left
        label.font = TextStyles.small.font
        label.textColor = TextStyles.small.color
        return label
    }()
    
    public var callRateLabel: UILabel = {
        let label = UILabel()
        label.text = "$0.10 / min"
        label.textAlignment = .right
        label.font = TextStyles.small.font
        label.textColor = UIColor.black
        return label
    }()
    public var textRateLabel: UILabel = {
        let label = UILabel()
        label.text = "$0.05 / text"
        label.textAlignment = .right
        label.font = TextStyles.small.font
        label.textColor = UIColor.black
        return label
    }()
    public var dataRateLabel: UILabel = {
        let label = UILabel()
        label.text = "N/A"
        label.textAlignment = .right
        label.font = TextStyles.small.font
        label.textColor = UIColor.black
        return label
    }()
    
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
    
    func initialize() {
        self.addSubview(walletImageView)
        let ratesView = UIView()
        
        ratesView.addSubview(callRateLabel)
        ratesView.addSubview(textRateLabel)
        ratesView.addSubview(dataRateLabel)
        ratesView.addSubview(callLabel)
        ratesView.addSubview(textLabel)
        ratesView.addSubview(dataLabel)
        self.addSubview(ratesView)
        
        self.snp.makeConstraints { (make) in
            make.height.equalTo(100)
        }
        walletImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        ratesView.snp.makeConstraints { (make) in
            make.leading.equalTo(walletImageView.snp.trailing).offset(25)
            make.right.top.bottom.equalToSuperview()
            
        }
        callLabel.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
        }
        textLabel.snp.makeConstraints { (make) in
            make.top.equalTo(callLabel.snp.bottom).offset(15)
            make.left.equalToSuperview()
        }
        dataLabel.snp.makeConstraints { (make) in
            make.top.equalTo(textLabel.snp.bottom).offset(15)
            make.left.equalToSuperview()
        }
        callRateLabel.snp.makeConstraints { (make) in
            make.top.right.equalToSuperview()
        }
        textRateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(callRateLabel.snp.bottom).offset(15)
            make.right.equalToSuperview()
        }
        dataRateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(textRateLabel.snp.bottom).offset(15)
            make.right.equalToSuperview()
        }
    }
    
}
