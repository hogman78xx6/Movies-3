//
//  MovieSelectionView.swift
//  Movies
//
//  Created by Mohammad Azam on 6/8/23.
//  Updated by Michael Knych to work with Xcode 16.1 and Swift 5
//

import SwiftUI
import SwiftData

struct MovieSelectionView: View {
    
    //@Query(sort: \.title, order: .forward) private var movies: [Movie]
  @Query(sort: \Movie.title, order: .forward) private var movies: [Movie]
    @Binding var selectedMovies: Set<Movie>
    
    var body: some View {
        List(movies) { movie in
            HStack {
                Image(systemName: selectedMovies.contains(movie) ? "checkmark.square": "square")
                    .onTapGesture {
                        if !selectedMovies.contains(movie) {
                            selectedMovies.insert(movie)
                        } else {
                            selectedMovies.remove(movie)
                        }
                    }
                Text(movie.title)
            }
        }
    }
}


