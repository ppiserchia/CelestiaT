//
//  InfiniteCanvasView.swift
//  C5_Stars
//
//  Created by Gina Saviano on 06/03/25.
//

import SwiftUI

struct InfiniteCanvasView: View {
    @State private var scale: CGFloat = 1.0
    @State private var prevScale: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    @State private var prevOffset: CGSize = .zero
   
    
    var body: some View {
        
        ///The Canvas is a structure that you can use to render any 2d graphical element inside a View in SwiftUI. It converts all the shapes and renders them in SwiftUI views.
        Canvas { context, size in
            var context = context
            
            //Let's make the center the anchor point
            let originalX = size.width / 2
            let originalY = size.height / 2
            
            let newX = originalX * scale
            let newY = originalY * scale
            
            //for magnifying gesture
            context.translateBy(x: originalX - newX, y: originalY - newY)
            //to revision because it magnify on the upper left corner
            
            //for drag gesture
            context.translateBy(x: offset.width, y: offset.height)
            
            context.scaleBy(x: scale, y: scale)
            
            //HERE WE WILL RENDER THE CONSTELLATIONS
            //code code code
            //now I will render some stupid thing to see if it works
//            context.draw(Text("Hi everyone").font(Font.system(size: 20)).foregroundColor(.white), in: CGRect(origin: CGPoint(x: 100, y: 150), size: CGSize(width: 500, height: 20)))
            
        }//: END OF CANVAS
        .ignoresSafeArea()
        .background(.black.opacity(0.8))
//        .contentShape(Rectangle())
        .gesture(
            DragGesture(minimumDistance: 10.0, coordinateSpace: .global)
                .onChanged({ value in
                    self.offset.width = self.prevOffset.width + value.translation.width
                    self.offset.height = self.prevOffset.height + value.translation.height
                })
                .onEnded({ value in
                    self.prevOffset = self.offset
                })
        )
        .simultaneousGesture(
            MagnifyGesture(minimumScaleDelta: 0)
                .onChanged({ value in
                    self.scale = self.prevScale * value.magnification
                })
                .onEnded( { value in
                    self.prevScale = self.scale
                })        )
        
        
    }//: END OF BODY
}//: END OF STRUCT

//MARK: - PREVIEW
#Preview {
    InfiniteCanvasView()
}
