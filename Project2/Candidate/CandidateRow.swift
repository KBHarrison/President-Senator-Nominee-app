//
//  CandidateRow.swift
//  Project2
//
//  Created by IS 543 on 10/21/19.
//  Copyright © 2019 Student. All rights reserved.
//

import SwiftUI

struct CandidateRow: View {
    var candidate: Candidate
    var body: some View {
        HStack {
            candidate.image
                .resizable()
                .frame(width: 30, height: 50)
            
            Text(verbatim: candidate.name)
            Spacer()
        }
    }
}

struct CandidateRow_Previews: PreviewProvider {
    static var previews: some View {
        CandidateRow(candidate: CandList[0])
            .previewLayout(.fixed(width: 300, height: 70))
        
    }
}
