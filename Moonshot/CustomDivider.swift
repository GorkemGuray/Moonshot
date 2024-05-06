//
//  CustomDivider.swift
//  Moonshot
//
//  Created by Görkem Güray on 6.05.2024.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height:2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    CustomDivider()
}
