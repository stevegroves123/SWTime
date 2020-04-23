//
//  ContentView.swift
//  SWTime WatchKit Extension
//
//  Created by steve groves on 12/04/2020.
//  Copyright © 2020 steve groves. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var date = Date()
    @State var rotationEffect = 0.0
    @State var scrollAmount = 0.0
    let colours: [Int: Color] = [
        0 : Color.red,
        1 : Color.blue,
        2 : Color.green,
        3 : Color.yellow,
        4 : Color.white,
        5 : Color.pink,
        6 : Color.gray,
        7 : Color.orange
    ]
    
    var timeFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss a"
        return formatter
    }
    
    func timeString(date: Date) -> String {
             let time = timeFormat.string(from: date)
             return time
        }
    
    var updateTimer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in self.date = Date() })
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack(alignment: .trailing) {
                Advert()
                Text("\(timeString(date: date))")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .onAppear(perform: {let _ = self.updateTimer})
                }
                .foregroundColor(colours[Int(scrollAmount)])
                    
                .rotation3DEffect(.degrees(rotationEffect), axis: (x: 1, y: 0, z: 0))
                .onTapGesture {
                    if self.rotationEffect == 0 {
                       self.rotationEffect += 45
                    } else {
                        self.rotationEffect = 0
                    }
                }
            
                .focusable(true)
                .digitalCrownRotation($scrollAmount, from: 0, through: 7, by: 1, sensitivity: .low, isContinuous: true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
