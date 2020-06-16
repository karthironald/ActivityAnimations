//
//  ArcView.swift
//  ActivityAnimations
//
//  Created by Karthick Selvaraj on 15/06/20.
//  Copyright © 2020 Mallow Technologies Private Limited. All rights reserved.
//

import SwiftUI

struct ArcView: View {
    
    @State var shouldAnimate: Bool = false
    var timer = Timer.publish(every: 0.25, on: .main, in: .default).autoconnect()
    @State var progress: CGFloat = 0
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color.secondary.opacity(0.5), style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .frame(width: 200, height: 200)
                    .padding(50)
                Circle()
                    .trim(from: 0, to: progress / 100.0)
                    .stroke(Color.green, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(-90))
                    .padding(50)
                    .overlay(
                        Text("\(Int(progress)) %")
                            .font(.largeTitle)
                            .bold()
                            .frame(width: 200, height: 200)
                            .animation(nil)
                    )
                    .onReceive(timer) { (_) in
                        if self.progress == 100 {
                            self.progress = 0
                        }
                        withAnimation(Animation.spring().speed(1)) {
                            self.progress += 10
                        }
                }
            }
            
            ZStack {
                Arc(sAngle: .degrees(0), eAngle: .degrees(70), clockwise: false)
                    .stroke(Color.yellow, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                Arc(sAngle: .degrees(90), eAngle: .degrees(160), clockwise: false)
                    .stroke(Color.green, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                Arc(sAngle: .degrees(180), eAngle: .degrees(250), clockwise: false)
                    .stroke(Color.orange, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                Arc(sAngle: .degrees(270), eAngle: .degrees(340), clockwise: false)
                    .stroke(Color.pink, style: StrokeStyle(lineWidth: 20, lineCap: .round))
            }
            .rotationEffect(self.shouldAnimate ? .degrees(360) : .zero)
            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
            .frame(width: 200, height: 200)
            .onAppear {
                self.shouldAnimate = true
            }
        }
    }
    
}

struct Arc: Shape {
    var sAngle: Angle
    var eAngle: Angle
    var clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: sAngle, endAngle: eAngle, clockwise: clockwise)
        return path
    }
}

struct ArcView_Previews: PreviewProvider {
    static var previews: some View {
        ArcView()
    }
}

