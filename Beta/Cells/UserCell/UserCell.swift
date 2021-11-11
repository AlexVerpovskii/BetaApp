//
//  UserCell.swift
//  Beta
//
//  Created by black on 11.11.2021.
//

import UIKit
import TableKit
import SDWebImage

final class UserCell: UITableViewCell, ConfigurableCell {
    typealias CellData = UserCellModel
    
    
    @IBOutlet private weak var coverView: UIView!
    @IBOutlet private weak var avatarImage: UIImageView!
    @IBOutlet private weak var firstNameLabel: UILabel!
    @IBOutlet private weak var lastNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        coverView.backgroundColor = .white
        coverView.layer.cornerRadius = 14
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
    }
    
    func configure(with data: CellData) {
        if data.avatar != nil {
            avatarImage.sd_setImage(with: URL(string: data.avatar!))
        }
        firstNameLabel.text = data.firstName
        lastNameLabel.text = data.lastName
    }
}
