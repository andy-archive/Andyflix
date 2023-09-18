//
//  MovieSignupViewModel.swift
//  Andyflix
//
//  Created by Taekwon Lee on 2023/09/18.
//

import Foundation

class MovieSignupViewModel {
    
    var id = Observable("")
    var password = Observable("")
    var referralCode = Observable("")
    var isValid = Observable(false)
    
    func checkValidation() {
        
        
        guard id.value.contains("@") else {
            isValid.value = false
            return
        }

        guard password.value.count >= 6 && password.value.count <= 10 else {
            isValid.value = false
            return
        }

        guard referralCode.value.count == 6 else {
            isValid.value = false
            return
        }

        for char in referralCode.value {
            guard char.isNumber else {
                isValid.value = false
                return
            }
        }
        
        isValid.value = true
    }
}
