//
//  SecondViewController.swift
//  multipleVews
//
//  Created by codes orbit on 23/08/2023.
//

import UIKit


protocol ViewControllerDelegate
{
    func updateData(data: LoginModel)
}

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var loginUsersSet = Set<LoginModel>()
    var delegate:ViewControllerDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Return the number of rows for the table.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loginUsersSet.count
    }
    
    
    // Provide a cell object for each row.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch a cell of the appropriate type.
        let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        let index = loginUsersSet.index(loginUsersSet.startIndex, offsetBy: indexPath.row)
        cell.textLabel?.text = "\(loginUsersSet[index].username), \(loginUsersSet[index].email) "
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = loginUsersSet.index(loginUsersSet.startIndex, offsetBy: indexPath.row)
        let selectedData:LoginModel = loginUsersSet[index]
        delegate?.updateData(data: selectedData)
        navigationController?.popViewController(animated: true)
    }
}
