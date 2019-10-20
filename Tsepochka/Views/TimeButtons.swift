//
//  TimeButtons.swift
//  GraphTest
//
//  Created by talgat on 19.01.18.
//  Copyright © 2018 Akezhan. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy

protocol ChangeTime{
    func change(_ name: String)
}

class TimeButtons: UIView{
    
    private var oneMounth = UIButton()
    private var oneWeek = UIButton()
    private var oneDay = UIButton()
    private var oneYear = UIButton()
    private var day : String?
    
    var delegate:ChangeTime?
    
    override init(frame:CGRect){
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        
        self.addSubview(oneDay)
        self.addSubview(oneWeek)
        self.addSubview(oneMounth)
        self.addSubview(oneYear)
        
        oneDay.setTitleColor(.black, for: .normal)
        oneWeek.setTitleColor(.black, for: .normal)
        oneMounth.setTitleColor(.black, for: .normal)
        oneYear.setTitleColor(.black, for: .normal)
        
        oneDay.setTitle("Today", for: .normal)//1day
        oneWeek.setTitle("1W", for: .normal)//1W 7day
        oneYear.setTitle("1Y", for: .normal)//1Y 356day
        oneMounth.setTitle("1M", for: .normal)//1M 30day
        
        oneDay.setTitleColor(.mainDarkAzure, for: .highlighted)
        oneWeek.setTitleColor(.mainDarkAzure, for: .highlighted)
        oneYear.setTitleColor(.mainDarkAzure, for: .highlighted)
        oneMounth.setTitleColor(.mainDarkAzure, for: .highlighted)
        
        oneDay.addTarget(self, action: #selector(press(_:)), for: .touchUpInside)
        oneWeek.addTarget(self, action: #selector(press(_:)), for: .touchUpInside)
        oneYear.addTarget(self, action: #selector(press(_:)), for: .touchUpInside)
        oneMounth.addTarget(self, action: #selector(press(_:)), for: .touchUpInside)
        
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        oneDay.easy.layout(
            TopMargin(0),
            Left(10),
            Width(75),
            Height(20)
        )
        
        oneWeek.easy.layout(
            TopMargin(0),
            Left(10).to(oneDay),
            Width(75),
            Height(20)
        )
        
        oneMounth.easy.layout(
            TopMargin(0),
            Left(10).to(oneWeek),
            Width(75),
            Height(20)
        )
        
        oneYear.easy.layout(
            Top(0),
            Left(10).to(oneMounth),
            Width(75),
            Height(20)
        )
    }
    
    @objc func press(_ sender:UIButton){
       // UserDefaults.standard.set(sender.titleLabel?.text, forKey: "time")
        if (sender.titleLabel?.text == "Today"){
            delegate?.change("1day")
        } else if (sender.titleLabel?.text == "1W"){
            delegate?.change("7day")
        }else if (sender.titleLabel?.text == "1M"){
            delegate?.change("30day")
        }else{
            delegate?.change("365day")
        }
    }
}
