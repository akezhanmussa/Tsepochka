//
//  NewsViewController.swift
//  Tsepochka
//
//  Created by Daulet Kenzhetayev on 12/23/17.
//  Copyright © 2017 mad. All rights reserved.
//

import Foundation
import UIKit

class NewsViewController: UIViewController {
    lazy var instructionView = InstructionsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .mainBlue
        self.navigationItem.title = "News"
        self.view.addSubview(instructionView)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        instructionView.fillSuperview()
        instructionView.updateConstraints()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

