//
//  fetchBooks.swift
//  newApiFetch
//
//  Created by indianrenters on 06/07/24.
//

import Foundation
import Combine
//
//class BookViewModel: ObservableObject {
//    @Published var books = [Item]()
//
//    func fetchBooks(query: String) {
//        let formattedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        let urlString = "https://www.googleapis.com/books/v1/volumes?q=\(formattedQuery)"
//        
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data {
//                do {
//                    let bookResponse = try JSONDecoder().decode(BookResponse2.self, from: data)
//                    DispatchQueue.main.async {
//                        self.books = bookResponse.items
//                    }
//                } catch {
//                    print("Error decoding data: \(error)")
//                }
//            } else if let error = error {
//                print("Error fetching data: \(error)")
//            }
//        }.resume()
//    }
//}

import Foundation

//class BookViewModel: ObservableObject {
//    @Published var books = [Item]()
//
//    func fetchBooks(query: String) {
//        let formattedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        let urlString = "https://www.googleapis.com/books/v1/volumes?q=\(formattedQuery)"
//        
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data {
//                do {
//                    let bookResponse = try JSONDecoder().decode(BookResponse2.self, from: data)
//                    DispatchQueue.main.async {
//                        self.books = bookResponse.items
//                    }
//                } catch {
//                    print("Error decoding data: \(error)")
//                }
//            } else if let error = error {
//                print("Error fetching data: \(error)")
//            }
//        }.resume()
//    }
//}

import Foundation
import Combine

//class BookViewModel: ObservableObject {
//    @Published var books = [Item]()
//    
//    func fetchBooks(query: String, isISBN: Bool = false) {
//        let formattedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        let urlString: String
//        if isISBN {
//            urlString = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(formattedQuery)"
//        } else {
//            urlString = "https://www.googleapis.com/books/v1/volumes?q=\(formattedQuery)"
//        }
//        
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data {
//                do {
//                    let bookResponse = try JSONDecoder().decode(BookResponse2.self, from: data)
//                    DispatchQueue.main.async {
//                        self.books = bookResponse.items
//                    }
//                } catch {
//                    print("Error decoding data: \(error)")
//                }
//            } else if let error = error {
//                print("Error fetching data: \(error)")
//            }
//        }.resume()
//    }
//}


//class BookViewModel: ObservableObject {
//    @Published var books = [Item]()
//    
//    func fetchBooks(query: String) {
//        let formattedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        let urlString = "https://www.googleapis.com/books/v1/volumes?q=\(formattedQuery)"
//        
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data {
//                do {
//                    let bookResponse = try JSONDecoder().decode(BookResponse2.self, from: data)
//                    DispatchQueue.main.async {
//                        self.books = bookResponse.items
//                    }
//                } catch {
//                    print("Error decoding data: \(error)")
//                }
//            } else if let error = error {
//                print("Error fetching data: \(error)")
//            }
//        }.resume()
//    }
//    
//    func fetchBookByISBN(isbn: String) {
//        let formattedISBN = isbn.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        let urlString = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(formattedISBN)"
//        
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data {
//                do {
//                    let bookResponse = try JSONDecoder().decode(BookResponse2.self, from: data)
//                    DispatchQueue.main.async {
//                        self.books = bookResponse.items
//                    }
//                } catch {
//                    print("Error decoding data: \(error)")
//                }
//            } else if let error = error {
//                print("Error fetching data: \(error)")
//            }
//        }.resume()
//    }
//}


//import Foundation
//import Combine
//
//class BookViewModel: ObservableObject {
//    @Published var books = [Item]()
//    
//    func fetchBooks(query: String) {
//        let formattedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        let urlString = "https://www.googleapis.com/books/v1/volumes?q=\(formattedQuery)"
//        
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Error fetching data: \(error.localizedDescription)")
//                return
//            }
//            
//            guard let data = data else {
//                print("No data returned")
//                return
//            }
//            
//            do {
//                let bookResponse = try JSONDecoder().decode(BookResponse2.self, from: data)
//                DispatchQueue.main.async {
//                    self.books = bookResponse.items
//                }
//            } catch {
//                print("Error decoding data: \(error.localizedDescription)")
//            }
//        }.resume()
//    }
//    
//    func fetchBookByISBN(isbn: String) {
//        let formattedISBN = isbn.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        let urlString = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(formattedISBN)"
//        
//        guard let url = URL(string: urlString) else {
//            print("Invalid URL")
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Error fetching data by ISBN: \(error.localizedDescription)")
//                return
//            }
//            
//            guard let data = data else {
//                print("No data returned for ISBN")
//                return
//            }
//            
//            do {
//                let bookResponse = try JSONDecoder().decode(BookResponse2.self, from: data)
//                DispatchQueue.main.async {
//                    self.books = bookResponse.items
//                }
//            } catch {
//                print("Error decoding data by ISBN: \(error.localizedDescription)")
//            }
//        }.resume()
//    }
//}


import Foundation

class BookViewModel: ObservableObject {
    @Published var books = [Item]()
    
    func fetchBooks(query: String) {
        let formattedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString: String
        
        if isISBN(query) {
            urlString = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(formattedQuery)"
        } else {
            urlString = "https://www.googleapis.com/books/v1/volumes?q=\(formattedQuery)"
        }
        
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data returned")
                return
            }
            
            do {
                let bookResponse = try JSONDecoder().decode(BookResponse2.self, from: data)
                DispatchQueue.main.async {
                    self.books = bookResponse.items
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    private func isISBN(_ query: String) -> Bool {
        // Basic validation for ISBN: either 10 or 13 characters with dashes or spaces
        let regex = #"^(?:\d[\s-]?){9,12}\d$"#
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: query)
    }
}
