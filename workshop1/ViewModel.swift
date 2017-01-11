//
//  ViewModel.swift
//  workshop1
//
//  Created by Wei Fan on 1/9/17.
//  Copyright © 2017 Wei Fan. All rights reserved.
//

import Foundation

class ViewModel: NSObject {
    
    var imageName: String {
        return "dog.jpg" // 自己在工程里面放一张图即可
    }
    
    var name: String {
        return "Name"
    }
    
    var address: String {
        return "Multiple lines address. Multiple lines address. Multiple lines address. Multiple lines address. Multiple lines address"
    }
    
    var buttonTitle: String {
        return "Click"
    }
    
    var stackViewContent: Array<(String, String)> {
        return [
            ("key1", "value1"),
            ("key2", "value2"),
            ("key3", ""),
            ("key4", "value4")
            ].filter({key, value -> Bool in
                return !value.isEmpty
            })
    }
}
