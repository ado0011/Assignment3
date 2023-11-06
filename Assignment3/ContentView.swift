//
//  ContentView.swift
//  Assignment3
//
//  Created by user247159 on 11/5/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CharacterViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.characters) { character in
                NavigationLink(destination: CharacterDetail(character: character)) {
                    HStack {
                        APIImage(url: URL(string: character.image))
                            .frame(width: 50, height: 50)
                        Text(character.name)
                    }
                }
            }
            .onAppear {
                viewModel.fetchCharacters()
            }
            .navigationTitle("Characters")
        }
    }
}


struct CharacterDetail: View {
    var character: Character

    var body: some View {
        VStack {
            APIImage(url: URL(string: character.image))
                .frame(width: 100, height: 100)
            Text(character.name)
                .font(.title)
            Text("Species: \(character.species)")
            Text("Status: \(character.status)")
        }
        .padding()
        .navigationTitle("Character Detail")
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

