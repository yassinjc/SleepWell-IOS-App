//
//  RelaxingSounds.swift
//  SleepWell
//
//  Created by Yassin Chehlaoui on 11/04/2023.
//

import SwiftUI
import AVKit

struct RelaxingSounds: View {
    @State private var selectedTab = 4
    @State private var showSoundsScreen = false
    
    var body: some View {
        ZStack {
            Image("background2") // Replace "background_image" with the name of your image asset
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack{
                Text("Relaxing Sounds")
                    .font(.system(size: 25))
                    .fontWeight(.thin)
                    .foregroundColor(.white)
                    .padding(.top,  115)
                    .padding(.bottom, -50)
                ZStack{
                    Text("Having trouble falling asleep?")
                        .font(.title2)
                        .fontWeight(.thin)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .position(x: 210, y:150)
                        .zIndex(1)
                    
                    Text("These sounds can help calm               your brain down and make                           it easier to fall asleep.")
                        .font(.title2)
                        .fontWeight(.thin)
                        .foregroundColor(.white)
                        .position(x: 180, y:240)
                        .multilineTextAlignment(.center)
                        .zIndex(1)
                        .padding(.horizontal, 30.0)
                    
                    Button("Brown/White Noise")
                    {
                        self.showSoundsScreen = true
                    }
                    .zIndex(1)
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 230, height: 50)
                    .background(Color(hex: 0x6C00FF))
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .cornerRadius(40)
                    .padding(.top, -60)
                    
                    Button("ASMR Sounds")
                    {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .zIndex(1)
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 180, height: 50)
                    .background(Color(hex: 0x6C00FF))
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .cornerRadius(40)
                    .padding(.top, 140)
                    
                    
                    Button("Nature Sounds")
                    {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .zIndex(1)
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 180, height: 50)
                    .background(Color(hex: 0x6C00FF))
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .cornerRadius(40)
                    .padding(.top, 360)
                    
                    RoundedRectangle(cornerRadius: 40)
                        .padding(.horizontal, 40.0)
                        .padding(.vertical, 120.0)
                        .padding(.top, -20)
                        .zIndex(0)
                        .foregroundColor(Color(hue: 0.74, saturation: 0.872, brightness: 0.138, opacity: 0.756))
                }
                .sheet(isPresented: $showSoundsScreen) {
                    SoundsScreen()
                }
            }
        }
        
    }
}

struct RelaxingSounds_Previews: PreviewProvider {
    static var previews: some View {
        RelaxingSounds()
    }
}

struct SoundsScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("background2")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundColor(Color(hue: 0.74, saturation: 0.872, brightness: 0.138, opacity: 0.756))
                        .padding(.horizontal, 50.0)
                        .padding(.vertical, 160.0)
                        .zIndex(0)
                    VStack {
                        Text("Brown/White Noise")
                            .font(.title2)
                            .fontWeight(.thin)
                            .foregroundColor(.white)
                            .position(x:210, y:210)
                        NavigationLink(destination: AudioPlayerView()) {
                            VStack {
                                Text("Deep, Calming          Brown Noise")
                                    .multilineTextAlignment(.center)
                                    .frame(width: 280, height: 100.0)
                                    .fontWeight(.thin)
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .fontWeight(.light)
                                    .padding(.top, -20)
                                Image(systemName: "play.fill")
                                    .aspectRatio(contentMode: .fill)
                                    .foregroundColor(Color(red: 0.392, green: 0.204, blue: 0.891))
                                    .padding(.top, 0.0)
                                    .font(.title)
                                
                            }
                            
                        }
                        .position(x: 210, y:70)
                        .zIndex(1)
                        
                        Button("Ocean Waves") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                        .font(.title2)
                        .fontWeight(.thin)
                        .foregroundColor(.white)
                        .position(x: 210, y:-50)
                        .zIndex(1)
                        .fontWeight(.light)
                    }
                    Image(systemName: "play.fill")
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(Color(red: 0.392, green: 0.204, blue: 0.891))
                        .padding(.top, 320.0)
                        .font(.title)
                }
            }
        }
    }
}
