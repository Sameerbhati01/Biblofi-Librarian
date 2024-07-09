//
//  BookViewModel.swift
//  newApiFetch
//
//  Created by indianrenters on 09/07/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class BooksViewModel: ObservableObject {
    @Published var books = [Book]()

    func fetchBooks() {
        let db = Firestore.firestore()
        db.collection("Books").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                if let querySnapshot = querySnapshot {
                    self.books = querySnapshot.documents.compactMap { document -> Book? in
                        try? document.data(as: Book.self)
                    }
                }
            }
        }
    }
}
