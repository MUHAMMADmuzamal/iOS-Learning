//
//  SecondViewController.swift
//  xibProject2
//
//  Created by codes orbit on 24/08/2023.
//

import UIKit

class SecondViewController: UIViewController {
    var items:[FormModel] = []
    @IBOutlet weak var table:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.table.dataSource = self
        self.table.delegate = self
        items = FormModel.data
        // Do any additional setup after loading the view.
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource{
    
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.items.count
        }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell{
             let item:FormModel = items[indexPath.row]
             cell.label?.text = "\(String(describing: item.username!)), \(String(describing: item.email!))"
             return cell
         }
         return UITableViewCell()
    }
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ){
        FormModel.selectedValueIndex = indexPath.row
        navigationController?.popToRootViewController(animated: true)
    }
}
