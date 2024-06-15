//
//  Astronaut.swift
//  Moonshot
//
//  Created by Görkem Güray on 21.04.2024.
//

import Foundation

struct Astronaut: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let description: String
}
