//
//  ActorCellView.swift
//  Movies
//
//  Created by Mohammad Azam on 6/8/23.
//  Updated by Michael Knych to work with Xcode 16.1 and Swift 5
//

import SwiftUI

struct ActorCellView: View {
    
    let actor: Actor
    
    var body: some View {
        VStack(alignment: .leading) {
            let _ = print(actor.name)
            Text(actor.name)
            Text(actor.movies.map { $0.title }, format: .list(type: .and))
                .font(.caption)
        }
    }
}

