//
//  President.swift
//  Project2
//
//  Created by IS 543 on 10/19/19.
//  Copyright © 2019 Student. All rights reserved.
//

import SwiftUI

struct President: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var birth_year: Int
    var death_year: Int?
    var took_office: String
    var left_office: String?
    var party: String
    var image_name: String
    var bio: String
    
    
}

extension President {
    var image: Image {
        ImageStore.shared.image(name: image_name)
    }
}
