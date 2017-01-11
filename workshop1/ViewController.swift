//
//  ViewController.swift
//  workshop1
//
//  Created by Wei Fan on 1/9/17.
//  Copyright © 2017 Wei Fan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let scrollView = UIScrollView()
    let dog = UIImageView()
    let name = UILabel()
    let address = UILabel()
    let button = UIButton()
    var stackview = UIStackView()
    let viewModel = ViewModel()
    
    fileprivate var aspectRatio: CGFloat = 1
    fileprivate var regularConstraints = [NSLayoutConstraint]()
    fileprivate var compactConstraints = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
        addViews()
        setupConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func configViews() {
        scrollView.alwaysBounceVertical = true
        
        name.text = viewModel.name
        name.font = .systemFont(ofSize: 20)
        
        address.text = viewModel.address
        address.font = .systemFont(ofSize: 16)
        address.numberOfLines = 0
        
        dog.image = UIImage(named:viewModel.imageName)
        dog.contentMode = .scaleAspectFit
        if let image = dog.image {
            aspectRatio = image.size.height / image.size.width
        }
        
        button.setTitle(viewModel.buttonTitle, for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 20)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blue.cgColor
        
        stackview = createStackView()
    }
    
    func createStackView() -> UIStackView {
        var stackViews = [UIStackView]()
        
        for (key, value) in viewModel.stackViewContent {
            let keyLabel = UILabel()
            keyLabel.text = key
            keyLabel.textColor = .gray
            
            let valueLabel = UILabel()
            valueLabel.text = value
            
            var keyValue = [UILabel]()
            keyValue.append(keyLabel)
            keyValue.append(valueLabel)
            
            let stackView = UIStackView(arrangedSubviews: keyValue)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            
            stackView.distribution = .fillEqually
            
            stackViews.append(stackView)
        }
        
        let keyValues = UIStackView(arrangedSubviews: stackViews)
        keyValues.translatesAutoresizingMaskIntoConstraints = false
        keyValues.axis = .vertical
        keyValues.distribution = .equalSpacing
        
        return keyValues
    }
    
    func addViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(dog)
        scrollView.addSubview(name)
        scrollView.addSubview(address)
        scrollView.addSubview(button)
        scrollView.addSubview(stackview)
    }
    
    func setupConstraints() {
        setupScrollViewConstraints()
        setupDogConstraints()
        setupNameConstraints()
        setupAddressConstraints()
        setupButtonConstraints()
        setupStackViewConstraints()
    }
    
    func setupScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupDogConstraints() {
        dog.translatesAutoresizingMaskIntoConstraints = false
        dog.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        dog.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        dog.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        dog.heightAnchor.constraint(equalTo: dog.widthAnchor, multiplier: aspectRatio).isActive = true
    }
    
    func setupNameConstraints() {
        name.translatesAutoresizingMaskIntoConstraints = false
        name.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        name.topAnchor.constraint(equalTo: dog.bottomAnchor, constant:20).isActive = true
        
        compactConstraints.append(name.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40))
        
        regularConstraints.append(name.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.7))
    }
    
    func setupAddressConstraints() {
        address.translatesAutoresizingMaskIntoConstraints = false
        address.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        address.topAnchor.constraint(equalTo: name.bottomAnchor, constant:10).isActive = true
        
        compactConstraints.append(address.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40))
        
        regularConstraints.append(address.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.7))
    }
    
    func setupButtonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        compactConstraints.append(button.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20))
        compactConstraints.append(button.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40))
        compactConstraints.append(button.topAnchor.constraint(equalTo: address.bottomAnchor, constant:20))
        
        regularConstraints.append(button.leadingAnchor.constraint(equalTo: address.trailingAnchor, constant: 20))
        regularConstraints.append(button.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2))
        regularConstraints.append(button.topAnchor.constraint(equalTo: dog.bottomAnchor, constant: 20))
    }
    
    func setupStackViewConstraints() {
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20).isActive = true
        stackview.heightAnchor.constraint(equalToConstant: CGFloat(30 * stackview.subviews.count)).isActive = true
        stackview.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        stackview.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40).isActive = true
        
        compactConstraints.append(stackview.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20))
        
        regularConstraints.append(stackview.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 20))
    }
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.horizontalSizeClass == .regular {
            NSLayoutConstraint.deactivate(compactConstraints)
            NSLayoutConstraint.activate(regularConstraints)
        } else {
            NSLayoutConstraint.deactivate(regularConstraints)
            NSLayoutConstraint.activate(compactConstraints)
        }
    }

}

