//
//  CandidateDetail.swift
//  Project2
//
//  Created by IS 543 on 10/21/19.
//  Copyright © 2019 Student. All rights reserved.
//

import SwiftUI

struct CandidateDetail: View {
    var candidate: Candidate
    @State var showWikipedia = false
    var body: some View {
        ScrollView {
            VStack {
                candidate.image
                    .resizable()
                    .frame(width: 150, height: 250)
                    .padding(.top, 10)
                
                Text(candidate.name)
                    .font(.system(size: 30))
                
                HStack {
                    Text("Home State:")
                    Text(candidate.state)
                }
                HStack {
                    Text("Ethnicity:")
                    Text(candidate.ethnicity)
                }
                .padding(.bottom, 20)
                
                Text(candidate.bio)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
            }
        }
        .navigationBarTitle(Text(verbatim: candidate.name), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showWikipedia = true
        })
        {
            Image(systemName: "safari")
                .imageScale(.large)
        })
            .sheet(isPresented: self.$showWikipedia) {
                WikipediaView(wikiExtension: self.candidate.name.replacingOccurrences(of: " ", with: "_"))
                {
                    self.showWikipedia = false
                }
        }
        .padding()
        
    }
}


struct CandidateDetail_Previews: PreviewProvider {
    static var previews: some View {
        CandidateDetail(candidate:CandList[8])
    }
}
