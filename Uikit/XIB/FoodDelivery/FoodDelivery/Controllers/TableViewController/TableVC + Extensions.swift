//
//  TableVC + Extensions.swift
//  FoodDelivery
//
//  Created by codes orbit on 20/09/2023.
//

import UIKit

extension TableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 2:
            return restaurantListMockData.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell =  table.dequeueReusableCell(withIdentifier: FoodBannerTableViewCell.identifier, for: indexPath) as! FoodBannerTableViewCell
            return cell
        case 1:
            return UITableViewCell()
        case 2:
            return UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    
}

extension TableViewController: UITableViewDelegate{
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat{
        switch indexPath.section{
        case 0:
            return 255
        default:
            return 100
        }
    }
}
