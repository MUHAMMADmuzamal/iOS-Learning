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
    
    enum Sections: Int, CaseIterable {
        case section1
        case section2
        case section3
        case section4
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
        updateCollectionView()
    }
    private func setupCollectionView() {
        self.collectionView.register(CompositionalLayoutCollectionViewCell.nib, forCellWithReuseIdentifier: CompositionalLayoutCollectionViewCell.identifier)
        self.collectionView.dataSource = datasource
        self.collectionView.setCollectionViewLayout(self.setupMultiSectionLayout(), animated: true)
    }
    
    private func configureDatasource() -> UICollectionViewDiffableDataSource<Sections, Int> {
        let datasource = UICollectionViewDiffableDataSource<Sections, Int>(collectionView: self.collectionView, cellProvider: {collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompositionalLayoutCollectionViewCell.identifier, for: indexPath) as? CompositionalLayoutCollectionViewCell else { return UICollectionViewCell()}
            cell.config(text: "S\(indexPath.section)-\(itemIdentifier)")
            return cell
        })
        
        return datasource
    }
    
    private func updateCollectionView() {
        var snapShot = NSDiffableDataSourceSnapshot<Sections, Int>()
        let data: [[Int]] = [
            Array(0...10),
            Array(11...20),
            Array(21...30),
            Array(31...40),
        ]
        Sections.allCases.forEach { section in
            snapShot.appendSections([section])
            snapShot.appendItems(data[section.rawValue])
        }
        
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

//MARK: MultiSection
extension CompositionalLayoutCollectionViewController {
    private func setupMultiSectionLayout() -> UICollectionViewCompositionalLayout {
        
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
        layoutEnvironment: NSCollectionLayoutEnvironment) in
            
            let sectionEnum = Sections(rawValue: sectionIndex)
            
            switch sectionEnum {
            case .section1:
                return self.section1Layout()
            case .section2:
                return self.section2Layout()
            case .section3:
                return self.section3Layout()
            default:
                return self.defaultSectionLayout()
            }
        }
        return layout
    }
    
    private func section1Layout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }   
    
    private func section2Layout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func section3Layout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        return section
    }
    
    private func defaultSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item, item])
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.orthogonalScrollingBehavior = .paging
        return section
    }
}
