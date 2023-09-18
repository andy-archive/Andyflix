//
//  MovieSignupTextField.swift
//  Andyflix
//
//  Created by Taekwon Lee on 2023/09/18.
//

import UIKit

final class MovieSignupTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        designTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func designTextField() {
        backgroundColor = .systemGray
        font = .systemFont(ofSize: 15)
        textColor = .white
        textAlignment = .center
        layer.cornerRadius = 5
    }
}
