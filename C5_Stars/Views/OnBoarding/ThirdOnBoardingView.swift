//
//  ThirdOnBoardingView.swift
//  C5_Stars
//
//  Created by Pasquale Piserchia on 13/03/25.
//

import SwiftUI

struct ThirdOnBoardingView: View {
    //MARK: Declaring variables for the animations
    @State private var firstRectangle = false
    @State private var secondRectangle = false
    @State private var thirdRectangle = false
    @State private var fourthRectangle = false
    
    var body: some View {
        NavigationStack {
            
            //MARK: Setting up the View
        ZStack {
            Image("T")
            
            VStack {
                
                // First Animation
                if firstRectangle {
                    Rectangle()
                        .background(.ultraThickMaterial)
                        .cornerRadius(50)
                        .frame(width: 370, height: 150)
                        .transition(.move(edge: .leading).combined(with: .opacity))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                firstRectangle = true
                            }
                        }
                    // Text in the rectangle
                        .overlay(Text("""
Share your own story,
in a star.
""")
                            .foregroundStyle(.black)
                            .font(.title)
                            .multilineTextAlignment(.center)
                        )
                    // Amount of opacity that the rectangle has whenever it fades away
                        .opacity(firstRectangle ? 1 : 0.5)
                    
                }
                // Second Animation
                if secondRectangle {
                    Rectangle()
                        .background(.ultraThickMaterial)
                        .cornerRadius(50)
                        .frame(width: 400, height: 160)
                        .transition(.move(edge: .leading).combined(with: .opacity))
                        .overlay(Text("""
Let it belong in a constellation,
and let that be unique,
""")
                            .foregroundStyle(.black)
                            .font(.title)
                            .multilineTextAlignment(.center)
                        )
                }
                // Third Animation
                if thirdRectangle {
                    Rectangle()
                        .background(.ultraThickMaterial)
                        .cornerRadius(50)
                        .frame(width: 380, height: 110)
                        .transition(.move(edge: .leading).combined(with: .opacity))
                        .overlay(Text("Just as you are.")
                            .foregroundStyle(.black)
                            .font(.title)
                            .multilineTextAlignment(.center)
                        )
                }
                
                // Fourth Animation
                if fourthRectangle {
                    NavigationLink(destination: NightSkyView()
                        .navigationBarBackButtonHidden(true)
                    ) {
                        Text("Start")
                            .bold()
                            .padding(15)
                            .foregroundStyle(.black)
                            .background(.thinMaterial)
                            .cornerRadius(15)
                            .clipShape(Rectangle())
                            .padding(30)
                            .transition(.move(edge: .leading).combined(with: .opacity))
                    }
                }
            }
            
            
            //MARK: Enable the animation and set their duration
            .onAppear {
                withAnimation(.easeInOut(duration: 0.5)) {
                    firstRectangle = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        secondRectangle = true
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        thirdRectangle = true
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        fourthRectangle = true
                    }
                }
            }
        }
        }
    }
}

#Preview {
    ThirdOnBoardingView().environment(ConstellationViewModel())
}


























//struct ThirdOnBoardingView: View {
//    var body: some View {
//        ZStack {
//            Image("T")
//            VStack {
//                Rectangle()
//                    .background(.ultraThickMaterial)
//                    .cornerRadius(50)
//                    .frame(width: 370, height: 150)
//                
//                Rectangle()
//                    .background(.ultraThickMaterial)
//                    .cornerRadius(50)
//                    .frame(width: 370, height: 150)
//                
//                Rectangle()
//                    .background(.ultraThickMaterial)
//                    .cornerRadius(50)
//                    .frame(width: 370, height: 150)
//            }
//            VStack {
////                Text("Your safe space.")
////                    .bold()
////                    .font(.largeTitle)
////                    .foregroundColor(.black)
////                    .frame(width: 350)
////                    .multilineTextAlignment(.leading)
//                
//                Text("""
//
//Share your own story
//in a star,
//
//let it belong in a constellation,
//and let that constellation be unique,
//
//as you are.
//""")
//                .font(.title)
//                .frame(width: 300, height: 390)
//                .multilineTextAlignment(.leading)
//                
//                NavigationLink(destination: EmptyView()) {
//                    Text("Continue...")
//                        .bold()
//                        .padding(15)
//                        .foregroundStyle(.black)
//                        .background(.thinMaterial)
//                        .cornerRadius(15)
//                        .clipShape(Rectangle())
//                        .padding(30)
//                    
//                }
//            }
//            }
//    }
//}
//
//#Preview {
//    ThirdOnBoardingView()
//}
