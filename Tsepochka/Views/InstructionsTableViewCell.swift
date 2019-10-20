//
//  InstructionsTableViewCell.swift
//  Tsepochka
//
//  Created by Daulet Kenzhetayev on 12/24/17.
//  Copyright © 2017 mad. All rights reserved.
//

import Foundation
import UIKit

class InstructionsTableViewCell: UITableViewCell {
    lazy var iconImageView = UIImageView()
    lazy var titleLabel = UILabel()
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func setup() {
        self.backgroundColor = .white
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowRadius = 4
        titleLabel.textAlignment = .center
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.layer.masksToBounds = true
        titleLabel.font = UIFont.SFMedium(ofSize: 17)
    
        self.addSubview(iconImageView)
        self.addSubview(titleLabel)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        iconImageView.anchorToEdge(.top, padding: 12, width: 60, height: 60)
        titleLabel.align(.underCentered, relativeTo: iconImageView, padding: 4, width: 320, height: 31)
    }
    
}

