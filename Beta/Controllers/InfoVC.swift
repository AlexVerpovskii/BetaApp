//
//  InfoVC.swift
//  Beta
//
//  Created by black on 11.11.2021.
//

import UIKit

final class InfoVC: UIViewController {

    @IBOutlet private weak var emailLabel: UILabel!
    
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.text = email ?? ""
    }
}
