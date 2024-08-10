//
//  ContentView.swift
//  TinderSwipes
//
//  Created by  謝皓昀 on 2024/8/10.
// 模仿 swipe card動畫 用的也是 DragGesture()

import SwiftUI

struct ContentView: View {
    private var people: [String] = ["Rachel", "Ollie", "Lawrence", "Jane", "Swift"].reversed()
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(people, id: \.self) { person in
                    CardView(person: person)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
