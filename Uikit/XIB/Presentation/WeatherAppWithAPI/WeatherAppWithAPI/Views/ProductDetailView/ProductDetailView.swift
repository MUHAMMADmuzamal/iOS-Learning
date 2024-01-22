//
//  ProductDetailView.swift
//  WeatherAppWithAPI
//
//  Created by codes orbit on 06/09/2023.
//

import UIKit

class ProductDetailView: UIViewController {

    var product:Product?
    
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var category:UILabel!
    @IBOutlet weak var price:UILabel!
    @IBOutlet weak var discountpercentage:UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var brand:UILabel!
    @IBOutlet weak var instock:UILabel!
    @IBOutlet weak var descriptionLabel:UILabel!
    @IBOutlet weak var image:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = product?.title
        self.category.text = product?.category
        self.price.text = String(describing: product!.price)
        self.discountpercentage.text = String(describing: product!.discountPercentage)
        self.rating.text = String(describing: product!.rating)
        self.brand.text = product?.brand
        self.instock.text = String(describing: product!.stock)
        self.descriptionLabel.text = product?.description
        self.image.load(url: URL(string: (product?.images[0])!)!)
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
