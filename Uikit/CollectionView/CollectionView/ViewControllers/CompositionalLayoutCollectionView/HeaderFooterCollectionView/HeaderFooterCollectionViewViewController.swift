//
//  HeaderFooterCollectionViewViewController.swift
//  CollectionView
//
//  Created by Codes Orbit on 28/01/2025.
//

import UIKit

class HeaderFooterCollectionViewViewController: UIViewController {

    static var identifier: String {
        String(describing: self)
    }
    
    @IBOutlet private var collectionView: UICollectionView!
    private lazy var datasource = configureDataSource()
    
    static let sectionHeaderElementKind = "section-header"
        static let sectionFooterElementKind = "section-footer"
    
    enum Sections: Int, CaseIterable {
        case section1
        case section2
        case section3
        case section4
        case section5
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        updateCollectionView()
    }
    
    func setupCollectionView() {
        self.collectionView.register(HeaderFooterCell.nib, forCellWithReuseIdentifier: HeaderFooterCell.identifier)
        self.collectionView.register(CompositionalLayoutCollectionViewCell.nib, forCellWithReuseIdentifier: CompositionalLayoutCollectionViewCell.identifier)
        self.collectionView.dataSource = datasource
        self.collectionView.setCollectionViewLayout(setupLayout(), animated: true)
    }
    
    func configureDataSource() -> UICollectionViewDiffableDataSource<Sections, Int> {
        let dataSource = UICollectionViewDiffableDataSource<Sections, Int>(collectionView: self.collectionView, cellProvider: {collectionView, indexPath, itemIdentifier in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompositionalLayoutCollectionViewCell.identifier, for: indexPath) as? CompositionalLayoutCollectionViewCell
            
            cell?.config(text: "\(itemIdentifier)")
            
            return cell ?? UICollectionViewCell()
        })
        
        // Register header and footer
             let headerRegistration = UICollectionView.SupplementaryRegistration<HeaderFooterCell>(
                 elementKind: Self.sectionHeaderElementKind
             ) { (headerView, kind, indexPath) in
                 headerView.config(kind + " \(indexPath.section)")
             }
             
             let footerRegistration = UICollectionView.SupplementaryRegistration<HeaderFooterCell>(
                 elementKind: Self.sectionFooterElementKind
             ) { (footerView, kind, indexPath) in
                 footerView.config(kind + " \(indexPath.section)")
             }
        
        // Set supplementary view provider
           dataSource.supplementaryViewProvider = { (collectionView, kind, indexPath) in
               if kind == Self.sectionHeaderElementKind {
                   let header =  collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: indexPath)
                   
                   return header
               } else if kind == Self.sectionFooterElementKind {
                   let footer =  collectionView.dequeueConfiguredReusableSupplementary(using: footerRegistration, for: indexPath)
                   
                   return footer
               }
               return nil
           }
        
        return dataSource
    }
    
    private func updateCollectionView() {
        var snapShot = NSDiffableDataSourceSnapshot<Sections, Int>()
        let data: [[Int]] = [
            Array(0...10),
            Array(11...20),
            Array(21...30),
            Array(31...40),
            Array(41...50),
        ]
        Sections.allCases.forEach { section in
            snapShot.appendSections([section])
            snapShot.appendItems(data[section.rawValue])
        }
        
        datasource.apply(snapShot)
        
    }
    
    
    private func setupLayout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                     heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: HeaderFooterCollectionViewViewController.sectionHeaderElementKind, alignment: .top)
        let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: HeaderFooterCollectionViewViewController.sectionFooterElementKind, alignment: .bottom)
        section.boundarySupplementaryItems = [sectionHeader, sectionFooter]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }


}
