//
//  InstructionsView.swift
//  Tsepochka
//
//  Created by Daulet Kenzhetayev on 12/24/17.
//  Copyright © 2017 mad. All rights reserved.
//

import Foundation
import UIKit

class InstructionsView: UIView {
    lazy var tableView = UITableView()
    var images = ["sampleIcon", "sampleIcon", "sampleIcon", "sampleIcon"]
    var texts = ["Создание крипто-кошелька", "Покупка криптовалют", "Отслежка статистики", "Вывод средств"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.register(InstructionsTableViewCell.self, forCellReuseIdentifier: "InstructionsCell")
        
        self.addSubview(tableView)
        updateConstraints()
    }
    
    //MARK: - Constraints
    override func updateConstraints() {
        super.updateConstraints()
        tableView.fillSuperview()
    }
}

extension InstructionsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: InstructionsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "InstructionsCell", for: indexPath as IndexPath) as! InstructionsTableViewCell
        cell.iconImageView.image = UIImage(named: images[indexPath.row])
        cell.titleLabel.text = texts[indexPath.row]
        cell.updateConstraints()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 116
    }
    
}
