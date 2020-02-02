//
//  ContentView.swift
//  SilentModeiOSAnimation
//
//  Created by Alexander Römer on 02.02.20.
//  Copyright © 2020 Alexander Römer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var hideFromScreen   = false
    @State private var inertialRotate   = false
    @State private var onOff            = false
    @State private var offOn            = false
    @State private var hideSlash        = false
    @State private var silenceColorOff  = false
    
    
    var body: some View {
        
        ZStack {
            Color(red: 0, green: 0, blue: 0)
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                Rectangle()
                    .frame(width: 256, height: 64)
                    .cornerRadius(30)
                    .foregroundColor(Color(UIColor.systemGray6))
                
                HStack(spacing: 30) {
                    ZStack {
                        Image(systemName: "bell.fill")
                            .font(.largeTitle)
                            .rotationEffect(Angle.degrees(inertialRotate ? 0 : -25), anchor: .top)
                            .foregroundColor(silenceColorOff ? .gray : .red)
                            .onAppear() {
                                withAnimation(Animation.easeOut(duration: 1.5).delay(2.3)) {
                                    self.silenceColorOff.toggle()
                                }
                                withAnimation(Animation.interpolatingSpring(stiffness: 350, damping: 3).delay(2.3)) {
                                    self.inertialRotate.toggle()
                                }
                        }
                        
                        Rectangle()
                            .frame(width: 5, height: 45)
                            .foregroundColor(.red)
                            .border(Color.white)
                            .scaleEffect(x: 1, y: hideSlash ? 0 : 1, anchor: .topLeading)
                            .rotationEffect(.degrees(-45))
                            .onAppear() {
                                withAnimation(Animation.easeOut(duration: 1.8).delay(2.1)) {
                                    self.hideSlash.toggle()
                                }
                        }
                    }
                    
                    VStack(spacing: 4) {
                        Text("Silent Mode")
                            .foregroundColor(Color(.black))
                        ZStack {
                            Text("Off")
                                .foregroundColor(Color(.darkGray))
                                .opacity(offOn ? 1 : 0)
                                .onAppear() {
                                    withAnimation(Animation.easeOut(duration: 1.8).delay(2.5)) {
                                        self.offOn.toggle()
                                    }
                            }
                            
                            Text("On")
                                .foregroundColor(.red)
                                .opacity(onOff ? 0 : 1)
                                .onAppear() {
                                    withAnimation(Animation.easeOut(duration: 1.8).delay(2.1)) {
                                        self.onOff.toggle()
                                    }
                            }
                        }
    
                    }
                }
            }
            .offset(y: hideFromScreen ? -UIScreen.main.bounds.height / 2.6 : -UIScreen.main.bounds.height / 1.85)
//            .animation(Animation.easeOut(duration: 0.5).delay(0))
            .onAppear()  {
                self.hideFromScreen.toggle()
            }
        }
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
