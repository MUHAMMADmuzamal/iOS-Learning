//
//  ViewController.swift
//  CollectionView
//
//  Created by Codes Orbit on 22/12/2024.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var dataSource:[(CGFloat, CGFloat)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        for _ in 0...50 {
            dataSource.append((CGFloat.random(in: 0...500), CGFloat.random(in: 0...200)))
        }
    }
    
    func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(CollectionViewCell.nib, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        self.collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize //  this will auto adjust width height according to cell height width.
        
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        self.collectionView.setCollectionViewLayout(layout, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
        cell.config(heightValue: dataSource[indexPath.item].0, widthValue: self.collectionView.frame.width - 10)
        return cell
    }
}


class CustomCollectionViewCell: UICollectionViewCell {
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    static var identifier: String {
        return String(describing: Self.self)
    }
    
    static var nib: UINib {
        UINib(nibName: self.identifier, bundle: nil)
    }
    
    var mainView: UIView = {
        return UIView()
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .red
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    var leftView: UIView = {
       let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    var label: UILabel = {
       let label = UILabel()
        label.text = "abcdefghijklmnopqrstuvwxyz-abcdefghijklmnopqrstuvwxyz-abcdefghijklmnopqrstuvwxyz-"
        label.numberOfLines = 0
        return label
    }()
    
    func setupUI() {
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        self.addSubview(mainView)
        self.mainView.addSubview(stackView)
        self.stackView.addArrangedSubview(leftView)
        self.stackView.addArrangedSubview(label)
    }
    
    func setupConstraints() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        leftView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: self.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            mainView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -10),
            
            leftView.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func config(heightValue: CGFloat, widthValue: CGFloat){
        self.mainView.heightAnchor.constraint(equalToConstant: heightValue).isActive = true
//        self.mainView.widthAnchor.constraint(equalToConstant: widthValue).isActive = true
    }
}
