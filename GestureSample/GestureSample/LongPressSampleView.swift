//
//  LongPressSampleView.swift
//  GestureState
//
//  Created by hokuron on 2019/09/13.
//  Copyright © 2019 hokuron. All rights reserved.
//

import SwiftUI

struct LongPressSampleView: View {

    @GestureState private var isLongPressed = false

    private var longPressGesture: some Gesture {
        LongPressGesture()
            .updating($isLongPressed) { value, state, transaction in
                state = value
            }
    }

    var body: some View {
        Rectangle()
            .fill(isLongPressed ? Color.purple : .red)
            .frame(width: 300, height: 300)
            .cornerRadius(8)
            .shadow(radius: 8)
            .padding()
            .scaleEffect(isLongPressed ? 1.1 : 1.0)
            .gesture(longPressGesture)
            .animation(.spring())
    }
}

struct LongPressSampleView_Previews: PreviewProvider {
    static var previews: some View {
        LongPressSampleView()
    }
}
