//
//  ViewController.swift
//  CheckboxDemo
//
//  Created by James Beattie on 04/05/2017.
//  Copyright © 2017 James Beattie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var checkbox1: CheckboxView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        checkbox1 = CheckboxView(frame: CGRect(x: (view.bounds.size.width - 25) / 2, y: (view.bounds.size.height - 25) / 2, width: 25, height: 25), state: .unselected)
        self.view.addSubview(checkbox1!)
    }

    @IBAction func togglePressed(_ sender: UIButton) {
        checkbox1?.toggleState()
    }

}

