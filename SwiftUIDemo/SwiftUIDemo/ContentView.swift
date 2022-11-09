//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Allen long on 2022/11/4.
//

import SwiftUI

struct ContentView: View {
    
    @State var obj = demoView()
    
    @Binding var isOn: Bool = Binding.constant(false)
    
    var name = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .trailing, spacing: 20) {
                Text("Turtle Rockadajsdksajdklsajkld")
                    .font(.title)
                    .frame(width: 100, height: 100)
                    .border(Color.blue,width: 0.5)
                    .overlay(Circle().stroke(lineWidth: 1))
                Divider()
                    .overlay(Color.yellow, alignment: .trailing)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
                NavigationLink {
                    ContentView()
                } label: {
                    List {
                        
                    }.overlay(Color.blue)
                }.edgesIgnoringSafeArea(.all)
            }
            .padding()
            .navigationTitle("haha")
        }
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
        Group {
            ContentView().previewLayout(PreviewLayout.fixed(width: 100, height: 200))
        }
    }
}
