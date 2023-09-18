//
//  BaseViewController.swift
//  Andyflix
//
//  Created by Taekwon Lee on 2023/09/18.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setConstraints()
    }
    
    func configureView() {
        view.backgroundColor = .black
    }
    
    func setConstraints() {}
}

