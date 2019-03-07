//
//  EStepper.swift
//  BookmarkCoreDLS_Example
//
//  Created by Enes Karaosman on 4.03.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public class EStepper: UIView {
    
    var min: Float!
    var max: Float!
    var stepAmount: Float!
    var valueType: String?
    
    public var counterValue: Float = 0.5 {
        didSet {
            updateLabel()
        }
    }
    
    public var minusIconImage: UIImage? {
        didSet {
            decrementButton.setImage(minusIconImage, for: .normal)
        }
    }
    
    public var plusIconImage: UIImage? {
        didSet {
            incrementButton.setImage(plusIconImage, for: .normal)
        }
    }
    
    public lazy var decrementButton: UIButton = {
        let db = UIButton()
        db.contentEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        db.tintColor = Colors.fGreen
        db.addTarget(self, action: #selector(self.decrementTapped(_:)), for: .touchDown)
        return db
    }()
    
    public lazy var incrementButton: UIButton = {
        let ib = UIButton()
        ib.contentEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        ib.tintColor = Colors.fGreen
        ib.addTarget(self, action: #selector(self.incrementTapped(_:)), for: .touchDown)
        return ib
    }()
    
    public lazy var counterLabel: UILabel = {
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
    
    public init(min: Float, max: Float, step: Float, valueType: String? = nil) {
        super.init(frame: CGRect.zero)
        self.min = min
        self.max = max
        self.stepAmount = step
        self.valueType = valueType
        setupUI()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func setupUI() {
        
        decrementButton.setContentHuggingPriority(.required, for: .horizontal)
        incrementButton.setContentHuggingPriority(.required, for: .horizontal)
        
        addSubview(containerSV)
        containerSV.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(Spacing.small)
            make.right.equalToSuperview().offset(-Spacing.small)
            make.bottom.top.equalToSuperview()
        }
        
        updateLabel()
    }
    
    public func updateLabel() {
        let value = String(format: "%.1f", self.counterValue)
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
    
    public func decrement() {
        if self.counterValue > self.min && decrementButton.state != .normal {
            self.counterValue = Swift.max(self.min, self.counterValue - self.stepAmount)
            checkLongPress(operation: decrement)
        }
    }
    
    public func increment() {
        if self.counterValue < self.max && incrementButton.state != .normal {
            self.counterValue = Swift.min(self.max, self.counterValue + self.stepAmount)
            checkLongPress(operation: increment)
        }
    }
    
    func checkLongPress(operation: @escaping () -> Void) {
        let elapsed = Double(Double(Swift.max(1, fabs(startDate.timeIntervalSinceNow))))
        let delay = Double(0.3 / elapsed)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: operation)
    }
    
}
