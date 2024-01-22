//
//  HomeVC+Extensions.swift
//  FoodDelivery
//
//  Created by codes orbit on 18/09/2023.
//

import UIKit


//MARK: - Data source and View Delegate
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return foodTopBannerMockData.count
        case 1 :
            return foodCategoryMockData.count
        default:
            return foodTopBannerMockData.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section{
        case 0:
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: FoodTopBannerCollectionViewCell.identifier, for: indexPath) as? FoodTopBannerCollectionViewCell else{
                fatalError("unable to dequeue")
            }
            return cell
        case 1:
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: FoodCategoryCollectionViewCell.identifier, for: indexPath) as? FoodCategoryCollectionViewCell else{
                fatalError("unable to dequeue")
            }
            return cell
        case 2:
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantsListCollectionViewCell.identifier, for: indexPath) as? RestaurantsListCollectionViewCell else{
                fatalError("unable to dequeue")
            }
            return cell
        default:
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantVeganCollectionViewCell.identifier, for: indexPath) as? RestaurantVeganCollectionViewCell else{
                fatalError("unable to dequeue")
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String
     , at indexPath: IndexPath) -> UICollectionReusableView {
            if kind == "Header" {
                let header = self.collectionView.dequeueReusableSupplementaryView(ofKind: kind
                , withReuseIdentifier:   RestaurantsHeaderView.headerIdentifier, for: indexPath) as! RestaurantsHeaderView
                return header
            }else {
                let footer = self.collectionView.dequeueReusableSupplementaryView(ofKind: kind
                , withReuseIdentifier: DividerFooterView.footerIdentifier, for: indexPath) as! DividerFooterView
                
                return footer
            }
        }
}

//MARK: - Food Banner Section Compostional Layout
extension HomeViewController{

    func configureCompostionaLayout(){
        let layout =  UICollectionViewCompositionalLayout{ sectionIdex, environment in
            switch sectionIdex{
            case 0:
                return self.foodBannerSection()
            case 1:
                return self.foodCategorySection()
            case 2:
                return self.restaurantsListSection()
            default:
                return self.VeganSectionLayout()
            }
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
//MARK: - Food Banner Section
    func foodBannerSection()-> NSCollectionLayoutSection{

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item  =  NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .absolute(255))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)

        let section  = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.contentInsets =  NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 0)

        //animation
        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
             items.forEach { item in
             let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
             let minScale: CGFloat = 0.8
             let maxScale: CGFloat = 1.0
             let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
             item.transform = CGAffineTransform(scaleX: scale, y: scale)
             }
        }
        return section
    }
//MARK: - Food Category Section
    func foodCategorySection()-> NSCollectionLayoutSection {
           let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
           , heightDimension: .fractionalHeight(1))
           let item = NSCollectionLayoutItem(layoutSize: itemSize)
           
           let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
           , heightDimension: .absolute(90))
           let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize
           , subitems: [item])
           group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
           , bottom: 0, trailing: 15)
           
           let section = NSCollectionLayoutSection(group: group)
           section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15
           , bottom: 10, trailing: 0)
           section.orthogonalScrollingBehavior = .continuous // This line decide the direction of cell scroll in vertical or horizontal
           
           return section
       }
// MARK: - Restaurant List Section
    func restaurantsListSection()->NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
            , heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
            , heightDimension: .absolute(180))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize
            , subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
            , bottom: 8, trailing: 0)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15
            , bottom: 10, trailing: 15)
            
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30)), elementKind: "Header", alignment: .top),
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30)), elementKind: "Footer", alignment: .bottom)
        ]
            return section
        }
//MARK: - Vegan Restaurant
    func VeganSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(170), heightDimension: .absolute(50)), subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 60, trailing: -10)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        
        return section
    }
}
