//
//  FilterHeader.swift
//  FoodDelivery
//
//  Created by codes orbit on 20/09/2023.
//

import UIKit


class RestaurantsHeaderView: UICollectionReusableView {
    
    //MARK: Properities
    
    static let headerIdentifier = "FilterHeaderView"
    
    var leadingConstraints: NSLayoutConstraint?
    var trailingConstraints: NSLayoutConstraint?
    
    
    lazy var allRestaurants : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label.withAlphaComponent(0.8)
        label.text = "All Restaurants".uppercased()
        label.font = UIFont.systemFont(ofSize: 15,weight: .bold)
        return label
    }()
    
   
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(allRestaurants)
        setUpConstrains()
    }
    
    func setUpConstrains(){
        NSLayoutConstraint.activate([
            allRestaurants.centerYAnchor.constraint(equalTo: centerYAnchor),            
        ])
        
        leadingConstraints = allRestaurants.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2)
        leadingConstraints?.isActive = true
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
