//
//  CompositionalLayoutCollectionViewController.swift
//  CollectionView
//
//  Created by Codes Orbit on 04/01/2025.
//

import UIKit

class CompositionalLayoutCollectionViewController: UIViewController {
    
    static var identifier: String {
        String(describing: self)
    }
    
    @IBOutlet private var collectionView: UICollectionView!
    
    private lazy var datasource = configureDatasource()
    
    enum Sections {
        case main
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGrid()
        // Do any additional setup after loading the view.
    }

}

// MARK: GRID
extension CompositionalLayoutCollectionViewController {
    
    private func setupGrid() {
        setupCollectionView()
        updateCollectionView(with: Array(1...50))
    }
    private func setupCollectionView() {
        self.collectionView.register(CompositionalLayoutCollectionViewCell.nib, forCellWithReuseIdentifier: CompositionalLayoutCollectionViewCell.identifier)
        self.collectionView.dataSource = datasource
        self.collectionView.setCollectionViewLayout(self.setupTwoColumnLayout(), animated: true)
    }
    
    private func configureDatasource() -> UICollectionViewDiffableDataSource<Sections, Int> {
        let datasource = UICollectionViewDiffableDataSource<Sections, Int>(collectionView: self.collectionView, cellProvider: {collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompositionalLayoutCollectionViewCell.identifier, for: indexPath) as? CompositionalLayoutCollectionViewCell else { return UICollectionViewCell()}
            cell.config(count: itemIdentifier)
            return cell
        })
        
        return datasource
    }
    
    private func updateCollectionView(with model: [Int]) {
        var snapShot = NSDiffableDataSourceSnapshot<Sections, Int>()
        snapShot.appendSections([.main])
        snapShot.appendItems(model)
        datasource.apply(snapShot)
        
    }
    
    private func setupGridLayout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        group.interItemSpacing = .fixed(1.0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 5
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

//MARK: Item insets
extension CompositionalLayoutCollectionViewController {
    private func setupItemInsetsLayout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

//MARK: Two Column
extension CompositionalLayoutCollectionViewController {
    private func setupTwoColumnLayout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item , count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}
