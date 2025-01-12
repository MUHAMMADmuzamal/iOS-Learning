//
//  CollectionViewListController.swift
//  CollectionView
//
//  Created by Codes Orbit on 12/01/2025.
//

import UIKit

class CollectionViewListController: UIViewController {

    static var identifier: String {
        String(describing: self)
    }
    
    @IBOutlet private var collectionView: UICollectionView!
    
    enum Sections {
        case main
    }
    private lazy var datasource = configureDatasource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        updateCollectionView()
    }
    
    private func registerCell() {
        self.collectionView.register(DifferentHeightCell.nib, forCellWithReuseIdentifier: DifferentHeightCell.identifier)
        self.collectionView.dataSource = datasource
        self.collectionView.setCollectionViewLayout(layout(), animated: true)
    }

    private func configureDatasource() -> UICollectionViewDiffableDataSource<Sections, Int> {
        let datasource = UICollectionViewDiffableDataSource<Sections, Int>(collectionView: self.collectionView) { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DifferentHeightCell.identifier, for: indexPath) as? DifferentHeightCell
            cell?.config(height: CGFloat(itemIdentifier) * 10)
            return cell
        }
        return datasource
    }
    
    private func updateCollectionView() {
        let dataArray: [Int] = Array(30...50) + Array(1...20) + Array(21...29)
        var snapShot = NSDiffableDataSourceSnapshot<Sections, Int>()
        snapShot.appendSections([.main])
        snapShot.appendItems(dataArray)
        self.datasource.apply(snapShot)
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        return listLayout()
    }
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
}
