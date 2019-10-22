//
//  SenatorList.swift
//  Project2
//
//  Created by IS 543 on 10/21/19.
//  Copyright © 2019 Student. All rights reserved.
//

import SwiftUI



struct SenatorList: View {
    @State var image = Image("person-placeholder.jpg")
    var body: some View {
        NavigationView {
            List(SenList) { senator in
                NavigationLink(destination: SenatorDetail(senator: senator)) {
                    SenatorRow(senator: senator)
                }
            }
            .navigationBarTitle("Current Senators")
            
        }
    }
    
    struct SenatorList_Previews: PreviewProvider {
        static var previews: some View {
            SenatorList()
        }
    }
}
