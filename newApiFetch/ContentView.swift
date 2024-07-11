

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import UniformTypeIdentifiers

struct Book: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var count: String
    var description: String?
    var authors: [String]?
    var imageLinks: ImageLinksCustom?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case count
        case description
        case authors
        case imageLinks
    }
}

struct ImageLinksCustom: Codable {
    var smallThumbnail: String?
    var thumbnail: String?
}

struct ContentView: View {
    @State private var selection: Int? = 1
    
    var body: some View {
        NavigationView {
            
            TabView{
                List {
                    VStack {
                        Image("BibloFi")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300) // Adjust size as needed
                            .padding()
                        
                        Text("BibloFi")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex:"9E6028"))
                            .padding(.bottom, 20) // Adjust as needed
                    }
                    NavigationLink(destination: DashboardView(), tag: 1, selection: $selection)  {
                        HStack {
                            Image(systemName: "rectangle.grid.2x2")
                            Text("Dashboard")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .background(Color(hex:"9E6028"))
                    .frame(width: 300)
                    
                    
                    NavigationLink(destination: LibrarianRequestView(), tag: 1, selection: $selection)  {
                        HStack {
                            Image(systemName: "person.2.fill")
                            Text("Queue")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex:"9E6028"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .frame(width: 300)
                    
                    NavigationLink(destination: ResourceView(selection: $selection), tag: 3, selection: $selection) {
                        HStack {
                            Image(systemName: "book.closed.fill")
                            Text("Resources")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex:"9E6028"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .frame(width: 300) // Fixed width for consistent size
                    
                    NavigationLink(destination: BooksView(), tag: 4, selection: $selection) {
                        HStack {
                            Image(systemName: "megaphone.fill")
                            Text("Books")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex:"9E6028"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .frame(width: 300)
                    
                    
                    
                    
                    NavigationLink(destination: AnnouncementView(), tag: 5, selection: $selection) {
                        HStack {
                            Image(systemName: "megaphone.fill")
                            Text("Announcement")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex:"9E6028"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .frame(width: 300)
                    
                }
                .padding()
            }/*background(Color(hex:"F7EEEB"))*/
            //            TabView {
            //                VStack {
            //                    VStack {
            //                        Image("BibloFi")
            //                            .resizable()
            //                            .aspectRatio(contentMode: .fit)
            //                            .frame(width: 300, height: 300) // Adjust size as needed
            //                            .padding()
            //
            //                        Text("BibloFi")
            //                            .font(.largeTitle)
            //                            .fontWeight(.bold)
            //                            .foregroundColor(Color(hex:"9E6028"))
            //                            .padding(.bottom, 20) // Adjust as needed
            //                    }
            //                    .padding(.top, 20) // Adjust spacing from top
            //
            //                    VStack(spacing: 20) {
            //                        NavigationLink(destination: DashboardView(), tag: 1, selection: $selection)  {
            //                            HStack {
            //                                Image(systemName: "rectangle.grid.2x2")
            //                                Text("Dashboard")
            //                            }
            //                            .frame(maxWidth: .infinity)
            //                            .padding()
            //                            .background(Color(hex:"9E6028"))
            //                            .foregroundColor(.white)
            //                            .cornerRadius(10)
            //                        }
            //                        .frame(width: 300)
            //
            //                        NavigationLink(destination: LibrarianRequestView(), tag: 2, selection: $selection) {
            //                            HStack {
            //                                Image(systemName: "person.2.fill")
            //                                Text("Queue")
            //                            }
            //                            .frame(maxWidth: .infinity)
            //                            .padding()
            //                            .background(Color(hex:"9E6028"))
            //                            .foregroundColor(.white)
            //                            .cornerRadius(10)
            //                        }
            //                        .frame(width: 300) // Fixed width for consistent size
            //
            //                        NavigationLink(destination: ResourceView(selection: $selection), tag: 3, selection: $selection) {
            //                            HStack {
            //                                Image(systemName: "book.closed.fill")
            //                                Text("Resources")
            //                            }
            //                            .frame(maxWidth: .infinity)
            //                            .padding()
            //                            .background(Color(hex:"9E6028"))
            //                            .foregroundColor(.white)
            //                            .cornerRadius(10)
            //                        }
            //                        .frame(width: 300) // Fixed width for consistent size
            //
            //                        NavigationLink(destination: BooksView(), tag: 4, selection: $selection) {
            //                            HStack {
            //                                Image(systemName: "megaphone.fill")
            //                                Text("Books")
            //                            }
            //                            .frame(maxWidth: .infinity)
            //                            .padding()
            //                            .background(Color(hex:"9E6028"))
            //                            .foregroundColor(.white)
            //                            .cornerRadius(10)
            //                        }
            //                        .frame(width: 300)
            //
            //                        NavigationLink(destination: AnnouncementView(), tag: 5, selection: $selection) {
            //                            HStack {
            //                                Image(systemName: "megaphone.fill")
            //                                Text("Announcement")
            //                            }
            //                            .frame(maxWidth: .infinity)
            //                            .padding()
            //                            .background(Color(hex:"9E6028"))
            //                            .foregroundColor(.white)
            //                            .cornerRadius(10)
            //                        }
            //                        .frame(width: 300)
            //
            //                    }
            //                    .padding()
            //                    // Background color for the main VStack
            //                    .edgesIgnoringSafeArea(.bottom) // Ignore safe area to extend color to bottom
            //
            //                    Spacer()
            //                }
            //                .navigationTitle("") // Empty navigation title to hide default title
            //                .navigationBarHidden(true)
            //                // Hide navigation bar
            //                .navigationViewStyle(StackNavigationViewStyle()) // Use stack navigation view style
            //
            //                .background(Color(hex:"F7EEEB"))
            //            }
            
        }
    }
}

struct DashboardView: View {
    var body: some View {
        Text("Dashboard")
            .font(.largeTitle)
    }
}

struct QueueView: View {
    var body: some View {
        Text("Queue")
            .font(.largeTitle)
        
    }
}

struct AnnouncementView: View {
    var body: some View {
        Text("Announ")
            .font(.largeTitle)
    }
}

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

struct BooksView: View {
    @ObservedObject var viewModel = BooksViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            HStack {
                Text("Books")
                    .font(.custom("Avenir Next", size: 42))
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "5D4037"))
                    .padding(.top, 20)
                Spacer()
            }
            .padding(.horizontal, 30)
            
            HStack {
                Spacer()
                    .frame(width: 90)
                Text("Book title")
                    .font(.custom("Avenir Next", size: 18))
                    .frame(width: 150, alignment: .leading )
                Spacer()
                    .frame(width: 70)
                Text("No. Of Copies or count")
                    .font(.custom("Avenir Next", size: 18))
                    .frame(width: 200, alignment: .leading)
                //                Spacer()
                //                    .frame(width: 70)
                //                Text("Thumbnail")
                //                    .font(.custom("Avenir Next", size: 18))
                //                    .frame(width: 100, alignment: .leading)
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 10)
            
            List(viewModel.books) { book in
                HStack {
                    if let urlString = book.imageLinks?.thumbnail, let url = URL(string: urlString) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image.resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            @unknown default:
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            }
                        }
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                    Spacer()
                        .frame(width: 30)
                    Text(book.title)
                        .font(.custom("Avenir Next", size: 18))
                        .frame(width: 150, alignment: .leading)
                    Spacer()
                        .frame(width: 70)
                    Text(book.count)
                        .font(.custom("Avenir Next", size: 18))
                        .frame(width: 200, alignment: .leading)
                    Spacer()
                        .frame(width: 70)
                    
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
            }
        }
        .padding(.top, 20)
        .background(Color(hex: "FDF5E6"))
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            viewModel.fetchBooks()
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8 * 4), (int >> 4 * 4), (int >> 0 * 4))
            self.init(red: Double(r) / 15, green: Double(g) / 15, blue: Double(b) / 15)
        case 6:
            (a, r, g, b) = (255, (int >> 16), (int >> 8 & 0xFF), (int >> 0 & 0xFF))
            self.init(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
        case 8:
            (a, r, g, b) = ((int >> 24), (int >> 16 & 0xFF), (int >> 8 & 0xFF), (int >> 0 & 0xFF))
            self.init(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: Double(a) / 255)
        default:
            self.init(.clear)
        }
    }
}


struct ResourceView: View {
    @State private var searchText = ""
    @ObservedObject var viewModel = BookViewModel()
    @Binding var selection: Int?
    
    var body: some View {
        VStack {
            TextField("Search for books or ISBN", text: $searchText, onCommit: {
                viewModel.fetchBooks(query: searchText)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            List(viewModel.books, id: \.id) { book in
                NavigationLink(destination: BookDetailView(book: book, selection: $selection)) {
                    HStack {
                        if let url = URL(string: book.volumeInfo.imageLinks.thumbnail) {
                            AsyncImage(url: url) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 75)
                                } else if phase.error != nil {
                                    Color.red // Indicates an error
                                        .frame(width: 50, height: 75)
                                } else {
                                    Color.gray // Placeholder color
                                        .frame(width: 50, height: 75)
                                }
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text(book.volumeInfo.title)
                                .font(.headline)
                            Text(book.volumeInfo.subtitle ?? "")
                                .font(.subheadline)
                            Text(book.volumeInfo.authors.joined(separator: ", "))
                                .font(.caption)
                        }
                    }
                }
            }
        }
        .navigationTitle("Resource")
    }
}

struct BookDetailView: View {
    var book: Item
    @State private var totalCount: String = ""
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @Binding var selection: Int?
    @Environment(\.presentationMode) var presentationMode
    
    let firestoreService = FirestoreService()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                if let url = URL(string: book.volumeInfo.imageLinks.thumbnail) {
                    AsyncImage(url: url) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 200)
                        } else if phase.error != nil {
                            Color.red
                                .frame(width: 150, height: 200)
                        } else {
                            Color.gray
                                .frame(width: 150, height: 200)
                        }
                    }
                }
                
                Text(book.volumeInfo.title)
                    .font(.largeTitle)
                    .bold()
                
                Text(book.volumeInfo.subtitle ?? "")
                    .font(.title2)
                    .foregroundColor(.secondary)
                
                Text("By \(book.volumeInfo.authors.joined(separator: ", "))")
                    .font(.title3)
                    .foregroundColor(.secondary)
                
                Text("Published by \(book.volumeInfo.publisher ?? "Unknown") in \(book.volumeInfo.publishedDate)")
                    .font(.body)
                
                if let description = book.volumeInfo.description {
                    Text(description)
                        .font(.body)
                }
                
                HStack {
                    Spacer()
                    Text("Page Count: \(book.volumeInfo.pageCount ?? 0)")
                    Spacer()
                }
                
                HStack {
                    Link("Preview", destination: URL(string: book.volumeInfo.previewLink)!)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.top)
                    
                    TextField("Enter Count", text: $totalCount)
                        .textFieldStyle(.roundedBorder)
                        .padding(.leading, 30)
                    
                    Button(action: {
                        firestoreService.addBook(book: book, count: totalCount) { result in
                            switch result {
                            case .success:
                                alertTitle = "Success"
                                alertMessage = "The book has been successfully added to the library."
                            case .failure(let error):
                                alertTitle = "Error"
                                alertMessage = "An error occurred while adding the book to the library: \(error.localizedDescription)"
                            }
                            showAlert = true
                        }
                    }, label: {
                        Text("Save")
                    })
                }
            }
            .padding()
        }
        .navigationTitle("Book Details")
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK")) {
                    if alertTitle == "Success" {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            )
        }
    }
}




import Foundation
import Combine

struct BookResponse2: Codable {
    let kind: String
    let totalItems: Int
    let items: [Item]
}

struct Item: Codable {
    let kind: String
    let id, etag: String
    let selfLink: String
    let volumeInfo: VolumeInfo
    let saleInfo: SaleInfo
    let accessInfo: AccessInfo
    let searchInfo: SearchInfo
}

struct AccessInfo: Codable {
    let country: String
    let viewability: String
    let embeddable, publicDomain: Bool
    let textToSpeechPermission: String
    let epub: Epub
    let pdf: PDF
    let webReaderLink: String
    let accessViewStatus: String
    let quoteSharingAllowed: Bool
}

struct Epub: Codable {
    let isAvailable: Bool
}

struct PDF: Codable {
    let isAvailable: Bool
    let acsTokenLink: String?
}

struct SaleInfo: Codable {
    let country: String
    let isEbook: Bool
}

struct SearchInfo: Codable {
    let textSnippet: String
}

struct VolumeInfo: Codable {
    let title: String
    let authors: [String]
    let publisher: String?
    let publishedDate: String
    let description: String?
    let industryIdentifiers: [IndustryIdentifier]
    let readingModes: ReadingModes
    let pageCount: Int?
    let printType: String
    let categories: [String]?
    let averageRating: Double?
    let ratingsCount: Int?
    let maturityRating: String
    let allowAnonLogging: Bool
    let contentVersion: String
    let panelizationSummary: PanelizationSummary
    let imageLinks: ImageLinks
    let language: String
    let previewLink, infoLink: String
    let canonicalVolumeLink: String
    let subtitle: String?
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.authors = try container.decode([String].self, forKey: .authors)
        self.publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
        self.publishedDate = try container.decode(String.self, forKey: .publishedDate)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.industryIdentifiers = try container.decode([IndustryIdentifier].self, forKey: .industryIdentifiers)
        self.readingModes = try container.decode(ReadingModes.self, forKey: .readingModes)
        self.pageCount = try container.decodeIfPresent(Int.self, forKey: .pageCount)
        self.printType = try container.decode(String.self, forKey: .printType)
        self.categories = try container.decodeIfPresent([String].self, forKey: .categories)
        self.averageRating = try container.decodeIfPresent(Double.self, forKey: .averageRating)
        self.ratingsCount = try container.decodeIfPresent(Int.self, forKey: .ratingsCount)
        self.maturityRating = try container.decode(String.self, forKey: .maturityRating)
        self.allowAnonLogging = try container.decode(Bool.self, forKey: .allowAnonLogging)
        self.contentVersion = try container.decode(String.self, forKey: .contentVersion)
        self.panelizationSummary = try container.decode(PanelizationSummary.self, forKey: .panelizationSummary)
        self.imageLinks = try container.decode(ImageLinks.self, forKey: .imageLinks)
        self.language = try container.decode(String.self, forKey: .language)
        self.previewLink = try container.decode(String.self, forKey: .previewLink)
        self.infoLink = try container.decode(String.self, forKey: .infoLink)
        self.canonicalVolumeLink = try container.decode(String.self, forKey: .canonicalVolumeLink)
        self.subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle)
    }
    
    enum CodingKeys: CodingKey {
        case title
        case authors
        case publisher
        case publishedDate
        case description
        case industryIdentifiers
        case readingModes
        case pageCount
        case printType
        case categories
        case averageRating
        case ratingsCount
        case maturityRating
        case allowAnonLogging
        case contentVersion
        case panelizationSummary
        case imageLinks
        case language
        case previewLink
        case infoLink
        case canonicalVolumeLink
        case subtitle
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.authors, forKey: .authors)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encode(self.publishedDate, forKey: .publishedDate)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encode(self.industryIdentifiers, forKey: .industryIdentifiers)
        try container.encode(self.readingModes, forKey: .readingModes)
        try container.encodeIfPresent(self.pageCount, forKey: .pageCount)
        try container.encode(self.printType, forKey: .printType)
        try container.encodeIfPresent(self.categories, forKey: .categories)
        try container.encodeIfPresent(self.averageRating, forKey: .averageRating)
        try container.encodeIfPresent(self.ratingsCount, forKey: .ratingsCount)
        try container.encode(self.maturityRating, forKey: .maturityRating)
        try container.encode(self.allowAnonLogging, forKey: .allowAnonLogging)
        try container.encode(self.contentVersion, forKey: .contentVersion)
        try container.encode(self.panelizationSummary, forKey: .panelizationSummary)
        try container.encode(self.imageLinks, forKey: .imageLinks)
        try container.encode(self.language, forKey: .language)
        try container.encode(self.previewLink, forKey: .previewLink)
        try container.encode(self.infoLink, forKey: .infoLink)
        try container.encode(self.canonicalVolumeLink, forKey: .canonicalVolumeLink)
        try container.encodeIfPresent(self.subtitle, forKey: .subtitle)
    }
}

struct ImageLinks: Codable {
    let smallThumbnail, thumbnail: String
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.smallThumbnail = try container.decode(String.self, forKey: .smallThumbnail)
        self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
    }
    
    enum CodingKeys: CodingKey {
        case smallThumbnail
        case thumbnail
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.smallThumbnail, forKey: .smallThumbnail)
        try container.encode(self.thumbnail, forKey: .thumbnail)
    }
}

struct IndustryIdentifier: Codable {
    let type: String
    let identifier: String
}

struct ReadingModes: Codable {
    let text, image: Bool
}

struct PanelizationSummary: Codable {
    let containsEpubBubbles, containsImageBubbles: Bool
}

#Preview {
    ContentView()
}


// Google Books API structures
//struct BookResponse2: Codable {
//    let kind: String
//    let totalItems: Int
//    let items: [Item]
//}
//
//struct Item: Codable {
//    let kind: String
//    let id, etag: String
//    let selfLink: String
//    let volumeInfo: VolumeInfo
//    let saleInfo: SaleInfo
//    let accessInfo: AccessInfo
//    let searchInfo: SearchInfo
//    // var bookCount: Int = 0
//}
//
//struct AccessInfo: Codable {
//    let country: String
//    let viewability: String
//    let embeddable, publicDomain: Bool
//    let textToSpeechPermission: String
//    let epub: Epub
//    let pdf: PDF
//    let webReaderLink: String
//    let accessViewStatus: String
//    let quoteSharingAllowed: Bool
//}
//
//struct Epub: Codable {
//    let isAvailable: Bool
//}
//
//struct PDF: Codable {
//    let isAvailable: Bool
//    let acsTokenLink: String?
//}
//
//struct SaleInfo: Codable {
//    let country: String
//    let isEbook: Bool
//}
//
//struct SearchInfo: Codable {
//    let textSnippet: String
//}
//
//struct VolumeInfo: Codable {
//    let title: String
//    let authors: [String]
//    let publisher: String?
//    let publishedDate: String
//    let description: String?
//    let industryIdentifiers: [IndustryIdentifier]
//    let readingModes: ReadingModes
//    let pageCount: Int?
//    let printType: String
//    let categories: [String]?
//    let averageRating: Double?
//    let ratingsCount: Int?
//    let maturityRating: String
//    let allowAnonLogging: Bool
//    let contentVersion: String
//    let panelizationSummary: PanelizationSummary
//    let imageLinks: ImageLinks
//    let language: String
//    let previewLink, infoLink: String
//    let canonicalVolumeLink: String
//    let subtitle: String?
//
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.title = try container.decode(String.self, forKey: .title)
//        self.authors = try container.decode([String].self, forKey: .authors)
//        self.publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
//        self.publishedDate = try container.decode(String.self, forKey: .publishedDate)
//        self.description = try container.decodeIfPresent(String.self, forKey: .description)
//        self.industryIdentifiers = try container.decode([IndustryIdentifier].self, forKey: .industryIdentifiers)
//        self.readingModes = try container.decode(ReadingModes.self, forKey: .readingModes)
//        self.pageCount = try container.decodeIfPresent(Int.self, forKey: .pageCount)
//        self.printType = try container.decode(String.self, forKey: .printType)
//        self.categories = try container.decodeIfPresent([String].self, forKey: .categories)
//        self.averageRating = try container.decodeIfPresent(Double.self, forKey: .averageRating)
//        self.ratingsCount = try container.decodeIfPresent(Int.self, forKey: .ratingsCount)
//        self.maturityRating = try container.decode(String.self, forKey: .maturityRating)
//        self.allowAnonLogging = try container.decode(Bool.self, forKey: .allowAnonLogging)
//        self.contentVersion = try container.decode(String.self, forKey: .contentVersion)
//        self.panelizationSummary = try container.decode(PanelizationSummary.self, forKey: .panelizationSummary)
//        self.imageLinks = try container.decode(ImageLinks.self, forKey: .imageLinks)
//        self.language = try container.decode(String.self, forKey: .language)
//        self.previewLink = try container.decode(String.self, forKey: .previewLink)
//        self.infoLink = try container.decode(String.self, forKey: .infoLink)
//        self.canonicalVolumeLink = try container.decode(String.self, forKey: .canonicalVolumeLink)
//        self.subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle)
//    }
//
//    enum CodingKeys: CodingKey {
//        case title
//        case authors
//        case publisher
//        case publishedDate
//        case description
//        case industryIdentifiers
//        case readingModes
//        case pageCount
//        case printType
//        case categories
//        case averageRating
//        case ratingsCount
//        case maturityRating
//        case allowAnonLogging
//        case contentVersion
//        case panelizationSummary
//        case imageLinks
//        case language
//        case previewLink
//        case infoLink
//        case canonicalVolumeLink
//        case subtitle
//    }
//
//    func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.title, forKey: .title)
//        try container.encode(self.authors, forKey: .authors)
//        try container.encodeIfPresent(self.publisher, forKey: .publisher)
//        try container.encode(self.publishedDate, forKey: .publishedDate)
//        try container.encodeIfPresent(self.description, forKey: .description)
//        try container.encode(self.industryIdentifiers, forKey: .industryIdentifiers)
//        try container.encode(self.readingModes, forKey: .readingModes)
//        try container.encodeIfPresent(self.pageCount, forKey: .pageCount)
//        try container.encode(self.printType, forKey: .printType)
//        try container.encodeIfPresent(self.categories, forKey: .categories)
//        try container.encodeIfPresent(self.averageRating, forKey: .averageRating)
//        try container.encodeIfPresent(self.ratingsCount, forKey: .ratingsCount)
//        try container.encode(self.maturityRating, forKey: .maturityRating)
//        try container.encode(self.allowAnonLogging, forKey: .allowAnonLogging)
//        try container.encode(self.contentVersion, forKey: .contentVersion)
//        try container.encode(self.panelizationSummary, forKey: .panelizationSummary)
//        try container.encode(self.imageLinks, forKey: .imageLinks)
//        try container.encode(self.language, forKey: .language)
//        try container.encode(self.previewLink, forKey: .previewLink)
//        try container.encode(self.infoLink, forKey: .infoLink)
//        try container.encode(self.canonicalVolumeLink, forKey: .canonicalVolumeLink)
//        try container.encodeIfPresent(self.subtitle, forKey: .subtitle)
//    }
//}
//
//struct ImageLinks: Codable {
//    let smallThumbnail, thumbnail: String
//
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.smallThumbnail = try container.decode(String.self, forKey: .smallThumbnail)
//        self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
//    }
//
//    enum CodingKeys: CodingKey {
//        case smallThumbnail
//        case thumbnail
//    }
//
//    func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.smallThumbnail, forKey: .smallThumbnail)
//        try container.encode(self.thumbnail, forKey: .thumbnail)
//    }
//}
//
//struct IndustryIdentifier: Codable {
//    let type: String
//    let identifier: String
//}
//
//struct ReadingModes: Codable {
//    let text, image: Bool
//}
//
//struct PanelizationSummary: Codable {
//    let containsEpubBubbles, containsImageBubbles: Bool
//}
//
//#Preview {
//    ContentView()
//}
//
