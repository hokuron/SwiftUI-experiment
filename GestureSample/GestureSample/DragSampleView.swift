//
//  DragSampleView.swift
//  GestureSample
//
//  Created by hokuron on 2019/09/13.
//  Copyright © 2019 hokuron. All rights reserved.
//

import SwiftUI

struct DragSampleView: View {

    @State private var offset = CGSize.zero

    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { self.offset = $0.translation }
            .onEnded {
                if $0.translation.width < -100 {
                    self.offset = .init(width: -1000, height: 0)
                } else if $0.translation.width > 100 {
                    self.offset = .init(width: 1000, height: 0)
                } else {
                    self.offset = .zero
                }
            }
    }

    var body: some View {
        PersonView()
            .background(Color.red)
            .cornerRadius(8)
            .shadow(radius: 8)
            .padding()
            .offset(x: offset.width, y: offset.height)
            .gesture(dragGesture)
            .animation(.spring())
    }
}

struct PersonView: View {

    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .fill(Color.gray)
                .cornerRadius(8)
                .frame(height: 300)

            Text("Majid Jabrayilov")
                .font(.title)
                .foregroundColor(.white)

            Text("iOS Developer")
                .font(.body)
                .foregroundColor(.white)
        }
        .padding()
    }
}

struct DragSampleView_Previews: PreviewProvider {
    static var previews: some View {
        DragSampleView()
    }
}
