//
//  Candidate.swift
//  Project2
//
//  Created by IS 543 on 10/18/19.
//  Copyright © 2019 Student. All rights reserved.
//

import SwiftUI


struct Candidate: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var wiki: String
    var image_name: String
    var bio: String
    var state: String
    var ethnicity: String
}

extension Candidate {
    var image: Image {
        ImageStore.shared.image(name: image_name)
    }
}
