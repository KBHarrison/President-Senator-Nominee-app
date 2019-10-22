//
//  PresidentRow.swift
//  Project2
//
//  Created by IS 543 on 10/19/19.
//  Copyright © 2019 Student. All rights reserved.
//
//
import SwiftUI

struct PresidentRow: View {
    var president: President
    
    var body: some View {
        HStack {
            president.image
                .resizable()
                .frame(width: 40, height: 50)
            
            Text(verbatim: president.name)
            Spacer()
        }
    }
}

struct PresidentRow_Previews: PreviewProvider {
    static var previews: some View {
        PresidentRow(president: PresList[0])
            .previewLayout(.fixed(width: 300, height: 70))
        
    }
}

