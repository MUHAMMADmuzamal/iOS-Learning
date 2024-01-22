//
//  ThirdViewController.swift
//  xibProject2
//
//  Created by codes orbit on 25/08/2023.
//

import UIKit

protocol ThirdViewControllerDelegate{
    func getData(data:FormModel)
}
class ThirdViewController: UIViewController {
    
    @IBOutlet weak var collectionView:UICollectionView!
    var items:[FormModel] = []
    var delegate:ThirdViewControllerDelegate?
    
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self        
    }
}

extension ThirdViewController: UICollectionViewDataSource{
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int{
        return self.items.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell{
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell{
            let item:FormModel = items[indexPath.item]
            
            cell.label?.text = "\(String(describing: item.username!)), \(String(describing: item.email!))"
            
            return cell
        }
        return UICollectionViewCell()
    }
}


extension ThirdViewController: UICollectionViewDelegate{
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ){
        delegate?.getData(data: items[indexPath.row])
        navigationController?.popToRootViewController(animated: true)
    }
}

extension ThirdViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
         let width = collectionView.bounds.width
         let numberOfItemsPerRow: CGFloat = 3
         let spacing: CGFloat = flowLayout.minimumInteritemSpacing
         let availableWidth = width - spacing * numberOfItemsPerRow
         let itemDimension = floor(availableWidth / numberOfItemsPerRow)
         return CGSize(width: itemDimension, height: itemDimension)
     }
}
