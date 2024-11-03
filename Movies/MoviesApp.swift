//
//  MoviesApp.swift
//  Movies
//
//  Created by Mohammad Azam on 6/6/23.
//  Updated by Michael Knych to work with Xcode 16.1 and Swift 5
//

import SwiftUI
import SwiftData 

@main
struct MoviesApp: App {
    
    let container: ModelContainer
    
    init() {
        do {
          // needed to add the confirguration argument to ModelContainer
          container = try ModelContainer(for: Movie.self, migrationPlan: MoviesMigrationPlan.self, configurations: ModelConfiguration(for: Movie.self))
        } catch {
            fatalError("Could not initialize the container.")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MovieListScreen()
            }
        }.modelContainer(container)
    }
}
