//
//  Senator.swift
//  Project2
//
//  Created by Student on 10/16/19.
//  Copyright © 2019 Student. All rights reserved.
//

import SwiftUI

struct Senator: Hashable, Codable, Identifiable {
    
    
    var state_name: String
    var state_name_slug: String
    var state_code: String
    var state_code_slug: String
    var id: String
    var thomas: String?
    var opensecrets: String
    var votesmart: String
    var fec: String?
    var maplight: String?
    var wikidata: String?
    var google_entity_id: String?
    var title: String
    var party: String
    var name: String
    var name_slug: String
    var first_name: String
    var middle_name: String?
    var last_name: String
    var name_suffix: String?
    var goes_by: String?
    var pronunciation: String
    var gender: String
    var ethnicity: String
    var religion: String
    var openly_lgbtq: String
    var date_of_birth: String
    var entered_office: String
    var term_end: String
    var biography: String
    var phone: String
    var fax: String?
    var latitude: String
    var longitude: String
    var address_complete: String
    var address_number: String?
    var address_prefix: String?
    var address_street: String
    var address_sec_unit_type: String?
    var address_sec_unit_num: String?
    var address_city: String
    var address_state: String
    var address_zipcode: String
    var address_type: String
    var website: String?
    var contact_page: String?
    var facebook_url: String?
    var twitter_handle: String?
    var twitter_url: String?
    var photo_url: String
    
    
}

extension Senator {
    var image: Image {
        ImageStore.shared.image(name: state_code_slug + "-" + name_slug + "-" + party)
    }
}

extension Senator {
    var wikiExtension: String {
        if let test = wikidata {
            return name.replacingOccurrences(of: " ", with: "_") + test
        }
        else {
            return name.replacingOccurrences(of: " ", with: "_")
        }
    }
}
