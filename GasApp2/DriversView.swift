//
//  DriversView.swift
//  GasApp2
//
//  Created by Shawn Tucker on 6/25/24.
//

import SwiftUI

var platforms: [Platform] = [
    .init(name: "ADAM", imageName: "figure.basketball", color: .green),
    .init(name: "ANTHONY", imageName: "figure.baseball", color: .indigo),
    .init(name: "CLARENCE", imageName: "figure.golf", color: .pink),
    .init(name: "DANIEL", imageName: "figure.american.football", color: .mint),
    .init(name: "DEWAYNE", imageName: "figure.archery", color: .blue),
    .init(name: "MARK", imageName: "figure.disc.sports", color: .orange),
    .init(name: "MICHAEL", imageName: "figure.lacrosse", color: .gray),
    .init(name: "TIM", imageName: "figure.hockey", color: .green),
    .init(name: "TOBIN", imageName: "figure.walk", color: .purple)
]

var locations: [Location] = [
    .init(name: "N.AUG", imageName: "bolt.heart", color: .blue),
    .init(name: "CLT", imageName: "ivfluid.bag.fill", color: .green),
    .init(name: "SPARTY", imageName: "syringe.fill", color: .orange)
]

struct DriversView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Drivers") {
                    ForEach(platforms, id: \.name) { platform in
                        NavigationLink(value: platform) {
                            Label(platform.name, systemImage: platform.imageName)
                                .padding(.vertical, 3)
                                .foregroundColor(platform.color)
                                .padding(.vertical, 3)
                        }
                        
                    }
                }
                
                Section("Locations") {
                    ForEach(locations, id: \.name) { location in
                        Text(location.name).bold()
                            .foregroundColor(location.color)
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

struct Location: Hashable {
    let name: String
    let imageName: String
    let color: Color
}


