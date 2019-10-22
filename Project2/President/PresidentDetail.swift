//
//  PresidentDetail.swift
//  Project2
//
//  Created by IS 543 on 10/19/19.
//  Copyright © 2019 Student. All rights reserved.
//

import SwiftUI

struct PresidentDetail: View {
    var president: President
    @State private var showWikipedia = false
    let dashBetweenDates: String = "-"
    
    func formatDate(input: String?) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        var inputDate: Date?
        if let dateString = input {
            
            inputDate = dateformatter.date(from: dateString)
            
        }
        else {
            return "Present"
        }
        dateformatter.dateStyle = .long
        if let realDate = inputDate {
            return dateformatter.string(from: realDate)
        }
        else {
            return "Present"
        }
    }
    
    
    var body: some View {
        ScrollView {
            VStack {
                president.image
                    .resizable()
                    .frame(width: 200, height: 250)
                    .padding(.top, 10)
                
                Text(president.name)
                    .font(.system(size: 30))
                HStack {
                    Text(formatDate(input: president.took_office))
                    Text(dashBetweenDates)
                        .bold()
                    Text(formatDate(input: president.left_office))
                }
                HStack {
                    Text("Party:")
                    Text(president.party)
                    
                }
                .padding(.bottom, 20)
            }
            Text(president.bio)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
        }
        .padding()
        .navigationBarTitle(Text(president.name)
            , displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showWikipedia = true
            })
            {
                Image(systemName: "safari")
                    .imageScale(.large)
            })
            .sheet(isPresented: self.$showWikipedia) {
                WikipediaView(wikiExtension: self.president.name.replacingOccurrences(of: " ", with: "_"))
                {
                    self.showWikipedia = false
                }
        }
        
        
        
        
    }
    
    struct PresidentDetail_Previews: PreviewProvider {
        static var previews: some View {
            PresidentDetail(president: PresList[1])
        }
    }
}
