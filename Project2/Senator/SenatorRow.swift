//
//  SenatorRow.swift
//  Project2
//
//  Created by IS 543 on 10/17/19.
//  Copyright © 2019 Student. All rights reserved.
//

import SwiftUI

struct SenatorRow: View {
    var senator: Senator
    
    var body: some View {
        HStack {
            //            Image(uiImage: UIImage(data: try! Data(contentsOf: senator.photo_url.url))!)
            senator.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(senator.name)
            
            Spacer()
        }
    }
}
struct SenatorRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SenatorRow(senator: SenList[14])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

