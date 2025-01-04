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
        updateCollectionView(with: [
            1,2,3,4,5,6,7,8,9,10,
            11,12,13,14,15,16,17,18,19,20,
            21,22,23,24,25,26,27,28,29,30,
            31,32,33,34,35,36,37,38,39,40,
            41,42,43,44,45,46,47,48,49,50,
        ])
    }
    private func setupCollectionView() {
        self.collectionView.register(CompositionalLayoutCollectionViewCell.nib, forCellWithReuseIdentifier: CompositionalLayoutCollectionViewCell.identifier)
        self.collectionView.dataSource = datasource
        self.collectionView.setCollectionViewLayout(self.setupLayout(), animated: true)
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
    
    private func setupLayout() -> UICollectionViewCompositionalLayout {
        
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
