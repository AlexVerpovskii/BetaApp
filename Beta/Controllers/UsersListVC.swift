//
//  UsersListVC.swift
//  Beta
//
//  Created by black on 10.11.2021.
//

import UIKit
import TableKit

final class UsersListVC: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var tableDirector: TableDirector?
    private var userList: [User]?
    private let networkApi = NetworkApi.shared
    private var users: DataModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        networkApi.sendRequest(request: RestUserList(), model: users) { response in
            if response?.data != nil {
                self.userList = response?.data
                DispatchQueue.main.async {
                    self.prepareTable()
                }
            }
        }
        tableDirector = TableDirector(tableView: tableView)
        prepareTable()
    }
    
    private func prepareTable() {
        
        userList?.forEach({ user in
            tableDirector?.append(rows: [TableRow<UserCell>(item: UserCellModel(firstName: user.first_name, lastName: user.last_name, email: user.email, avatar: user.avatar), actions: [routing(user.email)])])
        })
        tableDirector?.tableView?.separatorStyle = .none
        tableDirector?.reload()
    }
    
    private func routing(_ email: String) -> TableRowAction<UserCell> {
        let documentsAction = TableRowAction<UserCell>(.click) { _ in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "InfoVC") as! InfoVC
            vc.email = email
            self.navigationController?.pushViewController(vc, animated: true)
        }
        return documentsAction
    }
}
