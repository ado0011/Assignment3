//
//  CharacterViewModel.swift
//  Assignment3
//
//  Created by user247159 on 11/5/23.
//

import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters = [Character]()

    func fetchCharacters() {
        if let url = URL(string: "https://rickandmortyapi.com/api/character/") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(CharacterResponse.self, from: data)
                        DispatchQueue.main.async {
                            self.characters = decodedData.results
                        }
                    } catch {
                        print("Error decoding data: \(error)")
                    }
                }
            }.resume()
        }
    }
}

