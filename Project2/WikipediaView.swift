//
//  WikipediaView.swift
//  Project2
//
//  Created by IS 543 on 10/21/19.
//  Copyright © 2019 Student. All rights reserved.
//

import SwiftUI

import WebKit
struct WikipediaView: UIViewRepresentable {
    
    let wikiExtension: String
    var onDismiss: () -> ()
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let urlString = "https://en.wikipedia.org/wiki/" + wikiExtension
        let request = URLRequest(url: urlString.url)
        uiView.load(request)
    }
    
}

struct WikipediaView_Previews: PreviewProvider {
    static var previews: some View {
        WikipediaView(wikiExtension: "George_Washington") {}
    }
}

