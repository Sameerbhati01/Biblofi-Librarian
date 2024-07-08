//
//  HomeView.swift
//  newApiFetch
//
//  Created by sourav_singh on 07/07/24.
//

import SwiftUI
import FirebaseFirestore

struct HomeView: View {
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            Text("Books")
                .tabItem {
                    Image(systemName: "book.fill")
                }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }
        .onAppear(){
            print("madhav")
            submitCourseRequest(image: UIImage(named: "2")!)
        }
    }
        
        
}

struct HomePage: View {
    
    @State private var image1 : UIImage? = UIImage(named: "1")!
    @State private var books : [String] = []
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Top Section
                HStack {
                    
                    
                    Image("profile_image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                .padding(.horizontal)
                
                // Search Section
                HStack {
                    
                }
                .padding(.horizontal)
                
                // Author Section
                Text("Author")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<5) { index in
                            VStack {
                                Image("author_placeholder")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                // My Books Section
                Text("My Books")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<6) { index in
                            VStack(alignment: .leading) {
                                Image(uiImage: image1!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 140)
                                    .cornerRadius(10)
                                Text("Book Title")
                                    .font(.headline)
                                Text("By Author")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .onAppear(){
                    fetchCourses()
                }
                // Trending Section
                Text("Trending")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<7) { index in
                            Image(uiImage: image1!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 180)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                }
            }}
            .onAppear(){
                submitCourseRequest(image: UIImage(named: "1")!)
//                fetchCourses()
            }
        }
    
        func loadImage(from url: URL) {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else {
                        print("Failed to load image from \(url): \(error?.localizedDescription ?? "Unknown error")")
                        return
                    }
                    DispatchQueue.main.async {
                        self.image1 = UIImage(data: data)!
                    }
                }.resume()
            }
        
        func fetchCourses() {
                let db = Firestore.firestore()
                db.collection("Books").getDocuments { snapshot, error in
                    if let error = error {
                        print("Error fetching documents: \(error)")
                    } else {
                        books = snapshot?.documents.compactMap { doc in
                            let data = doc.data()
                            return data["book1"]
                        } as! [String]
                        print(books.count)
//                        loadImage(from: URL(string: books[0])!)
                    }
                }
            }
}

