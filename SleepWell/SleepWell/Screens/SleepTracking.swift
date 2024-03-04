//
//  SleepTracking.swift
//  SleepWell
//
//  Created by Yassin Chehlaoui on 11/04/2023.
//

import SwiftUI

struct SleepTracking: View {
    @State private var selectedTab = 1
    @State private var startTime: Date?
    @State private var endTime: Date?
    @State private var timeElapsed: TimeInterval = 0.0
    @State private var isTracking = false
    @State private var currentTime = Date()
    @State private var weeklyData: [Double] = [4, 7, 2, 4, 6, 1, 0]
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                ZStack {
                    Text("Hope you had a great                   day, Mario!")
                        .font(.system(size: 25))
                        .fontWeight(.thin)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.top, -300)
                    
                    Text(currentTime, style: .time)
                        .font(.system(size: 25))
                        .fontWeight(.thin)
                        .foregroundColor(.white)
                        .padding(.bottom, 55)
                        .onReceive(timer) { input in
                            if !isTracking {
                                currentTime = input
                            }
                        }
                    
                    Button(action: {
                        if !isTracking {
                            startTime = Date()
                            isTracking = true
                        } else {
                            endTime = Date()
                            timeElapsed = endTime!.timeIntervalSince(startTime!)
                            isTracking = false
                            
                            // Update weekly data
                            let weekday = Calendar.current.component(.weekday, from: startTime!)
                            weeklyData[weekday-1] += timeElapsed
                        }
                    }) {
                    VStack{
                        Text(isTracking ? "Stop Tracking" : "Start Tracking")
                            .padding()
                            .frame(width: 150, height: /*@START_MENU_TOKEN@*/40.0/*@END_MENU_TOKEN@*/)
                            .background(isTracking ? Color(hex: 0x3C2B52) : Color(hex: 0x6C00FF))
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .cornerRadius(40)
                            .padding(.bottom, 15)
                    
                    
                    if endTime != nil {
                        Text(String(format: "Time Elapsed: %.2f seconds", timeElapsed))
                            .padding()
                            .foregroundColor(.white)
                    }
                    
                        NavigationLink(destination: WeeklyChartView(weeklyData: weeklyData)) {
                            Text("View Weekly Chart")
                                .padding()
                                .frame(width: 190, height: /*@START_MENU_TOKEN@*/40.0/*@END_MENU_TOKEN@*/)
                                .background(Color(hex: 0x6C00FF))
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .cornerRadius(40)
                                .padding(.top, 15)
                        }
                        }
                    .padding(.top, 480)
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }

struct SleepTracking_Previews: PreviewProvider {
    static var previews: some View {
        SleepTracking()
    }
}

struct BarChart: View {
    let dataPoints: [Double]
    let barColor: Color
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(dataPoints, id: \.self) { dataPoint in
                BarView(dataPoint: dataPoint, barColor: barColor)
            }
        }
    }
}

struct BarView: View {
    let dataPoint: Double
    let barColor: Color
    
    var body: some View {
        let barHeight = CGFloat(dataPoint * 10.0)
        return VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 20, height: 200)
                    .foregroundColor(Color.gray.opacity(0.5))
                Capsule().frame(width: 20, height: barHeight)
                    .foregroundColor(barColor)
                    .padding([.horizontal], 10)

            }
            Text(String(format: "%.2f", dataPoint))

        }
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 8) & 0xff) / 255,
            blue: Double(hex & 0xff) / 255,
            opacity: alpha
        )
    }
}
