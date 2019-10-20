//
//  NewsCollectionViewCell.swift
//  Tsepochka
//
//  Created by Galym Anuarbek on 1/10/18.
//  Copyright © 2018 mad. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy

class NewsCollectionViewCell: UICollectionViewCell {
    
    let titleLabel = UILabel()
    let sourceLabel = UILabel()
    let image = UIImageView()
    let linkButton = UIButton()
    let starButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        titleLabel.font = UIFont.boldSystemFont(ofSize: 23)
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        sourceLabel.font = UIFont.systemFont(ofSize: 10)
        sourceLabel.textColor = UIColor.mainTextDarkGray
        linkButton.frame.size = CGSize(width: 19, height: 19)
        starButton.frame.size = CGSize(width: 19, height: 19)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(sourceLabel)
        self.contentView.addSubview(image)
        self.contentView.addSubview(linkButton)
        self.contentView.addSubview(starButton)
        image.easy.layout(
            Top(0),
            Left(0),
            Right(0),
            Height(200)
        )
        titleLabel.easy.layout(
            Top(7).to(image),
            Left(8),
            Right(8)
        )
        sourceLabel.easy.layout(
            Top(4).to(titleLabel),
            Left(8)
        )
        linkButton.easy.layout(
            Right(11),
            Top(0).to(titleLabel)
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
