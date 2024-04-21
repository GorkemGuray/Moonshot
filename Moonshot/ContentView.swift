//
//  ContentView.swift
//  Moonshot
//
//  Created by Görkem Güray on 14.04.2024.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}


struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    var body: some View {
        let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
        let missions: [Mission] = Bundle.main.decode("missions.json")
        Button("Test") {
            dump(astronauts)
            dump(missions)
        }
        Text(String(astronauts.count))

    }//body
}//ContentView

#Preview {
    ContentView()
}
