//
//  fetchBooks.swift
//  newApiFetch
//
//  Created by indianrenters on 06/07/24.
//

import Foundation
import Combine

class BookViewModel: ObservableObject {
    @Published var books = [Item]()

    func fetchBooks(query: String) {
        let formattedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=\(formattedQuery)"
        
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let bookResponse = try JSONDecoder().decode(BookResponse2.self, from: data)
                    DispatchQueue.main.async {
                        self.books = bookResponse.items
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }
}

