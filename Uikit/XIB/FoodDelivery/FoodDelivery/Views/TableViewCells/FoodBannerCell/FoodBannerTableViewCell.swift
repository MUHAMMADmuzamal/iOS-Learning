//
//  FoodBannerTableViewCell.swift
//  FoodDelivery
//
//  Created by codes orbit on 20/09/2023.
//

import UIKit

class FoodBannerTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView:UICollectionView!
    static let identifier = "TableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "FoodBannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: FoodBannerCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension FoodBannerTableViewCell: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int{
        1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int{
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodBannerCollectionViewCell.identifier, for: indexPath) as! FoodBannerCollectionViewCell
        return cell
    }
}

