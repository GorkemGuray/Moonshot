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
    @State private var showingGrid = true
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                    GridLayout(astronauts: astronauts, missions: missions)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Toggle(isOn: $showingGrid) {
                    Text("Grid")
                }
                .toggleStyle(.switch)
        }
            .navigationDestination(for: Mission.self) {mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
            
            .navigationDestination(for: MissionView.CrewMember.self) { crew in
                AstronautView(astronaut: crew.astronaut)
            }

        } //NavigationStack

    }//body
}//ContentView

#Preview {
    ContentView()
}
