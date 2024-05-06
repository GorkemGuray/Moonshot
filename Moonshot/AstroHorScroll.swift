//
//  AstroHorScroll.swift
//  Moonshot
//
//  Created by Görkem Güray on 6.05.2024.
//

import SwiftUI

struct AstroHorScroll: View {
    
    
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) {crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment:. leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }//VStack
                        }//HStack
                        .padding(.horizontal)
                    }//NavigationLink
                    
                }//ForEach
            }//HStack
        }//ScrollView
    }
}

#Preview {
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missi = MissionView(mission: missions[3], astronauts: astronauts)
    return AstroHorScroll(crew: missi.crew)
        .preferredColorScheme(.dark)
}

