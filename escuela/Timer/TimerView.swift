//
//  TimerView.swift
//  escuela
//
//  Created by Barsoum on 2/7/22.
//

import SwiftUI

struct TimerView: View {
    @State var date = Date()
    @State var calendar = Calendar.current
    @State var toggle = false
    
    let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    
    var body: some View {
        let fontSystem = Font.system(size: 40)

        VStack {
            if (toggle == true) {
        Text(date, style: .timer)
            .fontWeight(.heavy)
            .frame(width: 300, height: 300)
            .background(Color(.black))
            .cornerRadius(10000)
            .foregroundColor(.white)
            .font(fontSystem)
                HStack {
                Button(action: self.resetTimer, label: {Image(systemName: "restart").imageScale(.large)})
                        .frame(width: 80, height: 80)

                    .background(Color(.black))
                    .cornerRadius(50)
                    .foregroundColor(.white)
                    .padding(.top, 50)
                    
                    Button(action: toggleOff, label: {Image(systemName: "pause").imageScale(.large)})
                        .frame(width: 80, height: 80)

                        .background(Color(.black))
                        .cornerRadius(50)
                        .foregroundColor(.white)
                        .padding(.top, 50)
                    
                }
            } else {
                Text("0:00")
                    .fontWeight(.heavy)
                    .frame(width: 300, height: 300)
                    .background(Color(.black))
                    .cornerRadius(10000)
                    .foregroundColor(.white)
                    .font(fontSystem)
                HStack {
                Button(action: self.resetTimer, label: {Image(systemName: "restart").imageScale(.large)})
                        .frame(width: 80, height: 80)

                    .background(Color(.black))
                    .cornerRadius(50)
                    .foregroundColor(.white)
                    .padding(.top, 50)
                    
                    Button(action: toggleOn, label: {Image(systemName: "play").imageScale(.large)})
                        .frame(width: 80, height: 80)

                        .background(Color(.black))
                        .cornerRadius(50)
                        .foregroundColor(.white)
                        .padding(.top, 50)
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)

        .background(Color(red: 0.949, green: 0.949, blue: 0.971))
        
    }
    func resetTimer() {
        date = Date()
    }
    func toggleOff() {
        toggle = false
    }
    func toggleOn() {
        toggle = true
        date = Date()
    }
    
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
