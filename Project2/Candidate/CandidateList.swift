//
//  CandidateList.swift
//  Project2
//
//  Created by IS 543 on 10/21/19.
//  Copyright © 2019 Student. All rights reserved.
//

import SwiftUI

struct CandidateList: View {
    var body: some View {
        NavigationView {
            List(CandList) { candidate in
                NavigationLink(destination: CandidateDetail(candidate: candidate)) {
                    CandidateRow(candidate: candidate)
                    
                }
                .navigationBarTitle("2020 Challengers")
            }
        }
    }
    
    struct CandidateList_Previews: PreviewProvider {
        static var previews: some View {
            CandidateList()
        }
    }
}
