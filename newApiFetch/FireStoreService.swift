//
//  FireStoreService.swift
//  newApiFetch
//
//  Created by indianrenters on 07/07/24.
//


//import Foundation
//import FirebaseFirestore
//import FirebaseFirestoreSwift
//
//struct FirestoreService {
//    private let db = Firestore.firestore()
//    
//    func addBook(book: Item, count: String, completion: @escaping (Result<Void, Error>) -> Void) {
//        let collection = db.collection("Books")
//        
//        let bookData: [String: Any] = [
//            "id": book.id,
//            "title": book.volumeInfo.title,
//            "subtitle": book.volumeInfo.subtitle ?? "",
//            "authors": book.volumeInfo.authors,
//            "publisher": book.volumeInfo.publisher ?? "",
//            "publishedDate": book.volumeInfo.publishedDate,
//            "description": book.volumeInfo.description ?? "",
//            "pageCount": book.volumeInfo.pageCount ?? 0,
//            "imageLinks": [
//                "smallThumbnail": book.volumeInfo.imageLinks.smallThumbnail,
//                "thumbnail": book.volumeInfo.imageLinks.thumbnail
//            ],
//            "previewLink": book.volumeInfo.previewLink,
//            "infoLink": book.volumeInfo.infoLink,
//            "count": count,
//            "category": book.volumeInfo.categories ?? "NA",
//            "isbn-10": book.volumeInfo.industryIdentifiers ?? "NA",
//            "isbn-13": book.volumeInfo.industryIdentifiers ?? "NA"
//            
//        ]
//        
//        collection.document(book.id).setData(bookData) { error in
//            if let error = error {
//                completion(.failure(error))
//            } else {
//                completion(.success(()))
//            }
//        }
//    }
//}
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct FirestoreService {
    private let db = Firestore.firestore()
    
    func addBook(book: Item, count: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let collection = db.collection("Books")
        
        // Extract ISBN-10 and ISBN-13
        var isbn10: String?
        var isbn13: String?
        for identifier in book.volumeInfo.industryIdentifiers {
            if identifier.type == "ISBN_10" {
                isbn10 = identifier.identifier
            } else if identifier.type == "ISBN_13" {
                isbn13 = identifier.identifier
            }
        }

        let bookData: [String: Any] = [
            "id": book.id,
            "title": book.volumeInfo.title,
            "subtitle": book.volumeInfo.subtitle ?? "",
            "authors": book.volumeInfo.authors[0],
            "publisher": book.volumeInfo.publisher ?? "",
            "publishedDate": book.volumeInfo.publishedDate,
            "description": book.volumeInfo.description ?? "",
            "pageCount": book.volumeInfo.pageCount ?? 0,
            "imageLinks": [
                "smallThumbnail": book.volumeInfo.imageLinks.smallThumbnail,
                "thumbnail": book.volumeInfo.imageLinks.thumbnail
            ],
            "previewLink": book.volumeInfo.previewLink,
            "infoLink": book.volumeInfo.infoLink,
            "count": count,
            "category": book.volumeInfo.categories ?? "NA",
            "isbn-10": isbn10 ?? "NA",
            "isbn-13": isbn13 ?? "NA"
        ]
        
        collection.document(book.id).setData(bookData) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
