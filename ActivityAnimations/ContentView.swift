//
//  ContentView.swift
//  ActivityAnimations
//
//  Created by Karthick Selvaraj on 23/05/20.
//  Copyright © 2020 Mallow Technologies Private Limited. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var factor: CGFloat = 0.5
    @State private var shouldAnimate = false
    let timer = Timer.publish(every: 1.6, on: .main, in: .common).autoconnect()
    @State var leftOffset: CGFloat = -100
    @State var rightOffset: CGFloat = 100
    @State var leftOpa: Double = 0.7
    
    var body: some View {
        
        VStack {
            Spacer()
            Section {
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 20)
                        .offset(x: leftOffset)
                        .opacity(0.7)
                        .animation(Animation.easeInOut(duration: 1))
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 20)
                        .offset(x: leftOffset)
                        .opacity(0.7)
                        .animation(Animation.easeInOut(duration: 1).delay(0.2))
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 20)
                        .offset(x: leftOffset)
                        .opacity(0.7)
                        .animation(Animation.easeInOut(duration: 1).delay(0.4))
                }
                .onReceive(timer) { (_) in
                    swap(&self.leftOffset, &self.rightOffset)
                }
            }
            .padding(.bottom, 60)
            Section {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .frame(width: 80, height: 20)
                    .offset(x: shouldAnimate ? 100 : -100)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                    .onAppear {
                        self.factor = 1
                }
            }
            Spacer()
            Section {
                HStack(alignment: .center, spacing: shouldAnimate ? 15 : 5) {
                    Capsule(style: .continuous)
                        .fill(Color.blue)
                        .frame(width: 10, height: 50)
                    Capsule(style: .continuous)
                        .fill(Color.blue)
                        .frame(width: 10, height: 30)
                    Capsule(style: .continuous)
                        .fill(Color.blue)
                        .frame(width: 10, height: 50)
                    Capsule(style: .continuous)
                        .fill(Color.blue)
                        .frame(width: 10, height: 30)
                    Capsule(style: .continuous)
                        .fill(Color.blue)
                        .frame(width: 10, height: 50)
                }
                .frame(width: shouldAnimate ? 150 : 100)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
            }
            
            Spacer()
            Section {
                HStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 20)
                        .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever())
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 20)
                        .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.3))
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 20)
                        .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.6))
                }
            }
            Spacer()
            Section {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 30, height: 30)
                    .overlay(
                        ZStack {
                            Circle()
                                .stroke(Color.blue, lineWidth: 100)
                                .scaleEffect(shouldAnimate ? 1 : 0)
                            Circle()
                                .stroke(Color.blue, lineWidth: 100)
                                .scaleEffect(shouldAnimate ? 1.5 : 0)
                            Circle()
                                .stroke(Color.blue, lineWidth: 100)
                                .scaleEffect(shouldAnimate ? 2 : 0)
                        }
                        .opacity(shouldAnimate ? 0.0 : 0.2)
                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false))
                )
            }
            Spacer()
        }
        .onAppear {
            self.shouldAnimate = true
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
