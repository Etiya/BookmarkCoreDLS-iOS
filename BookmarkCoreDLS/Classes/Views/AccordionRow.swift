//
//  AccordionRowView.swift
//  BookmarkCoreDLS_Example
//
//  Created by Murat Yılmaz on 21.01.2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public protocol AccordionRowViewDelegate: class {
    func stateChanged(_ row: AccordionRow)
}

public class AccordionRow: UIView {
    
    weak var delegate: AccordionRowViewDelegate?
    lazy var label = ELabel()
    
    private lazy var carretView: UIImageView = {
        let imageView = UIImageView(image: UIImage.dlsImageFor(name: "carret")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.tintColor = Colors.fGreen
        return imageView
    }()
    
    private lazy var mainSV = UIStackView()
    private let headerView = UIView()
    private let seperator = UIView()
    
    public enum CellState {
        case expanded
        case collapsed
    }
    
    public var state: CellState = CellState.collapsed {
        didSet {
            toggle()
        }
    }
    
    private var contentView: UIView?
    private var title: String?
    
    public init(title: String, contentView: UIView) {
        self.title = title
        self.contentView = contentView
        super.init(frame: .zero)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        setupHeaderView()
        setupContainerSV()
        addViewIfNeeded()
        setupSeperator()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        headerView.addGestureRecognizer(gesture)
    }
    
    @objc private func handleTap() {
        state = state == .collapsed ? .expanded : .collapsed
        delegate?.stateChanged(self)
    }
    
    private func setupSeperator() {
        addSubview(seperator)
        seperator.backgroundColor = Colors.fLightGray
        seperator.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    private func setupHeaderView() {
        label.textStyle = TextStyles.regular
        label.numberOfLines = 1
        label.text = title
        carretView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        headerView.addSubview(label)
        headerView.addSubview(carretView)
        
        label.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        carretView.snp.makeConstraints {
            $0.width.height.equalTo(10)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.leading.equalTo(label.snp.trailing)
        }
    }
    
    private func setupContainerSV() {
        mainSV.axis = .vertical
        mainSV.spacing = Spacing.tiny
        addSubview(mainSV)
        mainSV.snp.makeConstraints {
            $0.top.equalToSuperview().inset(Spacing.small)
            $0.bottom.equalToSuperview().inset(Spacing.small).priority(999)
            $0.leading.trailing.equalToSuperview().inset(Spacing.small)
        }
        mainSV.addArrangedSubview(headerView)
    }
    
    private func addViewIfNeeded() {
        guard let view = contentView else { return }
        mainSV.addArrangedSubview(view)
        view.isHidden = true
        view.alpha = 0
    }
    
    private func toggle() {
        UIView.animate(withDuration: 0.3) {
            self.contentView?.alpha = self.state == .collapsed ? 0 : 1
            self.contentView?.isHidden = self.state == .collapsed
            let rotationValue = self.state == .collapsed ? -CGFloat.pi/2 : CGFloat.pi/2
            self.carretView.transform = CGAffineTransform(rotationAngle: rotationValue)
            self.layoutIfNeeded()
        }
    }
}
