//
//  MoviesMigrationPlan.swift
//  Movies
//
//  Created by Mohammad Azam on 7/25/23.
//  Updated by Michael Knych to work with Xcode 16.1 and Swift 5
//

import Foundation
import SwiftData

enum MoviesMigrationPlan: SchemaMigrationPlan {
  
  static var schemas: [any VersionedSchema.Type] {
    [MoviesSchemaV1.self, MoviesSchemaV2.self]
  }
  
  static var stages: [MigrationStage] {
    [migrateV1toV2]
  }
  
  static let migrateV1toV2 = MigrationStage.custom(fromVersion: MoviesSchemaV1.self, toVersion: MoviesSchemaV2.self, willMigrate: { context in
    
    //guard let movies = try? context.fetch(FetchDescriptor<Movie>()) else { return }
    guard let movies = try? context.fetch(FetchDescriptor<MoviesSchemaV1.Movie>()) else { return }
    
    // duplicates = Set<Movie>()
    var duplicates = Set<MoviesSchemaV1.Movie>()
    var uniqueSet = Set<String>()
    
    for movie in movies {
      if !uniqueSet.insert(movie.title).inserted {
        duplicates.insert(movie)
      }
    }
    
    for movie in duplicates {
      guard let movieToBeUpdated = movies.first(where: { $0.id == movie.id }) else { continue }
      movieToBeUpdated.title = movieToBeUpdated.title + " \(UUID().uuidString)"
    }
    
    try? context.save()
    
  }, didMigrate: nil)
  
  
  
  
}
