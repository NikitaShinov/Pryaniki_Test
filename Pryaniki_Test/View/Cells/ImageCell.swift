//
//  ImageCell.swift
//  Pryaniki_Test
//
//  Created by max on 27.05.2022.
//

import UIKit

class ImageCell: UITableViewCell {
    
    static let identifier = "ImageCell"
    
    lazy var receivedImage: CustomImageView = {
        let image = CustomImageView()
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var imageDescription: UILabel = {
        let text = UILabel()
        text.textAlignment = .center
        text.font = .systemFont(ofSize: 20, weight: .bold)
        return text
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(receivedImage)
        contentView.addSubview(imageDescription)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        receivedImage.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 25, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 150, height: 150)
        
        imageDescription.anchor(top: topAnchor, left: receivedImage.rightAnchor, bottom: nil, right: nil, paddingTop: 90, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 20)
    }
}
