//
//  ActorDetailScreen.swift
//  Movies
//
//  Created by Mohammad Azam on 6/8/23.
//  Updated by Michael Knych to work with Xcode 16.1 and Swift 5
//

import SwiftUI

struct ActorDetailScreen: View {
    
    @Environment(\.modelContext) private var context
    
    let actor: Actor
    @State private var selectedMovies: Set<Movie> = []
    
    var body: some View {
        VStack {
            MovieSelectionView(selectedMovies: $selectedMovies)
                .onAppear {
                    selectedMovies = Set(actor.movies)
                }
        }
        .onChange(of: selectedMovies, {
            actor.movies = Array(selectedMovies)
            context.insert(actor)
        })
        .navigationTitle(actor.name)
    }
}


