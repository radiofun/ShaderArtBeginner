//
//  June02.swift
//  SwiftMay31
//
//  Created by Minsang Choi on 6/2/25.
//

import SwiftUI

struct ShaderArtView: View {
    
    @State private var time : CGFloat = 0
    private let timer = Timer.publish(every: 1/120,
                                     on: .main,
                                     in: .common).autoconnect()

    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
                .layerEffect(ShaderLibrary.june2(.boundingRect,.float(time)), maxSampleOffset:  .zero)
                .onReceive(timer) { _ in
                    time += 0.003
                }
        }        
    }
}

#Preview {
    ShaderArtView()
}
