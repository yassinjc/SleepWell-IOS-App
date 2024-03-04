//
//  ContentView.swift
//  SleepWell
//
//  Created by Yassin Chehlaoui on 11/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(red: 4/255, green: 2/255, blue: 21/255, alpha: 1)
        tabBarAppearance.selectionIndicatorTintColor = .white
        UITabBar.appearance().standardAppearance = tabBarAppearance
    }
    
    var body: some View {
        TabView {
            SleepTracking()
                .tabItem {
                    Image(systemName: "bed.double.fill")

                }
            
            SleepAnalysis()
                .tabItem {
                    Image(systemName: "chart.pie.fill")

                }
            
            RelaxingSounds()
                .tabItem {
                    Image(systemName: "music.quarternote.3")

                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
