//
//  CollectionViewController.swift
//  CollectionView
//
//  Created by codes orbit on 24/08/2023.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    var dataSource:[String] = ["A","B","C","D"]
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dataSource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        if let cellData = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as?  CollectionViewCell{
            cellData.configure(value: dataSource[indexPath.row])
            cell = cellData
        }
        
        // Configure the cell
        return cell
    }
}
