//
//  Advert.swift
//  SWTime WatchKit Extension
//
//  Created by steve groves on 12/04/2020.
//  Copyright © 2020 steve groves. All rights reserved.
//

import SwiftUI

struct Advert: View {
        var body: some View {
            HStack {
                    Text("steve")
                        .font(.body)
                        .padding(.trailing, -8.0)
                    Text("2")
                        .font(.system(size: 12))
                        .baselineOffset(6.0)
                }
            .foregroundColor(.blue)
        }
    }

struct Advert_Previews: PreviewProvider {
    static var previews: some View {
        Advert()
    }
}
