//
//  URLExtension.swift
//  Project2
//
//  Created by IS 543 on 10/19/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

extension String {
    var url: URL {
        if let urlValue = URL(string: self) {
            return urlValue
        }
        
        fatalError("Unable to convert URL to string")
    }
}
