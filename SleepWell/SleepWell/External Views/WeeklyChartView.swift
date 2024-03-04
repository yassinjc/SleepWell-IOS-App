//
//  WeeklyChartView.swift
//  SleepWell
//
//  Created by Yassin Chehlaoui on 11/04/2023.
//

import SwiftUI

struct WeeklyChartView: View {
    let weeklyData: [Double]
    let daysOfWeek = ["S", "M", "T", "W", "T", "F", "S"]

    var body: some View {
        ZStack {
            Image("background2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Text("Weekly Chart")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .fontWeight(.light)
                
                if weeklyData.max() != 0 {
                    VStack {
                        BarChart(dataPoints: weeklyData, barColor: Color(red: 0.461, green: 0.267, blue: 0.912))
                            .padding()
                            .foregroundColor(.white)
                            .fontWeight(.light)
                        HStack(spacing:0) {
                            ForEach(daysOfWeek, id: \.self) { day in
                                Text(day)
                                    .font(.caption)
                                    .frame(width: .infinity)
                                    .foregroundColor(.white)
                                    .padding([.horizontal], 20)
                            }
                        }
                    }
                } else {
                    Text("No data to display")
                }
            }
        }
    }
}
