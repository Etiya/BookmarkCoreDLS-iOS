//
//  EStepper.swift
//  BookmarkCoreDLS_Example
//
//  Created by Enes Karaosman on 4.03.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public class EStepper: EView {
    
    public var min: Float = 0.0
    public var max: Float = 0.0
    public var stepAmount: Float = 0.0
    public var valueType: String?
    
    public var hideMinMaxLabel = false {
        didSet {
            self.minLabel.isHidden = hideMinMaxLabel
            self.maxLabel.isHidden = hideMinMaxLabel
        }
    }
    
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
        db.contentEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 8, right: 16)
        db.tintColor = Colors.fGreen
        db.addTarget(self, action: #selector(self.decrementTapped(_:)), for: .touchDown)
        return db
    }()
    
    public lazy var incrementButton: UIButton = {
        let ib = UIButton()
        ib.contentEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 8, right: 16)
        ib.tintColor = Colors.fGreen
        ib.addTarget(self, action: #selector(self.incrementTapped(_:)), for: .touchDown)
        return ib
    }()
    
    public lazy var counterLabel: UILabel = {
        let lbl = ELabel()
        lbl.font = TextStyles.large.font
        lbl.textColor = Colors.fBlack
        lbl.textAlignment = .center
        return lbl
    }()
    
    private lazy var minLabel: UILabel = {
        let lbl = ELabel()
        lbl.font = TextStyles.small.font
        lbl.textColor = Colors.fBlack
        lbl.textAlignment = .center
        return lbl
    }()
    
    private lazy var maxLabel: UILabel = {
        let lbl = ELabel()
        lbl.font = TextStyles.small.font
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
        self.setupParams(min: min, max: max, step: step, valueType: valueType)
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
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 56)
    }
    
    public func setupParams(min: Float, max: Float, step: Float, valueType: String? = nil) {
        self.min = min
        self.max = max
        self.stepAmount = step
        self.valueType = valueType
        self.minLabel.text = "min: \(min)"
        self.maxLabel.text = "max: \(max)"
        self.updateLabel()
    }
    
    func setupUI() {
        
        container.backgroundColor = .clear
        
        decrementButton.setContentHuggingPriority(.required, for: .horizontal)
        incrementButton.setContentHuggingPriority(.required, for: .horizontal)
        
        addSubview(containerSV)
        addSubview(minLabel)
        addSubview(maxLabel)
        
        containerSV.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(Spacing.small)
            make.right.equalToSuperview().offset(-Spacing.small)
            make.top.equalToSuperview()
        }
        
        minLabel.snp.makeConstraints {
            $0.top.equalTo(containerSV.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.centerX.equalTo(decrementButton.snp.centerX)
        }
        
        maxLabel.snp.makeConstraints {
            $0.top.equalTo(containerSV.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.centerX.equalTo(incrementButton.snp.centerX)
        }
        
        updateLabel()
    }
    
    private func updateLabel() {
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
