//
//  ViewController.swift
//  RxSwiftLearning
//
//  Created by tran.xuan.diep on 9/1/17.
//  Copyright © 2017 tran.xuan.diep. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonRefresh: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    
    let disposeBag = DisposeBag()
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testRxSwift()
        loginByRxSwift()
    }
    
    func testRxSwift() {
        textField.rx.text
            .flatMapLatest { data -> Observable<String> in
                return Observable<String>.just(data!)
            }.bind(to: self.myLabel.rx.text).disposed(by: disposeBag)
        var count = 0
        buttonRefresh.rx.tap
            .subscribe(onNext: { data in
                count += 1
                print(count)
            }).addDisposableTo(disposeBag)
    }
    
    func loginByRxSwift() {
        _ = userNameTextField.rx.text.map {$0 ?? ""}.bind(to: viewModel.userNameTextField)
        _ = passwordTextField.rx.text.map {$0 ?? ""}.bind(to: viewModel.passwordTextField)
        _ = viewModel.isValid.bind(to: buttonLogin.rx.isEnabled)
        viewModel.isValid.subscribe(onNext: { [unowned self] isValid in
            print("isValid = \(isValid)")
        }).addDisposableTo(disposeBag)
        
        buttonLogin.rx.tap
            .subscribe(onNext: { data in
              self.login(self.userNameTextField.text, self.passwordTextField.text)
            }).addDisposableTo(disposeBag)
    }
    
    func login(_ username:String?, _ password:String?){
        if (username == "111" && password == "111111") {
            print("Login success with username = \(username) and password = \(password)")
        } else {
            print("Login fail")
        }
    }
}

