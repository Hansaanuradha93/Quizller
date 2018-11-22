//
//  ViewController.swift
//  Qizller
//
//  Created by Hansa Anuradha on 11/21/18.
//  Copyright © 2018 Hansa Anuradha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabbel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        print(sender.tag)
    }
    
}

