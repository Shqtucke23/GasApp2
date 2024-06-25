//
//  DriversView.swift
//  GasApp2
//
//  Created by Shawn Tucker on 6/25/24.
//

import SwiftUI

var platforms: [Platform] = [
    .init(name: "ADAM", imageName: "xbox.logo", color: .green),
    .init(name: "ANTHONY", imageName: "playstation.logo", color: .indigo),
    .init(name: "CLARENCE", imageName: "pc", color: .pink),
    .init(name: "DANIEL", imageName: "iphone", color: .mint),
    .init(name: "DEWAYNE", imageName: "figure.archery", color: .blue),
    .init(name: "MARK", imageName: "figure.disc.sports", color: .orange),
    .init(name: "MICHAEL", imageName: "dollarsign.circle", color: .gray),
    .init(name: "TIM", imageName: "ev.charger.fill", color: .green),
    .init(name: "TOBIN", imageName: "figure.walk", color: .purple)
]

struct DriversView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Drivers") {
                    ForEach(platforms, id: \.name) { platform in
                        NavigationLink(value: platform) {
                            Label(platform.name, systemImage: platform.imageName)
                                .foregroundColor(platform.color)
                                .padding(.vertical, 3)
                        }
                        
                    }
                }
            }
            .navigationTitle("DISPATCH")
            .navigationDestination(for: Platform.self) { platform in
                ZStack {
                    platform.color.ignoresSafeArea()
                    Label(platform.name, systemImage: platform.imageName)
                        .font(.largeTitle).bold()
                    
                }
                
            }
        }
    }
}

#Preview {
    DriversView()
}

struct Platform: Hashable {
    let name: String
    let imageName: String
    let color: Color
}
