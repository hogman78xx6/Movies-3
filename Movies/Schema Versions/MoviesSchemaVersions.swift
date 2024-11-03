//
//  MoviesSchemaVersions.swift
//  Movies
//
//  Created by Mohammad Azam on 7/25/23.
//  Updated by Michael Knych to work with Xcode 16.1 and Swift 5
//

import Foundation
import SwiftData

enum MoviesSchemaV1: VersionedSchema {
  
  //static var versionIdentifier: String? = "Initial version."
  static var versionIdentifier: Schema.Version = Schema.Version(1, 0, 0)
  
  static var models: [any PersistentModel.Type] {
    // add all three models into Schema
    [Movie.self, Review.self, Actor.self]
  }
  
  @Model
  final class Movie {
    
    var title: String
    var year: Int
    
    var reviewsCount: Int {
      reviews.count
    }
    
    var actorsCount: Int {
      actors.count
    }
    
    //@Relationship(.cascade, inverse: \Review.movie)
    @Relationship(deleteRule: .cascade, inverse: \Review.movie)
    var reviews: [Review] = []
    
    //@Relationship(.noAction, inverse: \Actor.movies)
    @Relationship(deleteRule: .nullify, inverse: \Actor.movies)
    var actors: [Actor] = []
    
    init(title: String, year: Int) {
      self.title = title
      self.year = year
    }
  }
  
  @Model
  final class Review {
    var subject: String
    var body: String
    var movie: Movie?
    
    init(subject: String, body: String) {
      self.subject = subject
      self.body = body
    }
  }
  
  @Model
  final class Actor {
  
      var name: String
      var movies: [Movie] = []
  
      init(name: String) {
          self.name = name
      }
  }
  
}


enum MoviesSchemaV2: VersionedSchema {
  
  //static var versionIdentifier: String? = "Adding unique constraint to movie name."
  static var versionIdentifier: Schema.Version = Schema.Version(1, 1, 0)
  
  static var models: [any PersistentModel.Type] {
    // add all three models into Schema
    [Movie.self, Review.self, Actor.self]
  }
  
  @Model
  final class Movie {
    
    @Attribute(.unique) var title: String
    var year: Int
    
    var reviewsCount: Int {
      reviews.count
    }
    
    var actorsCount: Int {
      actors.count
    }
    
    //@Relationship(.cascade, inverse: \Review.movie)
    @Relationship(deleteRule: .cascade, inverse: \Review.movie)
    var reviews: [Review] = []
    
    //@Relationship(.noAction, inverse: \Actor.movies)
    @Relationship(deleteRule: .nullify, inverse: \Actor.movies)    var actors: [Actor] = []
    
    init(title: String, year: Int) {
      self.title = title
      self.year = year
    }
  }
  
  @Model
  final class Review {
    var subject: String
    var body: String
    var movie: Movie?
    
    init(subject: String, body: String) {
      self.subject = subject
      self.body = body
    }
  }
  
  @Model
  final class Actor {
  
      var name: String
      var movies: [Movie] = []
  
      init(name: String) {
          self.name = name
      }
  }
  
}

