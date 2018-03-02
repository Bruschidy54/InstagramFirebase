//
//  ViewController.swift
//  InstagramFirebase
//
//  Created by Dylan Bruschi on 3/1/18.
//  Copyright © 2018 Dylan Bruschi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let plusPhotoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(plusPhotoButton)
        plusPhotoButton.frame = CGRect(x: 0, y: 0, width: 140, height: 140)
        plusPhotoButton.center = view.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

