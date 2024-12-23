//
//  ViewController.swift
//  CollectionView
//
//  Created by Codes Orbit on 22/12/2024.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet private weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(CollectionViewCell.nib, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
////        layout.minimumInteritemSpacing = 0
////        layout.minimumLineSpacing = 0
////        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.collectionView.setCollectionViewLayout(layout, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        cell.config(count: indexPath.item)
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 10
        return CGSize(width: width, height: UICollectionViewFlowLayout.automaticSize.height) // Automatic height
    }
}

