//
//  CompositeGestureSampleView.swift
//  GestureSample
//
//  Created by hokuron on 2019/09/13.
//  Copyright © 2019 hokuron. All rights reserved.
//

import SwiftUI

struct CompositeGestureSampleView: View {

    @State private var offset = CGSize.zero
    @GestureState private var isLongPressed = false

    private var longPressDragGesture: some Gesture {
        LongPressGesture()
            .updating($isLongPressed) { value, state, transaction in
                state = value
            }
        .simultaneously(with: DragGesture())
        .onChanged {
            if let translation = $0.second?.translation {
                self.offset = translation
            }
        }
        .onEnded { _ in self.offset = .zero }
    }

    var body: some View {
        Rectangle()
            .fill(isLongPressed ? Color.purple : Color.red)
            .frame(width: 300, height: 300)
            .cornerRadius(8)
            .shadow(radius: 8)
            .padding()
            .scaleEffect(isLongPressed ? 1.1 : 1)
            .offset(x: offset.width, y: offset.height)
            .gesture(longPressDragGesture)
            .animation(.spring())
    }
}

struct CompositeGestureSampleView_Previews: PreviewProvider {
    static var previews: some View {
        CompositeGestureSampleView()
    }
}
