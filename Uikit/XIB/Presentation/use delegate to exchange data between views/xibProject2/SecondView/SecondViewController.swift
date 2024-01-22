//
//  SecondViewController.swift
//  xibProject2
//
//  Created by codes orbit on 24/08/2023.
//

import UIKit

protocol SecondViewControllerDelegate{
    func getData(data: FormModel)
}
class SecondViewController: UIViewController {
    
    var items:[FormModel] = []
    var delegate:SecondViewControllerDelegate?
    @IBOutlet weak var table:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.table.dataSource = self
        self.table.delegate = self
        // Do any additional setup after loading the view.
    }
}

extension SecondViewController: UITableViewDataSource{
    
    
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
}

extension SecondViewController:UITableViewDelegate{
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ){
        delegate?.getData(data: items[indexPath.row])
        navigationController?.popToRootViewController(animated: true)
    }
}
