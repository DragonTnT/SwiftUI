//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Allen long on 2022/11/4.
//

import SwiftUI

struct ContentView: View {
    
    @State var obj = demoView()
    
    var name = ""
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 20) {
            Text("Turtle Rockadajsdksajdklsajkld")
                .font(.title)
                .frame(width: 100, height: 100)
            Divider()
                .overlay(Color.yellow, alignment: .trailing)
            HStack {
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer()
                Text("California")
                    .font(.subheadline)
            }
        }
        .padding()
    }
}

struct demoView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(PreviewLayout.fixed(width: 100, height: 200))
    }
}
