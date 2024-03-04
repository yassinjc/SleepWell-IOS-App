//
//  AudioPlayerView.swift
//  SleepWell
//
//  Created by Yassin Chehlaoui on 12/04/2023.
//

import SwiftUI
import AVKit

struct AudioPlayerView: View {
    
    @State private var isPlaying = false
    @State private var progress: Float = 0.0
    @State private var currentTime: TimeInterval = 0.0
    @State private var remainingTime: TimeInterval = 0.0
    
    let audioPlayer = try! AVAudioPlayer(data: Data(contentsOf: Bundle.main.url(forResource: "brown_noise", withExtension: "mp3")!))
    
    var body: some View {
        ZStack {
            Image("background2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            ZStack {
                Text("Deep, Calming           Brown Noise")
                    .multilineTextAlignment(.center)
                    .frame(width:260)
                    .font(.title2)
                    .fontWeight(.thin)
                    .padding(.bottom, 120)
                    .zIndex(1)
                    .foregroundColor(.white)
                
                Text((getTimeString(timeInterval: remainingTime)))
                    .font(.headline)
                    .padding(.top, 50)
                    .zIndex(1)
                    .foregroundColor(.gray)
                
                ProgressBar(value: $progress)
                    .frame(width: 300.0, height: 4)
                    .padding(.horizontal)
                    .zIndex(1)
                
                Button(
                    action: {
                        if self.isPlaying {
                            self.audioPlayer.pause()
                        } else {
                            self.audioPlayer.play()
                        }
                        self.isPlaying.toggle()
                    })
                {
                    Image(systemName: self.isPlaying ? "pause.fill" : "play.fill")
                        .font(.largeTitle)
                        .padding(.top, 150)
                        .foregroundColor(Color(red: 0.392, green: 0.204, blue: 0.891))
                }
                .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                RoundedRectangle(cornerRadius: 40)
                    .frame(width: /*@START_MENU_TOKEN@*/350.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/)
                    .zIndex(0)
                    .foregroundColor(Color(hue: 0.74, saturation: 0.872, brightness: 0.138, opacity: 0.756))
            }
            .onAppear {
                remainingTime = audioPlayer.duration
                // Update progress bar and current time every 0.1 seconds
                let interval = 1.0
                let timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
                    if self.isPlaying {
                        self.progress = Float(self.audioPlayer.currentTime / self.audioPlayer.duration)
                        self.currentTime = self.audioPlayer.currentTime
                        self.remainingTime = max(0, self.audioPlayer.duration - self.audioPlayer.currentTime)
                    }
                }
                timer.fire()
            }
        }
    }
    
    func getTimeString(timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval / 60)
        let seconds = Int(timeInterval.truncatingRemainder(dividingBy: 60))
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct AudioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayerView()
    }
}

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.3))
                Rectangle()
                    .foregroundColor(Color.gray)
                    .frame(width: geometry.size.width * CGFloat(self.value))
                    .animation(.linear(duration: 0.1))
            }
        }
    }
}
