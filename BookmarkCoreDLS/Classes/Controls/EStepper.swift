//
//  EStepper.swift
//  BookmarkCoreDLS_Example
//
//  Created by Enes Karaosman on 4.03.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public class EStepper: UIView {
    
    var min: Double!
    var max: Double!
    var stepAmount: Double!
    var valueType: String?
    
    public var counterValue: Double = 0.5 {
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
        db.tintColor = Colors.fGreen
        db.addTarget(self, action: #selector(self.decrementTapped(_:)), for: .touchDown)
        return db
    }()
    
    public lazy var incrementButton: UIButton = {
        let ib = UIButton()
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
    
    public init(min: Double, max: Double, step: Double, valueType: String? = nil) {
        super.init(frame: CGRect.zero)
        setupUI()
        self.min = min
        self.max = max
        self.stepAmount = step
        self.valueType = valueType
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
    
    public func updateLabel() {
        let newValue = round(10*self.counterValue)/10
//        print(newValue)
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
    
    public func decrement() {
        if self.counterValue > self.min && decrementButton.state != .normal {
            self.counterValue -= self.stepAmount
            checkLongPress(operation: decrement)
        }
    }
    
    public func increment() {
        if self.counterValue < self.max && incrementButton.state != .normal {
            self.counterValue += self.stepAmount
            checkLongPress(operation: increment)
            
        }
    }
    
    func checkLongPress(operation: @escaping () -> Void) {
        let elapsed = Double(Double(Swift.max(1, fabs(startDate.timeIntervalSinceNow))))
        let delay = Double(0.3 / elapsed)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: operation)
    }
    
}
