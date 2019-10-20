//
//  ViewController.swift
//  GraphTest
//
//  Created by talgat on 23.12.17.
//  Copyright © 2017 Akezhan. All rights reserved.
//

import UIKit
import Foundation
import EasyPeasy

class ViewController: UIViewController {
    
    public var coinName:String? {
        didSet {
            graph.coinName = coinName
        }
    }
        
    public var coinNameFull: String?{
        didSet{
            graph.coinNameFull = coinNameFull
            self.navigationItem.title = coinNameFull
        }
    }
    
    public var coinImageUrl: String?{
        didSet{
            graph.coinImageUrl = coinImageUrl
        }
    }
    
    var graph = Charts()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.view.clipsToBounds = false
        setup()
    }
    
    func setup(){
        self.view.addSubview(graph)
        graph.easy.layout(Top(0),Left(0),Right(0),Bottom(0))
    }
}

