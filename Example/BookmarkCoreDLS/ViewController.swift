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

public class DataTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var tableViewHeight: CGFloat {
        layoutIfNeeded()
        return contentSize.height
    }
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        delegate = self
        dataSource = self
        
        register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello \(indexPath.row)"
        return cell
    }
}

public class SelectableTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var tableViewHeight: CGFloat {
        layoutIfNeeded()
        return contentSize.height
    }
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        delegate = self
        dataSource = self
        
        rowHeight = 80
        register(SelectablePriceCell.self, forCellReuseIdentifier: "cell")
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SelectablePriceCell
        cell.titleLabel.text = "HelloHe"
        cell.priceLabel.text = "$3.00"
        return cell
    }
}

class ViewController: UIViewController {
    
    let amount = AmountSelectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        /*let style = TextStyles.title1
        let label = UILabel()
        label.font = style.font
        label.textColor = style.color
        
        let label2 = UILabel()
        label2.font = TextStyles.large.font
        label2.textColor = TextStyles.large.color
        
        label.text = "HELLO WORLD"
        label2.text = "BOOKMARK DLS"
        
        let stackView = UIStackView(arrangedSubviews: [label, label2])
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }*/
        
//        // FixedBottomPriceView Example
//        let bottomPriceView = FixedBottomPriceView(frame: .zero)
//        bottomPriceView.titleLabel.text = "My Add-Ons"
//        bottomPriceView.subtitleLabel.text = "One-time charge"
//        bottomPriceView.priceLabel.text = "$20.00"
//        bottomPriceView.buttonTitleText = "Confirm my order"
//        view.addSubview(bottomPriceView)
//        bottomPriceView.snp.makeConstraints {
//            $0.bottom.equalToSuperview()
//            $0.leading.trailing.equalToSuperview()
//        }
//
//        bottomPriceView.ctaButton.tapHandler = {
//            print("Confirm tap...")
//        }
        
        // extra detail view
//        let extraDetailView = ExtraDetailView(frame: .zero)
//        extraDetailView.titleLabel.text = "Turkey"
//        extraDetailView.subtitleLabel.text = "Zone 3"
//        extraDetailView.extraDetailLabel.text = "0,40 CAD / minute"
//        view.addSubview(extraDetailView)
//        extraDetailView.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(Spacing.xlarge)
//            $0.leading.trailing.equalToSuperview()
//            $0.height.equalTo(150)
//        }
        
//        // note view
//        let noteView = NoteView(frame: .zero)
//        noteView.icon = #imageLiteral(resourceName: "note_icon")
//        noteView.label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ullamcorper non velit et."
//        view.addSubview(noteView)
//        noteView.snp.makeConstraints {
//            $0.top.equalTo(extraDetailView.snp.bottom)
//            $0.leading.trailing.equalToSuperview()
//        }
        
//        let aview = AccordionView(frame: .zero)
//        aview.collapseWhenExpand = true
//        view.addSubview(aview)
//        aview.snp.makeConstraints { make in
//            make.edges.equalToSuperview().inset(Spacing.small)
//        }
//
//        let noteView = NoteView(frame: .zero)
//        noteView.icon = #imageLiteral(resourceName: "note_icon")
//        noteView.label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ullamcorper non velit et."
//
//        let bottomPriceView = FixedBottomPriceView(frame: .zero)
//        bottomPriceView.titleLabel.text = "My Add-Ons"
//        bottomPriceView.subtitleLabel.text = "One-time charge"
//        bottomPriceView.priceLabel.text = "$20.00"
//        bottomPriceView.buttonTitleText = "Confirm my order"
//
//        let extraDetailView = ExtraDetailView(frame: .zero)
//        extraDetailView.titleLabel.text = "Turkey"
//        extraDetailView.subtitleLabel.text = "Zone 3"
//        extraDetailView.extraDetailLabel.text = "0,40 CAD / minute"
//
//        let dataTableView = DataTableView(frame: .zero, style: .plain)
//        dataTableView.snp.makeConstraints { make in
//            make.height.equalTo(dataTableView.tableViewHeight)
//        }
//
//        aview.addRow(title: "Data", contentView: noteView)
//        aview.addRow(title: "Call/Texts", contentView: bottomPriceView)
//        aview.addRow(title: "International Calls", contentView: dataTableView)
        
//        let tableView = SelectableTableView(frame: .zero, style: .plain)
//        view.addSubview(tableView)
//        tableView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
        
//        let srv = SummaryRowView()
//        srv.titleLabel.text = "Subtotal"
//        srv.priceLabel.text = "$3.00"
//        view.addSubview(srv)
//        srv.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(Spacing.xlarge)
//            make.leading.trailing.equalToSuperview()
//        }
//
//        let long = SummaryLongRowView()
//        long.titleLabel.text = "60 min Of calls"
//        long.subtitleLabel.text = "Valid until 03.02.2019"
//        long.priceLabel.text = "$3.00"
//        view.addSubview(long)
//        long.snp.makeConstraints { make in
//            make.top.equalTo(srv.snp.bottom)
//            make.leading.trailing.equalToSuperview()
//        }
//
//        let textfield = ETextField()
//        textfield.placeholder = "Search country"
//        view.addSubview(textfield)
//        textfield.snp.makeConstraints { make in
//            make.top.equalTo(long.snp.bottom)
//            make.leading.trailing.equalToSuperview().inset(Spacing.small)
//        }
        
        let amounts = [AmountItem(price: 10.0, currency: "$"),
                       AmountItem(price: 20.0, currency: "$"),
                       AmountItem(price: 30.0, currency: "$"),
                       AmountItem(price: 20.0, currency: "$"),
                       AmountItem(price: 70.0, currency: "$")]
        amount.selectionDelegate = self
        view.addSubview(amount)
        amount.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Spacing.xlarge)
            make.leading.trailing.equalToSuperview()
            //make.height.equalTo(80)
        }
        amount.addItems(amounts)
        
        let informationView = InformationView(frame: .zero)
        informationView.titleText = "Title"
        informationView.detailText = "Detail"
        view.addSubview(informationView)
        informationView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(amount.snp.bottom)
        }
        
        let largePriceView = LargePriceView(frame: .zero)
        largePriceView.titleText = "Title"
        largePriceView.priceText = "$30.00"
        view.addSubview(largePriceView)
        largePriceView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(informationView.snp.bottom)
        }
        
        let largeSectionView = LargeSectionView(frame: .zero)
        largeSectionView.titleText = "Title"
        view.addSubview(largeSectionView)
        largeSectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(largePriceView.snp.bottom)
        }
        
        let largeSectionWithSubtitleView = LargeSectionWithSubtitleView(frame: .zero)
        largeSectionWithSubtitleView.title = "Wallet"
        largeSectionWithSubtitleView.subTitle = "Add money to your wallet and use the funds to pay as you go"
        largeSectionWithSubtitleView.iconImage = #imageLiteral(resourceName: "note_icon")
        view.addSubview(largeSectionWithSubtitleView)
        largeSectionWithSubtitleView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(largeSectionView.snp.bottom)
        }
        
        let iconTapHandler = { [unowned self] in
            self.showAlert()
        }
        largeSectionWithSubtitleView.iconTapHandler = iconTapHandler
        
        let pushRow = EPushButton()
        pushRow.titleText = "Transfer Money"
        view.addSubview(pushRow)
        pushRow.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(largeSectionWithSubtitleView.snp.bottom)
        }
        pushRow.addTarget(self, action: #selector(handlePushRowTap), for: .touchUpInside)
    }
    
    @objc private func handlePushRowTap(){
        showAlert()
    }
}

extension ViewController {
    func showAlert() {
        let alertController = UIAlertController(title: "Test", message: "Test", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true)
    }
}

extension ViewController: AmountSelectionViewDelegate {
    func didSelect(at index: Int) {
        print("select: \(index)")
        //amount.removeAmount(at: index)
    }
}
