//
//  TextCell.swift
//  Pryaniki_Test
//
//  Created by max on 27.05.2022.
//

import UIKit

class TextCell: UITableViewCell {
    
    static let identifier = "TextCell"
    
    lazy var descriptionLabel: UILabel = {
        let text = UILabel()
        text.textAlignment = .center
        text.backgroundColor = UIColor.getGreen()
        text.layer.cornerRadius = 10
        text.layer.masksToBounds = true
        text.font = .systemFont(ofSize: 20, weight: .bold)
        return text
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(descriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        descriptionLabel.center = contentView.center
        descriptionLabel.frame.size.height = 80
        descriptionLabel.frame.size.width = contentView.frame.size.width / 2
    }
}
