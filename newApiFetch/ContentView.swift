//import SwiftUI
//
//struct ContentView: View {
//    @State private var selection: Int? = 1
//
//    var body: some View {
//        NavigationView {
//            List {
//                NavigationLink(destination: DashboardView(), tag: 1, selection: $selection) {
//                    Label("Dashboard", systemImage: "house")
//                }
//                NavigationLink(destination: QueueView(), tag: 2, selection: $selection) {
//                    Label("Queue", systemImage: "clock")
//                }
//                NavigationLink(destination: ResourceView(), tag: 3, selection: $selection) {
//                    Label("Resource", systemImage: "book")
//                }
//                NavigationLink(destination: AnnouncementView(), tag: 4, selection: $selection) {
//                    Label("Announcement", systemImage: "megaphone")
//                }
//            }
//            .listStyle(SidebarListStyle())
//            .navigationTitle("Sidebar")
//            
//            DashboardView() // Default view when no selection
//        }
//    }
//}
//
//struct DashboardView: View {
//    var body: some View {
//        Text("Dashboard")
//            .font(.largeTitle)
//    }
//}
//
//struct QueueView: View {
//    var body: some View {
//        Text("Queue")
//            .font(.largeTitle)
//    }
//}
//
//struct AnnouncementView: View {
//    var body: some View {
//        Text("Announcement")
//            .font(.largeTitle)
//    }
//}
//
//struct ResourceView: View {
//    @State private var searchText = ""
//    @ObservedObject var viewModel = BookViewModel()
//
//    var body: some View {
//        VStack {
//            TextField("Search for books", text: $searchText, onCommit: {
//                viewModel.fetchBooks(query: searchText)
//            })
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            .padding()
//
//            List(viewModel.books, id: \.id) { book in
//                HStack{
//                    
//                    VStack(alignment: .leading) {
//                        Text(book.volumeInfo.title)
//                            .font(.headline)
//                        Text(book.volumeInfo.subtitle ?? "")
//                            .font(.subheadline)
//                        Text(book.volumeInfo.authors.joined(separator: ", "))
//                            .font(.caption)
//                    }
//                }
//            }
//        }
//        .navigationTitle("Resource")
//    }
//}
//
//
//// Google Books API structures
//struct BookResponse2: Codable {
//    let kind: String
//    let totalItems: Int
//    let items: [Item]
//    
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.kind = try container.decode(String.self, forKey: .kind)
//        self.totalItems = try container.decode(Int.self, forKey: .totalItems)
//        self.items = try container.decode([Item].self, forKey: .items)
//    }
//    enum CodingKeys: CodingKey {
//        case kind
//        case totalItems
//        case items
//    }
//    
//    func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.kind, forKey: .kind)
//        try container.encode(self.totalItems, forKey: .totalItems)
//        try container.encode(self.items, forKey: .items)
//    }
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
//    
//    func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.kind, forKey: .kind)
//        try container.encode(self.id, forKey: .id)
//        try container.encode(self.etag, forKey: .etag)
//        try container.encode(self.selfLink, forKey: .selfLink)
//        try container.encode(self.volumeInfo, forKey: .volumeInfo)
//        try container.encode(self.saleInfo, forKey: .saleInfo)
//        try container.encode(self.accessInfo, forKey: .accessInfo)
//        try container.encode(self.searchInfo, forKey: .searchInfo)
//    }
//    
//    enum CodingKeys: CodingKey {
//        case kind
//        case id
//        case etag
//        case selfLink
//        case volumeInfo
//        case saleInfo
//        case accessInfo
//        case searchInfo
//    }
//    
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.kind = try container.decode(String.self, forKey: .kind)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.etag = try container.decode(String.self, forKey: .etag)
//        self.selfLink = try container.decode(String.self, forKey: .selfLink)
//        self.volumeInfo = try container.decode(VolumeInfo.self, forKey: .volumeInfo)
//        self.saleInfo = try container.decode(SaleInfo.self, forKey: .saleInfo)
//        self.accessInfo = try container.decode(AccessInfo.self, forKey: .accessInfo)
//        self.searchInfo = try container.decode(SearchInfo.self, forKey: .searchInfo)
//    }
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
//    func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.country, forKey: .country)
//        try container.encode(self.viewability, forKey: .viewability)
//        try container.encode(self.embeddable, forKey: .embeddable)
//        try container.encode(self.publicDomain, forKey: .publicDomain)
//        try container.encode(self.textToSpeechPermission, forKey: .textToSpeechPermission)
//        try container.encode(self.epub, forKey: .epub)
//        try container.encode(self.pdf, forKey: .pdf)
//        try container.encode(self.webReaderLink, forKey: .webReaderLink)
//        try container.encode(self.accessViewStatus, forKey: .accessViewStatus)
//        try container.encode(self.quoteSharingAllowed, forKey: .quoteSharingAllowed)
//    }
//    enum CodingKeys: CodingKey {
//        case country
//        case viewability
//        case embeddable
//        case publicDomain
//        case textToSpeechPermission
//        case epub
//        case pdf
//        case webReaderLink
//        case accessViewStatus
//        case quoteSharingAllowed
//    }
//    
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.country = try container.decode(String.self, forKey: .country)
//        self.viewability = try container.decode(String.self, forKey: .viewability)
//        self.embeddable = try container.decode(Bool.self, forKey: .embeddable)
//        self.publicDomain = try container.decode(Bool.self, forKey: .publicDomain)
//        self.textToSpeechPermission = try container.decode(String.self, forKey: .textToSpeechPermission)
//        self.epub = try container.decode(Epub.self, forKey: .epub)
//        self.pdf = try container.decode(PDF.self, forKey: .pdf)
//        self.webReaderLink = try container.decode(String.self, forKey: .webReaderLink)
//        self.accessViewStatus = try container.decode(String.self, forKey: .accessViewStatus)
//        self.quoteSharingAllowed = try container.decode(Bool.self, forKey: .quoteSharingAllowed)
//    }
//}
//
//struct Epub: Codable {
//    let isAvailable: Bool
//    func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.isAvailable, forKey: .isAvailable)
//    }
//    enum CodingKeys: CodingKey {
//        case isAvailable
//    }
//    
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.isAvailable = try container.decode(Bool.self, forKey: .isAvailable)
//    }
//}
//
//struct PDF: Codable {
//    let isAvailable: Bool
//    let acsTokenLink: String?
//    func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.isAvailable, forKey: .isAvailable)
//        try container.encodeIfPresent(self.acsTokenLink, forKey: .acsTokenLink)
//    }
//    enum CodingKeys: CodingKey {
//        case isAvailable
//        case acsTokenLink
//    }
//    
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.isAvailable = try container.decode(Bool.self, forKey: .isAvailable)
//        self.acsTokenLink = try container.decodeIfPresent(String.self, forKey: .acsTokenLink)
//    }
//}
//
//struct SaleInfo: Codable {
//    let country: String
//    let isEbook: Bool
//    func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.country, forKey: .country)
//        try container.encode(self.isEbook, forKey: .isEbook)
//    }
//    enum CodingKeys: CodingKey {
//        case country
//        case isEbook
//    }
//    
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.country = try container.decode(String.self, forKey: .country)
//        self.isEbook = try container.decode(Bool.self, forKey: .isEbook)
//    }
//}
//
//struct SearchInfo: Codable {
//    let textSnippet: String
//    func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.textSnippet, forKey: .textSnippet)
//    }
//    enum CodingKeys: CodingKey {
//        case textSnippet
//    }
//    
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.textSnippet = try container.decode(String.self, forKey: .textSnippet)
//    }
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
//}
//
//struct ImageLinks: Codable {
//    let smallThumbnail, thumbnail: String
//    func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.smallThumbnail, forKey: .smallThumbnail)
//        try container.encode(self.thumbnail, forKey: .thumbnail)
//    }
//    enum CodingKeys: CodingKey {
//        case smallThumbnail
//        case thumbnail
//    }
//    
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.smallThumbnail = try container.decode(String.self, forKey: .smallThumbnail)
//        self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
//    }
//}
//
//struct IndustryIdentifier: Codable {
//    let type: String
//    let identifier: String
//    func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.type, forKey: .type)
//        try container.encode(self.identifier, forKey: .identifier)
//    }
//    enum CodingKeys: CodingKey {
//        case type
//        case identifier
//    }
//    
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.type = try container.decode(String.self, forKey: .type)
//        self.identifier = try container.decode(String.self, forKey: .identifier)
//    }
//}
//
//struct ReadingModes: Codable {
//    let text, image: Bool
//    func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.text, forKey: .text)
//        try container.encode(self.image, forKey: .image)
//    }
//    enum CodingKeys: CodingKey {
//        case text
//        case image
//    }
//    
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.text = try container.decode(Bool.self, forKey: .text)
//        self.image = try container.decode(Bool.self, forKey: .image)
//    }
//}
//
//struct PanelizationSummary: Codable {
//    let containsEpubBubbles, containsImageBubbles: Bool
//    func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.containsEpubBubbles, forKey: .containsEpubBubbles)
//        try container.encode(self.containsImageBubbles, forKey: .containsImageBubbles)
//    }
//    enum CodingKeys: CodingKey {
//        case containsEpubBubbles
//        case containsImageBubbles
//    }
//    
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.containsEpubBubbles = try container.decode(Bool.self, forKey: .containsEpubBubbles)
//        self.containsImageBubbles = try container.decode(Bool.self, forKey: .containsImageBubbles)
//    }
//}






//import SwiftUI
//
//struct ContentView: View {
//    @State private var selection: Int? = 1
//    
//    var body: some View {
//        NavigationView {
//            List {
//                NavigationLink(destination: DashboardView(), tag: 1, selection: $selection) {
//                    Label("Dashboard", systemImage: "house")
//                }
//                NavigationLink(destination: QueueView(), tag: 2, selection: $selection) {
//                    Label("Queue", systemImage: "clock")
//                }
//                NavigationLink(destination: ResourceView(), tag: 3, selection: $selection) {
//                    Label("Resource", systemImage: "book")
//                }
//                NavigationLink(destination: AnnouncementView(), tag: 4, selection: $selection) {
//                    Label("Announcement", systemImage: "megaphone")
//                }
//            }
//            .listStyle(SidebarListStyle())
//            .navigationTitle("Sidebar")
//            
//            DashboardView() // Default view when no selection
//        }
//    }
//}
//
//struct DashboardView: View {
//    var body: some View {
//        Text("Dashboard")
//            .font(.largeTitle)
//    }
//}
//
//struct QueueView: View {
//    var body: some View {
//        Text("Queue")
//            .font(.largeTitle)
//    }
//}
//
//struct AnnouncementView: View {
//    var body: some View {
//        Text("Announcement")
//            .font(.largeTitle)
//    }
//}
//
//struct ResourceView: View {
//    @State private var searchText = ""
//    @ObservedObject var viewModel = BookViewModel()
//    
//    var body: some View {
//            VStack {
//                TextField("Search for books", text: $searchText, onCommit: {
//                    viewModel.fetchBooks(query: searchText)
//                })
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//                
//                List(viewModel.books, id: \.id) { book in
//                    NavigationLink(destination: BookDetailView(book: book)) {
//                        HStack {
//                            if let url = URL(string: book.volumeInfo.imageLinks.smallThumbnail) {
//                                AsyncImage(url: url) { phase in
//                                    if let image = phase.image {
//                                        image
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fit)
//                                            .frame(width: 50, height: 75)
//                                    } else if phase.error != nil {
//                                        Color.red // Indicates an error
//                                            .frame(width: 50, height: 75)
//                                    } else {
//                                        Color.gray // Placeholder color
//                                            .frame(width: 50, height: 75)
//                                    }
//                                }
//                            }
//                            
//                            VStack(alignment: .leading) {
//                                Text(book.volumeInfo.title)
//                                    .font(.headline)
//                                Text(book.volumeInfo.subtitle ?? "")
//                                    .font(.subheadline)
//                                Text(book.volumeInfo.authors.joined(separator: ", "))
//                                    .font(.caption)
//                            }
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Resource")
//        }
//}
//
//struct BookDetailView: View {
//    var book: Item
//    @State private var totalCount: String = ""
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 10) {
//                if let url = URL(string: book.volumeInfo.imageLinks.thumbnail) {
//                    AsyncImage(url: url) { phase in
//                        if let image = phase.image {
//                            image
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 150, height: 200)
//                        } else if phase.error != nil {
//                            Color.red // Indicates an error
//                                .frame(width: 150, height: 200)
//                        } else {
//                            Color.gray // Placeholder color
//                                .frame(width: 150, height: 200)
//                        }
//                    }
//                }
//
//                Text(book.volumeInfo.title)
//                    .font(.largeTitle)
//                    .bold()
//
//                Text(book.volumeInfo.subtitle ?? "")
//                    .font(.title2)
//                    .foregroundColor(.secondary)
//
//                Text("By \(book.volumeInfo.authors.joined(separator: ", "))")
//                    .font(.title3)
//                    .foregroundColor(.secondary)
//
//                Text("Published by \(book.volumeInfo.publisher ?? "Unknown") in \(book.volumeInfo.publishedDate)")
//                    .font(.body)
//
//                if let description = book.volumeInfo.description {
//                    Text(description)
//                        .font(.body)
//                }
//
//                HStack {
//                    Spacer()
//                    Text("Page Count: \(book.volumeInfo.pageCount ?? 0)")
//                    Spacer()
////                    Text("Average Rating: \(String(format: "%.1f", book.volumeInfo.averageRating ?? 0.0)) (\(book.volumeInfo.ratingsCount ?? 0) ratings)")
//                    Spacer()
//                }
//
//                HStack {
//                    Link("Preview", destination: URL(string: book.volumeInfo.previewLink)!)
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                    .padding(.top)
//                    
//                    TextField("Enter Count", text: $totalCount).textFieldStyle(.roundedBorder).padding(.leading, 30)
//                    
//                    Button(action: {
//                        //book.bookCount = Int(totalCount) ?? 0
//                    }, label: {
//                        Text("Save")
//                    })
//                }
//            }
//            .padding()
//        }
//        .navigationTitle("Book Details")
//    }
//}
//
//
//
//// Google Books API structures
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
////    var bookCount: Int = 0
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
//
//#Preview {
//    ContentView()
//}
//
//


//import SwiftUI
//
//struct ContentView: View {
//    @State private var selection: Int? = 1
//    
//    var body: some View {
//        NavigationView {
//            List {
//                NavigationLink(destination: DashboardView(), tag: 1, selection: $selection) {
//                    Label("Dashboard", systemImage: "house")
//                }
//                NavigationLink(destination: QueueView(), tag: 2, selection: $selection) {
//                    Label("Queue", systemImage: "clock")
//                }
//                NavigationLink(destination: ResourceView(), tag: 3, selection: $selection) {
//                    Label("Resource", systemImage: "book")
//                }
//                NavigationLink(destination: AnnouncementView(), tag: 4, selection: $selection) {
//                    Label("Announcement", systemImage: "megaphone")
//                }
//            }
//            .listStyle(SidebarListStyle())
//            .navigationTitle("Sidebar")
//            
//            DashboardView() // Default view when no selection
//        }
//    }
//}
//
//struct DashboardView: View {
//    var body: some View {
//        Text("Dashboard")
//            .font(.largeTitle)
//    }
//}
//
//struct QueueView: View {
//    var body: some View {
//        Text("Queue")
//            .font(.largeTitle)
//    }
//}
//
//struct AnnouncementView: View {
//    var body: some View {
//        Text("Announcement")
//            .font(.largeTitle)
//    }
//}
//
//struct ResourceView: View {
//    @State private var searchText = ""
//    @ObservedObject var viewModel = BookViewModel()
//    
//    var body: some View {
//        VStack {
//            TextField("Search for books", text: $searchText, onCommit: {
//                viewModel.fetchBooks(query: searchText)
//            })
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            .padding()
//            
//            List(viewModel.books, id: \.id) { book in
//                NavigationLink(destination: BookDetailView(book: book)) {
//                    HStack {
//                        if let url = URL(string: book.volumeInfo.imageLinks.smallThumbnail) {
//                            AsyncImage(url: url) { phase in
//                                if let image = phase.image {
//                                    image
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(width: 50, height: 75)
//                                } else if phase.error != nil {
//                                    Color.red // Indicates an error
//                                        .frame(width: 50, height: 75)
//                                } else {
//                                    Color.gray // Placeholder color
//                                        .frame(width: 50, height: 75)
//                                }
//                            }
//                        }
//                        
//                        VStack(alignment: .leading) {
//                            Text(book.volumeInfo.title)
//                                .font(.headline)
//                            Text(book.volumeInfo.subtitle ?? "")
//                                .font(.subheadline)
//                            Text(book.volumeInfo.authors.joined(separator: ", "))
//                                .font(.caption)
//                        }
//                    }
//                }
//            }
//        }
//        .navigationTitle("Resource")
//    }
//}
//
//struct BookDetailView: View {
//    var book: Item
//    @State private var totalCount: String = ""
//    @State private var showAlert = false
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 10) {
//                if let url = URL(string: book.volumeInfo.imageLinks.thumbnail) {
//                    AsyncImage(url: url) { phase in
//                        if let image = phase.image {
//                            image
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 150, height: 200)
//                        } else if phase.error != nil {
//                            Color.red // Indicates an error
//                                .frame(width: 150, height: 200)
//                        } else {
//                            Color.gray // Placeholder color
//                                .frame(width: 150, height: 200)
//                        }
//                    }
//                }
//
//                Text(book.volumeInfo.title)
//                    .font(.largeTitle)
//                    .bold()
//
//                Text(book.volumeInfo.subtitle ?? "")
//                    .font(.title2)
//                    .foregroundColor(.secondary)
//
//                Text("By \(book.volumeInfo.authors.joined(separator: ", "))")
//                    .font(.title3)
//                    .foregroundColor(.secondary)
//
//                Text("Published by \(book.volumeInfo.publisher ?? "Unknown") in \(book.volumeInfo.publishedDate)")
//                    .font(.body)
//
//                if let description = book.volumeInfo.description {
//                    Text(description)
//                        .font(.body)
//                }
//
//                HStack {
//                    Spacer()
//                    Text("Page Count: \(book.volumeInfo.pageCount ?? 0)")
//                    Spacer()
//                    // Text("Average Rating: \(String(format: "%.1f", book.volumeInfo.averageRating ?? 0.0)) (\(book.volumeInfo.ratingsCount ?? 0) ratings)")
//                    Spacer()
//                }
//
//                HStack {
//                    Link("Preview", destination: URL(string: book.volumeInfo.previewLink)!)
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                        .padding(.top)
//                    
//                    TextField("Enter Count", text: $totalCount).textFieldStyle(.roundedBorder).padding(.leading, 30)
//                    
//                    Button(action: {
//                        showAlert = true
//                    }, label: {
//                        Text("Save")
//                    })
//                    .alert(isPresented: $showAlert) {
//                        Alert(title: Text("Success"), message: Text("The Book has been successfully added to the Library"), dismissButton: .default(Text("OK")))
//                    }
//                }
//            }
//            .padding()
//        }
//        .navigationTitle("Book Details")
//    }
//}
//
//// Google Books API structures
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

//import SwiftUI
//
//struct ContentView: View {
//    @State private var selection: Int? = 1
//
//    var body: some View {
//        NavigationView {
//            List {
//                NavigationLink(destination: DashboardView(), tag: 1, selection: $selection) {
//                    Label("Dashboard", systemImage: "house")
//                }
//                NavigationLink(destination: QueueView(), tag: 2, selection: $selection) {
//                    Label("Queue", systemImage: "clock")
//                }
//                NavigationLink(destination: ResourceView(selection: $selection), tag: 3, selection: $selection) {
//                    Label("Resource", systemImage: "book")
//                }
//                NavigationLink(destination: BooksView(), tag: 4, selection: $selection) {
//                    Label("Books", systemImage: "book")
//                }
//                NavigationLink(destination: AnnouncementView(), tag: 5, selection: $selection) {
//                    Label("Announcement", systemImage: "megaphone")
//                }
//            }
//            .listStyle(SidebarListStyle())
//            .navigationTitle("Sidebar")
//
//            DashboardView() // Default view when no selection
//        }
//    }
//}
//
//struct DashboardView: View {
//    var body: some View {
//        Text("Dashboard")
//            .font(.largeTitle)
//    }
//}
//
//struct QueueView: View {
//    var body: some View {
//        Text("Queue")
//            .font(.largeTitle)
//    }
//}
//
//struct AnnouncementView: View {
//    var body: some View {
//        Text("Announ")
//            .font(.largeTitle)
//    }
//}
//
//struct BooksView: View {
//    var body: some View {
//        VStack(alignment: .leading, spacing: 30) {
//            HStack {
//                Text("Books")
//                    .font(.custom("Avenir Next", size: 42))
//                    .fontWeight(.bold)
//                    .foregroundColor(Color(hex: "5D4037"))
//                    .padding(.top, 20)
//                Spacer()
//            }
//            .padding(.horizontal, 30)
//            
//            HStack {
//                Text("Book Id")
//                    .font(.custom("Avenir Next", size: 18))
//                    .frame(width: 50, alignment: .leading)
//                Spacer()
//                    .frame(width: 70)
//                Text("Book Name")
//                    .font(.custom("Avenir Next", size: 18))
//                    .frame(width: 150, alignment: .leading)
//                Text("No. Of Copies")
//                    .font(.custom("Avenir Next", size: 18))
//                    .frame(width: 200, alignment: .leading)
//                
//            }
//            .padding(.horizontal, 30)
//            .padding(.vertical, 10)
//            
//            ScrollView {
//                VStack(spacing: 20) {
//                    ForEach(sampleData, id: \.id) { request in
//                        HStack {
//                            Text(request.id)
//                                .frame(width: 50, alignment: .leading)
//                            Text(request.studentName)
//                                .frame(width: 150, alignment: .leading)
//                            Text(request.issuedBook)
//                                .frame(width: 200, alignment: .leading)
//                        }
//                        .padding()
//                        .background(Color.white)
//                        .cornerRadius(10)
//                        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
//                    }
//                }
//                .padding(.horizontal, 30)
//            }
//        }
//        .padding(.top, 20)
//        .background(Color(hex: "FDF5E6"))
//        .edgesIgnoringSafeArea(.all)
//    }
//    
//}
//struct Request: Identifiable {
//    let id: String
//    let studentName: String
//    let issuedBook: String
//}
//
//let sampleData = [
//    Request(id: "A10", studentName: "Anuj Singh", issuedBook: "The Metropolis"),
//    Request(id: "A97", studentName: "Nikunj Tyagi", issuedBook: "Harry Potter"),
//    Request(id: "A977", studentName: "Vineet", issuedBook: "Harry Potter"),
//    Request(id: "A7", studentName: "Akshat", issuedBook: "Harry Potter"),
//    Request(id: "A09", studentName: "Sameer Bhati", issuedBook: "Alchemist"),
//    
//]
//
//extension Color {
//    init(hex: String) {
//        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
//        var int: UInt64 = 0
//        Scanner(string: hex).scanHexInt64(&int)
//        let a, r, g, b: UInt64
//        switch hex.count {
//        case 3:
//            (a, r, g, b) = (255, (int >> 8 * 4), (int >> 4 * 4), (int >> 0 * 4))
//            self.init(red: Double(r) / 15, green: Double(g) / 15, blue: Double(b) / 15)
//        case 6:
//            (a, r, g, b) = (255, (int >> 16), (int >> 8 & 0xFF), (int >> 0 & 0xFF))
//            self.init(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
//        case 8:
//            (a, r, g, b) = ((int >> 24), (int >> 16 & 0xFF), (int >> 8 & 0xFF), (int >> 0 & 0xFF))
//            self.init(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: Double(a) / 255)
//        default:
//            self.init(.clear)
//        }
//    }
//}
//
//
//struct ResourceView: View {
//    @State private var searchText = ""
//    @ObservedObject var viewModel = BookViewModel()
//    @Binding var selection: Int?
//
//    var body: some View {
//        VStack {
//            TextField("Search for books", text: $searchText, onCommit: {
//                viewModel.fetchBooks(query: searchText)
//            })
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            .padding()
//
//            List(viewModel.books, id: \.id) { book in
//                NavigationLink(destination: BookDetailView(book: book, selection: $selection)) {
//                    HStack {
//                        if let url = URL(string: book.volumeInfo.imageLinks.smallThumbnail) {
//                            AsyncImage(url: url) { phase in
//                                if let image = phase.image {
//                                    image
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(width: 50, height: 75)
//                                } else if phase.error != nil {
//                                    Color.red // Indicates an error
//                                        .frame(width: 50, height: 75)
//                                } else {
//                                    Color.gray // Placeholder color
//                                        .frame(width: 50, height: 75)
//                                }
//                            }
//                        }
//
//                        VStack(alignment: .leading) {
//                            Text(book.volumeInfo.title)
//                                .font(.headline)
//                            Text(book.volumeInfo.subtitle ?? "")
//                                .font(.subheadline)
//                            Text(book.volumeInfo.authors.joined(separator: ", "))
//                                .font(.caption)
//                        }
//                    }
//                }
//            }
//        }
//        .navigationTitle("Resource")
//    }
//}
//
//struct BookDetailView: View {
//    var book: Item
//    @State private var totalCount: String = ""
//    @State private var showAlert = false
//    @Binding var selection: Int?
//    @Environment(\.presentationMode) var presentationMode
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 10) {
//                if let url = URL(string: book.volumeInfo.imageLinks.thumbnail) {
//                    AsyncImage(url: url) { phase in
//                        if let image = phase.image {
//                            image
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 150, height: 200)
//                        } else if phase.error != nil {
//                            Color.red // Indicates an error
//                                .frame(width: 150, height: 200)
//                        } else {
//                            Color.gray // Placeholder color
//                                .frame(width: 150, height: 200)
//                        }
//                    }
//                }
//
//                Text(book.volumeInfo.title)
//                    .font(.largeTitle)
//                    .bold()
//
//                Text(book.volumeInfo.subtitle ?? "")
//                    .font(.title2)
//                    .foregroundColor(.secondary)
//
//                Text("By \(book.volumeInfo.authors.joined(separator: ", "))")
//                    .font(.title3)
//                    .foregroundColor(.secondary)
//
//                Text("Published by \(book.volumeInfo.publisher ?? "Unknown") in \(book.volumeInfo.publishedDate)")
//                    .font(.body)
//
//                if let description = book.volumeInfo.description {
//                    Text(description)
//                        .font(.body)
//                }
//
//                HStack {
//                    Spacer()
//                    Text("Page Count: \(book.volumeInfo.pageCount ?? 0)")
//                    Spacer()
//                    // Text("Average Rating: \(String(format: "%.1f", book.volumeInfo.averageRating ?? 0.0)) (\(book.volumeInfo.ratingsCount ?? 0) ratings)")
//                    Spacer()
//                }
//
//                HStack {
//                    Link("Preview", destination: URL(string: book.volumeInfo.previewLink)!)
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                        .padding(.top)
//
//                    TextField("Enter Count", text: $totalCount).textFieldStyle(.roundedBorder).padding(.leading, 30)
//
//                    Button(action: {
//                        showAlert = true
//                    }, label: {
//                        Text("Save")
//                    })
//                    .alert(isPresented: $showAlert) {
//                        Alert(
//                            title: Text("Success"),
//                            message: Text("The Book has been successfully added to the Library"),
//                            dismissButton: .default(Text("OK")) {
////                                self.selection = 3
//                                self.presentationMode.wrappedValue.dismiss()
//                            }
//                        )
//                    }
//                }
//            }
//            .padding()
//        }
//        .navigationTitle("Book Details")
//    }
//}
//
//// Google Books API structures
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

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

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
            List {
                NavigationLink(destination: DashboardView(), tag: 1, selection: $selection) {
                    Label("Dashboard", systemImage: "house")
                }
                NavigationLink(destination: QueueView(), tag: 2, selection: $selection) {
                    Label("Queue", systemImage: "clock")
                }
                NavigationLink(destination: ResourceView(selection: $selection), tag: 3, selection: $selection) {
                    Label("Resource", systemImage: "book")
                }
                NavigationLink(destination: BooksView(), tag: 4, selection: $selection) {
                    Label("Books", systemImage: "book")
                }
                NavigationLink(destination: AnnouncementView(), tag: 5, selection: $selection) {
                    Label("Announcement", systemImage: "megaphone")
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Sidebar")

            DashboardView() // Default view when no selection
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

import FirebaseFirestore
import FirebaseFirestoreSwift

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

struct Request: Identifiable {
    let id: String
    let studentName: String
    let issuedBook: String
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
            TextField("Search for books", text: $searchText, onCommit: {
                viewModel.fetchBooks(query: searchText)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()

            List(viewModel.books, id: \.id) { book in
                NavigationLink(destination: BookDetailView(book: book, selection: $selection)) {
                    HStack {
                        if let url = URL(string: book.volumeInfo.imageLinks.smallThumbnail) {
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
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

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


// Google Books API structures
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
    // var bookCount: Int = 0
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

