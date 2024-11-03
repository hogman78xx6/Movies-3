//
//  ActorListView.swift
//  Movies
//
//  Created by Mohammad Azam on 6/7/23.
//  Updated by Michael Knych to work with Xcode 16.1 and Swift 5
//

import SwiftUI

struct ActorListView: View {
    
    let actors: [Actor]
    
    var body: some View {
        List(actors) { actor in
            NavigationLink(value: actor) {
                ActorCellView(actor: actor)
            }
        }.navigationDestination(for: Actor.self) { actor in
            ActorDetailScreen(actor: actor)
        }
    }
}

#Preview {
    ActorListView(actors: [])
}
