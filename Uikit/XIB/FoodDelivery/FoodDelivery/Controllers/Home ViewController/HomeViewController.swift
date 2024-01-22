//
//  HomeViewController.swift
//  FoodDelivery
//
//  Created by codes orbit on 15/09/2023.
//

import UIKit

class HomeViewController: UIViewController{
    
    @IBOutlet weak var collectionView:UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate =  self
        self.collectionView.register(UINib(nibName: "FoodTopBannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: FoodTopBannerCollectionViewCell.identifier)
        self.collectionView.register(UINib(nibName: "FoodCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: FoodCategoryCollectionViewCell.identifier)
        self.collectionView.register(UINib(nibName: "RestaurantsListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: RestaurantsListCollectionViewCell.identifier)
        self.collectionView.register(UINib(nibName: "RestaurantVeganCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: RestaurantVeganCollectionViewCell.identifier)
        //Header Footer
        collectionView.register(RestaurantsHeaderView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: RestaurantsHeaderView.headerIdentifier)
        collectionView.register(DividerFooterView.self, forSupplementaryViewOfKind: "Footer", withReuseIdentifier: DividerFooterView.footerIdentifier)
        
        self.configureCompostionaLayout()
    }
    
    @IBAction func tableViewButton(_sender: UIButton){
        self.navigationController?.pushViewController(TableViewController(), animated: true)
    }
}




