import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import Firebase

struct LibrarianRequestView: View {
    @State private var requests = [Requests]()
    @State private var isUpdating = false

    var body: some View {
        List(requests) { request in
            VStack(alignment: .leading) {
                Text("Member Email: \(request.memberEmail)")
                Text("Book ID: \(request.bookId)")
                Text("Status: \(request.status)")
                    .foregroundColor(statusColor(request.status))
                HStack {
                    Button(action: {
                        if !isUpdating {
                            isUpdating = true
                            updateRequestStatus(request: request, status: "approved")
                        }
                    }) {
                        Text("Approve")
                            .foregroundColor(.green)
                            .padding()
                            .border(Color.green, width: 1)
                    }
                    Button(action: {
                        if !isUpdating {
                            isUpdating = true
                            updateRequestStatus(request: request, status: "rejected")
                        }
                    }) {
                        Text("Reject")
                            .foregroundColor(.red)
                            .padding()
                            .border(Color.red, width: 1)
                    }
                }
            }
        }
        .onAppear(perform: fetchRequests)
    }

    func fetchRequests() {
        let db = Firestore.firestore()
        db.collection("requests")
            .order(by: "timestamp", descending: true)
            .addSnapshotListener { (querySnapshot: QuerySnapshot?, error: Error?) in
                if let error = error {
                    print("Error getting documents: \(error.localizedDescription)")
                } else {
                    self.requests = querySnapshot?.documents.compactMap { document -> Requests? in
                        try? document.data(as: Requests.self)
                    } ?? []
                }
            }
    }

    func updateRequestStatus(request: Requests, status: String) {
        print("Updating request ID: \(request.id ?? "nil") to status: \(status)")
        let db = Firestore.firestore()
        if let documentId = request.id {
            db.collection("requests").document(documentId).updateData(["status": status]) { error in
                if let error = error {
                    print("Error updating document: \(error.localizedDescription)")
                    isUpdating = false // Reset isUpdating if there is an error
                } else {
                    print("Document successfully updated to \(status)")
                    // Fetch requests again to update UI
                    fetchRequests()
                    isUpdating = false // Reset isUpdating after successful update
                }
            }
        } else {
            print("Request document ID is nil")
            isUpdating = false // Reset isUpdating if the document ID is nil
        }
    }

    func statusColor(_ status: String) -> Color {
        switch status {
        case "pending":
            return .orange
        case "approved":
            return .green
        case "rejected":
            return .red
        default:
            return .black
        }
    }
}
