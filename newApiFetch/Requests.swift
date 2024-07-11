//
//  Requests.swift
//  newApiFetch
//
//  Created by Ayushman Singh Rajawat on 09/07/24.
//

import Foundation
import FirebaseFirestoreSwift

struct Requests: Identifiable, Codable {
    @DocumentID var id: String?
    var memberId: String
    var memberEmail: String
    var bookId: String
    var status: String
    var timestamp: Date?
}
