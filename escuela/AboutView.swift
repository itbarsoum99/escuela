//
//  HomeView.swift
//  escuela
//
//  Created by Barsoum on 1/18/22.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
        Text("escuela")
            .font(.largeTitle)
            .fontWeight(.heavy)
        Text("a student productivity app")
                .padding(.bottom, 20)
            Text("designed by isaac barsoum")
            Text("©2022 under CC BY-NC 4.0")
                .padding(.bottom, 20)
            Link("Feedback ", destination: URL(string: "https://docs.google.com/forms/d/e/1FAIpQLScpD17GX1jAjjmBzKTOFyU5eiQlxCleTh8LA7RZ5sonP8oxJw/viewform?usp=sf_link")!)
                    
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.949, green: 0.949, blue: 0.971))
    }
    
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
