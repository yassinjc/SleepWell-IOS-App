//
//  TipsView.swift
//  SleepWell
//
//  Created by Yassin Chehlaoui on 12/04/2023.
//

import SwiftUI

struct TipsView: View {
    let tips = [        ("Monday", "Monday", "Rise n’ shine, Mario!\nYou seemed to have a really good sleep last night consisting of 8 hours and 48 minutes. That’s a good amount of sleep time and based on your previous data, you seem to feel refreshed and well-rested with this amount of sleep. Keep this up. \n\nYou spent 72% of your sleep in a Deep Sleep which is very healthy. This is the most important sleeping stage, so you’re doing really well! \n\nWhen it comes to your Light Sleep (16%) and REM Sleep (12%), it’s on the lower side. However, considering your refreshed feeling this morning with the majority of your sleep spent in a Deep Sleep, you gained a very good quality sleep. \n\nI have no other recommendations other than: keep this pattern up as it’s working well for you. \n\nHave a great rest of your day!"),        ("Tuesday", "Tuesday's title", "Tuesday's tip"),        ("Wednesday", "Wednesday's title", "Wednesday's tip"),        ("Thursday", "Thursday", "Good morning, Mario! \nYou seemed to have a pretty rough sleep last night consisting of 5 hours and 21 minutes. \n\nYou spent 74% of your sleep in a Deep Sleep which is a healthy percentage. However, due to your overall sleep time being so short, your body only gained 3 hours and 58 minutes. This is the most important sleep stage and needs to increase, along with your overall sleep duration. \n\nYou spent 10% of your sleep in a Light Sleep which is a very low percentage that needs to increase as well. \n\nYou spent 26% of your sleep in a REM Sleep which is a healthy percentage. However, as mentioned above, your overall sleep duration needs to increase to gain a good amount of sleep quality. \n\nSeeing as you actively used your phone until 1:57 AM, we want you to try to cut out screen activity at around 21:30-22:30 PM. This way, your brain can relax itself and gain the right amount of melatonin which causes you to feel tired and sleep a lot easier. That’ll be a good start to increasing your sleep quality! \n\nHope the rest of your day goes great!"),        ("Friday", "Friday's title", "Friday's tip"),        ("Saturday", "Saturday's title", "Saturday's tip"),        ("Sunday", "Sunday's title", "Sunday's tip")    ]
    
    @State private var selectedDay = 0
    @State private var isPickerShown = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(Color(hue: 0.74, saturation: 0.872, brightness: 0.138, opacity: 0.756))
                .frame(width: 340, height: 750)
                .overlay(
                    VStack(spacing: 8) {
                        HStack{
                            Text(tips[selectedDay].1)
                                .font(.title3)
                                .padding(.top, 13)
                                .padding(.leading, -15)
                                .foregroundColor(.gray)
                            
                            Button(action: { isPickerShown.toggle() }) {
                                Image(systemName: "calendar")
                                    .font(.title2)
                                    .padding(.leading, 160)
                                    .padding(.top, 10)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                        Text(tips[selectedDay].2)
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .padding()
                            .foregroundColor(.white)
                            .padding(.horizontal, 15)
                        
                    }
                )
                .sheet(isPresented: $isPickerShown) {
                    picker
                }
                .padding()
        }
    }
    
    var picker: some View {
        
        VStack {
            Picker("Select a day", selection: $selectedDay) {
                ForEach(0..<tips.count) { index in
                    Text(tips[index].0).tag(index)
                        .foregroundColor(.white)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 400, height: 800)

            
            
            Button(action: { isPickerShown.toggle() }) {
                Text("Done")
                    .font(.headline)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .frame(width: 80, height: 36)
                    .background(Color(hex: 0x6C00FF))
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .cornerRadius(40)
            }
            .padding(.top, 8)
            
        }
        
        .padding()
        .background(.black)
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView()
    }
}
