//
//  OrthogonalSectionVIewController.swift
//  CollectionView
//
//  Created by Codes Orbit on 28/01/2025.
//

import UIKit

class OrthogonalSectionVIewController: UIViewController {
    
    static let sectionBackgroundDecorationElementKind = "section-background-element-kind"
    
    static let badgeElementKind = "badge-element-kind"
    
    static var identifier: String {
        String(describing: self)
    }
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private lazy var datasource = createDatasource()
    
    enum Sections: Int, CaseIterable {
        case section1
        case section2
        case section3
        case section4
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        updateCollectionView()
    }
    
    func setupCollectionView() {
        self.collectionView.register(CompositionalLayoutCollectionViewCell.nib, forCellWithReuseIdentifier: CompositionalLayoutCollectionViewCell.identifier)
        self.collectionView.dataSource = datasource
        self.collectionView.setCollectionViewLayout(createLayout(), animated: true)
    }
    
    func createDatasource() -> UICollectionViewDiffableDataSource<Sections, Int> {
        let datasource = UICollectionViewDiffableDataSource<Sections, Int>(collectionView: self.collectionView) { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompositionalLayoutCollectionViewCell.identifier, for: indexPath) as? CompositionalLayoutCollectionViewCell
            cell?.config(text: "\(indexPath.item)")
            return cell ?? UICollectionViewCell()
        }
        
        let supplementaryRegistration = UICollectionView.SupplementaryRegistration
        <BadgeView>(elementKind: OrthogonalSectionVIewController.badgeElementKind) {
            (badgeView, string, indexPath) in
            
            badgeView.config("\(indexPath.item)")
            badgeView.isHidden = indexPath.item == 1
        }
        
        datasource.supplementaryViewProvider = {
            return self.collectionView.dequeueConfiguredReusableSupplementary(using: supplementaryRegistration, for: $2)
        }
        
        return datasource
    }
    
    func updateCollectionView() {
        var snapshot = NSDiffableDataSourceSnapshot<Sections, Int>()
        let data: [[Int]] = [
            Array(0...10),
            Array(11...20),
            Array(21...30),
            Array(31...40),
            Array(41...50),
            Array(51...60),
        ]
        
        Sections.allCases.forEach { section in
            snapshot.appendSections([section])
            snapshot.appendItems(data[section.rawValue])
        }
        datasource.apply(snapshot)
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        
        // we can update badge location size. example. update size so badge show at top x 0, y =0 , width = .fractionalWidth 1
        let badgeAnchor = NSCollectionLayoutAnchor(edges: [.top, .trailing], fractionalOffset: CGPoint(x: 0.3, y: -0.3))
        let badgeSize = NSCollectionLayoutSize(widthDimension: .absolute(20),
                                              heightDimension: .absolute(20))
        let badge = NSCollectionLayoutSupplementaryItem(
            layoutSize: badgeSize,
            elementKind: OrthogonalSectionVIewController.badgeElementKind,
            containerAnchor: badgeAnchor)
        
        let leadingItemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.7),
            heightDimension: .fractionalHeight(1.0)
        )
        let leadingItem = NSCollectionLayoutItem(layoutSize: leadingItemSize, supplementaryItems: [badge])
        leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        let trailingItemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.5) // Each item is half of the trailingGroup height
        )
        let trailingItem = NSCollectionLayoutItem(layoutSize: trailingItemSize)
        trailingItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        // Define trailing group size correctly
        let trailingGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.3), // 0.3 instead of 0.5
            heightDimension: .fractionalHeight(1.0) // Full height to fit 2 items
        )
        let trailingGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: trailingGroupSize,
            repeatingSubitem: trailingItem,
            count: 2
        )

        let containerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1), // Adjusted to match the second function
            heightDimension: .fractionalHeight(0.5) // Adjusted to match the second function
        )
        let container = NSCollectionLayoutGroup.horizontal(
            layoutSize: containerSize,
            subitems: [leadingItem, trailingGroup]
        )

        let section = NSCollectionLayoutSection(group: container)
        section.orthogonalScrollingBehavior = .continuous

        
        let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(
            elementKind: OrthogonalSectionVIewController.sectionBackgroundDecorationElementKind)
        sectionBackgroundDecoration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
        section.decorationItems = [sectionBackgroundDecoration]

        let layout = UICollectionViewCompositionalLayout(section: section)
        
        layout.register(
            SectionBackgroundView.self,
            forDecorationViewOfKind: OrthogonalSectionVIewController.sectionBackgroundDecorationElementKind)
        
        return layout
    }
}
