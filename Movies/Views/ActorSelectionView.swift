//
//  ActorSelectionView.swift
//  Movies
//
//  Created by Mohammad Azam on 6/8/23.
//  Updated by Michael Knych to work with Xcode 16.1 and Swift 5
//

import SwiftUI
import SwiftData

struct ActorSelectionView: View {
    
    // @Query(sort: \.name, order: .forward) private var actors: [Actor]
  @Query(sort: \Actor.name, order: .forward) private var actors: [Actor]
    @Binding var selectedActors: Set<Actor>
    
    var body: some View {
        List(actors) { actor in
            HStack {
                Image(systemName: selectedActors.contains(actor) ? "checkmark.square": "square")
                    .onTapGesture {
                        if !selectedActors.contains(actor) {
                            selectedActors.insert(actor)
                        } else {
                            selectedActors.remove(actor)
                        }
                    }
                Text(actor.name)
            }
        }
    }
}

/*
#Preview {
    ActorSelectionView()
} */
