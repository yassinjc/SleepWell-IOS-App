//
//  RestfulRatingView.swift
//  SleepWell
//
//  Created by Yassin Chehlaoui on 12/04/2023.
//

import SwiftUI

struct RestfulRatingView: View {
    @State private var isShowingPopup = false
    @State private var rating = 1
    @State private var isButtonHidden = false
    
    var body: some View {
            VStack {
                ZStack {
                    if isShowingPopup {
                        Color.black.opacity(0.4)
                            .frame(height: UIScreen.main.bounds.height)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                isShowingPopup = false
                            }
                        
                        GeometryReader { geo in
                            VStack {
                                Text("From a scale of 1-10, How restful did you feel today?")
                                    .font(.title3)
                                    .fontWeight(.thin)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .foregroundColor(.white)
                                
                                Picker("Rating", selection: $rating) {
                                    ForEach(1..<11) { number in
                                        Text("\(number)")
                                            .foregroundColor(.white)
                                    }
                                }
                                .pickerStyle(WheelPickerStyle())
                                .frame(width: 150)
                                .padding()
                                
                                
                                Button("Submit") {
                                    isShowingPopup = false
                                    isButtonHidden = true
                                }
                                .padding()
                                .frame(width: 100, height: 36)
                                .background(Color(hex: 0x6C00FF))
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .cornerRadius(40)
                            }
                            .frame(width: 300, height: 450)
                            .background(Color(hue: 0.693, saturation: 0.317, brightness: 0.248))
                            .cornerRadius(40)
                            .position(x:212 , y:500)
                            
                            .transition(.move(edge: .bottom))
                        }
                    } else {
                        VStack {
                            DonutChartView(percentage: Double(rating) * 10)
                                .frame(width: 200, height: 200)
                                .padding(.top, 120)
                                .padding(.bottom, 350)
                                .foregroundColor(.white)
                        }
                            Button("Rate your restfulness") {
                                isShowingPopup = true
                            }
                            .padding()
                            .frame(width: 210, height: /*@START_MENU_TOKEN@*/40.0/*@END_MENU_TOKEN@*/)
                            .background(Color(hex: 0x6C00FF))
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .cornerRadius(40)
                            .padding(.top, 120)

                        .background(Color.clear)
                    }
                }
            }
            .frame(height: isShowingPopup ? 734 : nil)
        }
}

struct RestfulRatingView_Previews: PreviewProvider {
    static var previews: some View {
        RestfulRatingView()
    }
}

struct DonutChartView: View {
    @State private var animateChart = false
    
    let percentage: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 12.0)
                .opacity(0.3)
                .foregroundColor(.gray)
            
            Circle()
                .trim(from: 0.0, to: animateChart ? CGFloat(percentage / 100.0) : 0.0)
                .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color(red: 0.473, green: 0.268, blue: 0.95))
                .rotationEffect(Angle(degrees: -90.0))
                .animation(.easeOut(duration: 1.0))
            
            Text(String(format: "%.0f%%", percentage))
                .font(.title2)
                .fontWeight(.bold)
        }
        .onAppear {
            animateChart.toggle()
        }
    }
}
