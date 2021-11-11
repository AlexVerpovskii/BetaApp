//
//  AuthVC.swift
//  Beta
//
//  Created by black on 10.11.2021.
//

import UIKit

final class AuthVC: UIViewController {
    
    @IBOutlet private weak var loginTF: UITextField!
    @IBOutlet private weak var passwordTF: UITextField!
    
    private var authModel: AuthModel!
    private let network = NetworkApi.shared
    private var token: TokenModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func enterButton(_ sender: Any) {
        if loginTF.text == "" || passwordTF.text == "" {
            showErrorAlert()
        } else {
            authModel = AuthModel(email: loginTF.text!, password: passwordTF.text!)
            network.sendRequest(request: RestAuth(login: authModel), model: token) { response in
                if (response?.token == nil) {
                    self.showValidationAlert()
                } else {
                    //Разобраться с сессией
                    UserSettings.token = response!.token
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "UsersListVC") as! UsersListVC
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
}

extension AuthVC {
    private func showErrorAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Заполнены не все поля", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func showValidationAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Указан неверный логин или пароль", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
