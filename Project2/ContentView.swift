//
//  ContentView.swift
//  Project2
//
//  Created by Student on 10/14/19.
//  Copyright © 2019 Student. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PresidentList()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Presidents")
            }
            CandidateList()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("2020 Challengers")
            }
            SenatorList()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Senators")
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
