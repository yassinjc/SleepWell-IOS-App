//
//  SleepAnalysis.swift
//  SleepWell
//
//  Created by Yassin Chehlaoui on 11/04/2023.
//

import SwiftUI

struct SleepAnalysis: View {
    @State private var selectedTab = 2
    
    var body: some View {
        ZStack {
            Image("background2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            ScrollView {
                ZStack{
                    Text("Sleep Analysis")
                        .font(.system(size: 25))
                        .fontWeight(.thin)
                        .position(x: 210,y:50)
                        .foregroundColor(.white)
                        .padding(.top,  70)
                    RestfulRatingView()
                        .zIndex(5)
                        .padding(.top,70)
                        .padding(.bottom, 1040)
                    VStack {
                        TipsView()
                            .padding(.top, 50)
                        
                    }
                    .padding()
                }
            }
        }
    }
    
    struct SleepAnalysis_Previews: PreviewProvider {
        static var previews: some View {
            SleepAnalysis()
        }
    }
}
    
