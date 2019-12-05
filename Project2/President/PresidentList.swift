//
//  ListView.swift
//  Project2
//
//  Created by Student on 10/15/19.
//  Copyright © 2019 Student. All rights reserved.
//

import SwiftUI

struct PresidentList: View {
    var body: some View {
        NavigationView {
            List(PresList) { president in
                NavigationLink(destination: PresidentDetail(president: president)) {
                    PresidentRow(president: president)
                    
                }
                .navigationBarTitle("Presidents")
            }
        }
    }
    
    
    
    
    struct PresidentList_Previews: PreviewProvider {
        static var previews: some View {
            PresidentList()
        }
    }
}
