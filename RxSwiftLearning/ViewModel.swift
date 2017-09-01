//
//  ViewModel.swift
//  RxSwiftLearning
//
//  Created by tran.xuan.diep on 9/1/17.
//  Copyright © 2017 tran.xuan.diep. All rights reserved.
//

import Foundation
import RxSwift

struct ViewModel {
    var userNameTextField = Variable<String>("")
    var passwordTextField = Variable<String>("")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(self.userNameTextField.asObservable(), passwordTextField.asObservable()) { username, password in
                username.characters.count >= 3 && password.characters.count >= 6
        }
    }
}
