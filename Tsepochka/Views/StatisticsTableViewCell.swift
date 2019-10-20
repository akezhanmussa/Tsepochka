//
//  StatisticsTableViewCell.swift
//  GraphTest
//
//  Created by talgat on 23.12.17.
//  Copyright © 2017 Akezhan. All rights reserved.
//

import UIKit
import EasyPeasy

class StatisticsTableViewCell: UITableViewCell {

    let priceCryptoCurrencyLabel = UILabel()
    let iconCryptoCurrency = UIImageView()
    let capitalCryptoCurrencyLabel = UILabel()
    let nameCryptoCurrencyLabel = UILabel()
    let lineView = UILabel()
    let shortCryptoCurrencyLabel = UILabel()
    var cryptoCurrency: [String:Any]? {
        didSet {
            guard let currentCryptoCurrency = cryptoCurrency else {return}
            var width: CGFloat = 0
            if let name = currentCryptoCurrency["name"] as? String {
                nameCryptoCurrencyLabel.text = name
                width = name.size(withAttributes: [NSAttributedStringKey.font: UIFont(name:"Avenir Next Medium", size: 18)]).width
            }
            if let price = currentCryptoCurrency["price"] as? Double {
                priceCryptoCurrencyLabel.text = "$ " + String(describing: price)
            }
            if let picture = currentCryptoCurrency["picture"] as? String {
                let url = URL(string: picture)
                iconCryptoCurrency.kf.setImage(with: url)
            }
            if let short = currentCryptoCurrency["short"] as? String {
                shortCryptoCurrencyLabel.text = short
            }
            
            nameCryptoCurrencyLabel.easy.layout(
                TopMargin(10),LeftMargin(42),Width(width+5)
            )
            shortCryptoCurrencyLabel.easy.layout(
                TopMargin(10), Left(1.1).to(nameCryptoCurrencyLabel),Width(50)
            )
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "statistics")
        
        self.selectionStyle = .none
        
        priceCryptoCurrencyLabel.font = UIFont(name:"Avenir Next Medium", size: 18)
        shortCryptoCurrencyLabel.font = UIFont(name:"Avenir Next Medium", size: 18)
        nameCryptoCurrencyLabel.font = UIFont(name:"Avenir Next Medium", size: 18)
        
        self.addSubview(iconCryptoCurrency)
        self.addSubview(lineView)
        self.addSubview(nameCryptoCurrencyLabel)
        self.addSubview(shortCryptoCurrencyLabel)
        self.addSubview(priceCryptoCurrencyLabel)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        iconCryptoCurrency.easy.layout(
            TopMargin(10),LeftMargin(13),Width(22.4),Height(22.4)
        )
        
        priceCryptoCurrencyLabel.easy.layout(
            TopMargin(12),Left(235.3).to(iconCryptoCurrency),RightMargin(5.3)
        )
    }

}
