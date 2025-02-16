//
//  ViewController.swift
//  Learning
//
//  Created by Codes Orbit on 21/12/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var parentView: UIView!
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Hello", for: .normal)
        button.backgroundColor = .lightGray
        button.setImage(UIImage(systemName: "house"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false // Important for Auto Layout
        return button
    }()
    
    private let childView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false // Important for Auto Layout
        return view
    }()
    
    private let childView1: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false // Important for Auto Layout
        return view
    }()
    
    private let scrollChildView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false // Important for Auto Layout
        return view
    }()
    
    private let VStack: UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.distribution = .fill
        vStack.spacing = 10 // Optional: Adds spacing between child views
        vStack.translatesAutoresizingMaskIntoConstraints = false // Important for Auto Layout
        return vStack
    }()
    
    private let scrollVIew: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        self.parentView.backgroundColor = .brown
        
        // Add stack view to parent view
        self.parentView.addSubview(VStack)
        NSLayoutConstraint.activate([
            self.VStack.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 10),
            self.VStack.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -10),
            self.VStack.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 10),
            self.VStack.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -10)
        ])
        
        // Add child view to stack view
        self.VStack.addArrangedSubview(childView)
        
        // Set height for childView
        childView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        // Add button to childView
        self.childView.addSubview(button)
        NSLayoutConstraint.activate([
            self.button.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 50),
            self.button.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -50),
            self.button.topAnchor.constraint(equalTo: childView.topAnchor, constant: 10),
            self.button.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: -10)
        ])
        
        // Add child view to stack view
        self.VStack.addArrangedSubview(childView1)
        self.childView1.addSubview(scrollVIew)
        NSLayoutConstraint.activate([
            self.scrollVIew.leadingAnchor.constraint(equalTo: childView1.leadingAnchor, constant: 10),
            self.scrollVIew.trailingAnchor.constraint(equalTo: childView1.trailingAnchor, constant: -10),
            self.scrollVIew.topAnchor.constraint(equalTo: childView1.topAnchor, constant: 10),
            self.scrollVIew.bottomAnchor.constraint(equalTo: childView1.bottomAnchor, constant: -10)
        ])
        
        self.scrollVIew.addSubview(scrollChildView)
        scrollChildView.heightAnchor.constraint(equalToConstant: 1500).isActive = true
        scrollChildView.widthAnchor.constraint(equalTo: scrollVIew.frameLayoutGuide.widthAnchor, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.activate([
            self.scrollChildView.leadingAnchor.constraint(equalTo: scrollVIew.contentLayoutGuide.leadingAnchor, constant: 0),
            self.scrollChildView.trailingAnchor.constraint(equalTo: scrollVIew.contentLayoutGuide.trailingAnchor, constant: 0),
            self.scrollChildView.topAnchor.constraint(equalTo: scrollVIew.contentLayoutGuide.topAnchor, constant: 0),
            self.scrollChildView.bottomAnchor.constraint(equalTo: scrollVIew.contentLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
}

