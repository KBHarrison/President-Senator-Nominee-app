//
//  SenatorDetail.swift
//  Project2
//
//  Created by IS 543 on 10/21/19.
//  Copyright © 2019 Student. All rights reserved.
//

import SwiftUI

struct SenatorDetail: View {
    @State private var showWikipedia = false
    var senator: Senator
    
    func formatDate(input: String?) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        var inputDate: Date?
        if let dateString = input {
            inputDate = dateformatter.date(from: dateString)
        }
        else {
            return "Error: Not found"
        }
        dateformatter.dateStyle = .long
        if let realDate = inputDate {
            return dateformatter.string(from: realDate)
        }
        else {
            return "Error: Not found"
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                senator.image
                    .resizable()
                    .frame(width: 250, height: 250)
                    .padding(.top, 10)
                Text(senator.name)
                    .font(.system(size: 30))
                
                HStack {
                    Text("State:")
                    Text(senator.state_name)
                }
                HStack {
                    Text("Date of Birth:")
                    Text(formatDate(input: senator.date_of_birth))
                }
                .padding(.bottom, 20)
                
                Text(senator.biography)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
            }
        }
        .navigationBarTitle(Text(verbatim: senator.name), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showWikipedia = true
        })
        {
            Image(systemName: "safari")
                .imageScale(.large)
        })
            .sheet(isPresented: self.$showWikipedia) {
                WikipediaView(wikiExtension: self.senator.wikiExtension)
                {
                    self.showWikipedia = false
                }
        }
        .padding()
    }
}

struct SenatorDetail_Previews: PreviewProvider {
    static var previews: some View {
        SenatorDetail(senator: SenList[0])
    }
}
