//
//  ViewController.swift
//  DiffableDataSourceExample
//
//  Created by Codes Orbit on 19/02/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private lazy var dataSource = configureDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    func setupTableView() {
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        let array: [String] = ["item1", "item2", "item3", "item4", "item5"]
        updateTable(array: array)
    }

    // this function use instead of cell for row at function
    // write your Data Type
    func configureDataSource() -> UITableViewDiffableDataSource<Int, String> {
        let dataSource =  UITableViewDiffableDataSource<Int, String>(tableView: tableView) { tableView, indexPath, model in
            return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        }
        return dataSource
    }
    
    func updateTable(array:[String]){

        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        snapshot.appendSections([0])
        snapshot.appendItems(array)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
