//
//  SecondOnBoardingView.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 12/03/25.
//
import SwiftUI

struct SecondOnBoardingView: View {
    var body: some View {
        ZStack {
            Image("T")
            
            Rectangle()
                .foregroundColor(.nightSkyBlackCenter)
                .cornerRadius(15)
                .frame(width: 210, height: 100)
                .offset(x: -65, y: -224)
            
            Rectangle()
//                .background(.thinMaterial)
                .foregroundColor(.white)
                .cornerRadius(50)
                .frame(width: 370, height: 500)
            
            VStack {
                Text("Have you ever felt alone?")
                    .bold()
                    .font(.largeTitle)
                    .font(.system(size: 50, weight: .regular))
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: 350)
                    .multilineTextAlignment(.leading)
                    .padding(.top)
                
                Text("""
                Lore ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor quam id massa faucibus dignissim. Nullam eget metus id nisl malesuada condimentum. Nam viverra fringilla erat, ut fermentum nunc feugiat eu.
                """)
                    .frame(width: 340, height: 120)
                    .multilineTextAlignment(.leading)
 
                
                Text("""
Lore ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor quam id massa faucibus dignissim. Nullam eget metus id nisl malesuada condimentum. Nam viverra fringilla erat, ut fermentum nunc feugiat eu.
""")
                .frame(width: 340, height: 120)
                .multilineTextAlignment(.leading)
                
            }
            
        }
    }
}
#Preview {
    SecondOnBoardingView()
}
