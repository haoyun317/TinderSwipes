//
//  CardView.swift
//  TinderSwipes
//
//  Created by  謝皓昀 on 2024/8/10.
//

import SwiftUI

struct CardView: View {
    var person: String
    @State private var offset = CGSize.zero
    @State private var color: Color = .black
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 320, height: 420)
                .border(.white, width: 6.0)
                .cornerRadius(4)
                .foregroundStyle(color.opacity(0.9))
                .shadow(radius: 7)
            HStack {
                Text(person)
                    .font(.system(.largeTitle, design: .rounded, weight: .bold))
                    .foregroundStyle(Color.white)
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
            }
        }
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
        DragGesture()
            .onChanged { gesture in
                offset = gesture.translation
                withAnimation {
                    changeColor(width: offset.width)
                }
            }
            .onEnded { _ in
                withAnimation {
                    swipeCard(width: offset.width)
                    changeColor(width: offset.width)
                }
            })
    }
    
    func swipeCard(width: CGFloat) {
        switch width {
            case -500...(-150):
                print("\(person) removed")
                offset = CGSize(width: -500, height: 0)
            case 150...500:
                print("\(person) added")
                offset = CGSize(width: 500, height: 0)
            default:
                offset = .zero
        }
    }
    func changeColor(width: CGFloat) {
        switch width {
            case -500...(-130):
                color = .red
            case 130...500:
                color = .green
            default:
                color = .black
        }
    }
}

#Preview {
    CardView(person: "Lawrence")
}
