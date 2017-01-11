//
//  KeyValueStackView.swift
//  workshop1
//
//  Created by Wei Fan on 1/11/17.
//  Copyright © 2017 Wei Fan. All rights reserved.
//

import UIKit

class KeyValuesStackView: UIStackView {
    
    func configStackView(viewModel: ViewModel) {
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
            
            addArrangedSubview(stackView)
        }
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        distribution = .equalSpacing
    }
    
}
