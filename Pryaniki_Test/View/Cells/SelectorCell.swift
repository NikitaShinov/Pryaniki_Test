//
//  SelectorCell.swift
//  Pryaniki_Test
//
//  Created by max on 27.05.2022.
//

import UIKit

class SelectorCell: UITableViewCell {
    
    static let identifier = "SelectoreCell"
    
    lazy var selector: UIPickerView = {
        let selector = UIPickerView()
        selector.backgroundColor = .getGreen()
        selector.layer.cornerRadius = 10
        selector.layer.masksToBounds = true
        return selector
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(selector)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        selector.center = contentView.center
        selector.frame.size.height = 80
        selector.frame.size.width = contentView.frame.size.width / 1.5
    }
    
}
