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
    
    var body: some View {
        ZStack {
            Arc(sAngle: .degrees(0), eAngle: .degrees(80), clockwise: false)
                .stroke(Color.yellow, style: StrokeStyle(lineWidth: 20, lineCap: .round))
            Arc(sAngle: .degrees(90), eAngle: .degrees(170), clockwise: false)
                .stroke(Color.green, style: StrokeStyle(lineWidth: 20, lineCap: .round))
            Arc(sAngle: .degrees(180), eAngle: .degrees(260), clockwise: false)
                .stroke(Color.orange, style: StrokeStyle(lineWidth: 20, lineCap: .round))
            Arc(sAngle: .degrees(270), eAngle: .degrees(350), clockwise: false)
                .stroke(Color.pink, style: StrokeStyle(lineWidth: 20, lineCap: .round))
        }
        .rotationEffect(self.shouldAnimate ? .degrees(360) : .zero)
        .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
        .frame(width: 300, height: 300)
        .onAppear {
            self.shouldAnimate = true
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

