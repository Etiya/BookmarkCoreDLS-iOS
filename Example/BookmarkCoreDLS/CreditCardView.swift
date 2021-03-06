//
//  CreditCardView.swift
//  BookmarkMobile
//
//  Created by M. Ensar Baba on 21.01.2019.
//  Copyright © 2019 Bookmark. All rights reserved.
//

import UIKit
import BookmarkCoreDLS

class EKContentAndCounterCell: UIView {
    
    var min: Double!
    var max: Double!
    var stepAmount: Double!
    var valueType: String?
    
    var counterValue: Double = 0.5 {
        didSet {
            updateLabel()
        }
    }
    
    var minusIconImage: UIImage? {
        didSet {
            decrementButton.setImage(minusIconImage, for: .normal)
        }
    }
    var plusIconImage: UIImage? {
        didSet {
            incrementButton.setImage(plusIconImage, for: .normal)
        }
    }
    
    lazy var decrementButton: UIButton = {
        let db = UIButton()
        db.tintColor = Colors.fGreen
        db.addTarget(self, action: #selector(self.decrementTapped(_:)), for: .touchDown)
        return db
    }()
    
    lazy var incrementButton: UIButton = {
        let ib = UIButton()
        ib.tintColor = Colors.fGreen
        ib.addTarget(self, action: #selector(self.incrementTapped(_:)), for: .touchDown)
        return ib
    }()
    
    lazy var counterLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = TextStyles.large.font
        lbl.textColor = Colors.fBlack
        lbl.textAlignment = .center
        return lbl
    }()
    
    private lazy var container: UIView = {
        let uv = UIView()
        uv.addSubview(containerSV)
        return uv
    }()
    
    private lazy var containerSV: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [decrementButton, counterLabel, incrementButton])
        sv.axis = .horizontal
        return sv
    }()
    
    var startDate: Date!
    
    init(min: Double, max: Double, step: Double, valueType: String? = nil) {
        super.init(frame: CGRect.zero)
        setupUI()
        self.min = min
        self.max = max
        self.stepAmount = step
        self.valueType = valueType
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func setupUI() {
        
        updateLabel()
        
        decrementButton.setContentHuggingPriority(.required, for: .horizontal)
        incrementButton.setContentHuggingPriority(.required, for: .horizontal)
        
        addSubview(containerSV)
        
        containerSV.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.top.equalToSuperview()
        }
        
    }
    
    func updateLabel() {
        let newValue = Double(floor(1000*self.counterValue)/1000)
        let value = String(format: "%.1f", newValue)
        counterLabel.text = "\(value) \(valueType ?? "")"
    }
    
    @objc func incrementTapped(_ sender: UIButton) {
        startDate = Date()
        increment()
    }
    
    @objc func decrementTapped(_ sender: UIButton) {
        startDate = Date()
        decrement()
    }
    
    func decrement() {
        if self.counterValue > self.min && decrementButton.state != .normal {
            self.counterValue -= self.stepAmount
            checkLongPress(operation: decrement)
        }
    }
    
    func increment() {
        
        if self.counterValue < self.max && incrementButton.state != .normal {
            self.counterValue += self.stepAmount
            checkLongPress(operation: increment)
            print(self.counterValue)
        }
    }
    
    func checkLongPress(operation: @escaping () -> Void) {
        let elapsed = Double(Double(Swift.max(1, fabs(startDate.timeIntervalSinceNow))))
        let delay = Double(0.1 / elapsed)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: operation)
    }
    
}

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
