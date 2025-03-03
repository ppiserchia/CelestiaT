//
//  ConnectWithLineView.swift
//  CreateAConstellation
//
//  Created by Gina Saviano on 03/03/25.
//

import SwiftUI

struct ConnectWithLineView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Draw the connecting lines
                Path { path in
                    let circle1center = CGPoint(
                        x: geometry.size.width * 0.3,
                        y: geometry.size.height * 0.5)
                    let circle2center = CGPoint(
                        x: geometry.size.width * 0.5,
                        y: geometry.size.height * 0.3)
                    let circle3center = CGPoint(
                        x: geometry.size.width * 0.7,
                        y: geometry.size.height * 0.5)
                    
                    path.move(to: circle1center)
                    path.addLine(to: circle2center)
                    path.addLine(to: circle3center)
                }
                .stroke(Color.blue, lineWidth: 3)
                
                //Draw the circles
                Circle()
                    .fill(Color.red)
                    .frame(width: 30, height: 30)
                    .position(x: geometry.size.width * 0.3, y: geometry.size.height * 0.5)
                
                Circle()
                    .fill(Color.green)
                    .frame(width: 30, height: 30)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.3)
                
                Circle()
                    .fill(Color.blue)
                    .frame(width: 30, height: 30)
                    .position(x: geometry.size.width * 0.7, y: geometry.size.height * 0.5)
                
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 30, height: 30)
                    .position(x: geometry.size.width * 0.3, y: geometry.size.height * 0.7)
                
                Circle()
                    .fill(Color.green)
                    .frame(width: 30, height: 30)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.3)
                
                Circle()
                    .fill(Color.blue)
                    .frame(width: 30, height: 30)
                    .position(x: geometry.size.width * 0.7, y: geometry.size.height * 0.5)
            }
            
        }
    }
}


//MARK: - PREVIEW
#Preview {
    ConnectWithLineView()
}
