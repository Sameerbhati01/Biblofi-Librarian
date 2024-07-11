//
//  newApiFetchApp.swift
//  newApiFetch
//
//  Created by indianrenters on 06/07/24.
//

//import SwiftUI
//import Firebase
//
//@main
//struct newApiFetchApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}

import SwiftUI
import FirebaseCore
import FirebaseStorage
import FirebaseFirestore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


class LoginViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
}

@main
struct YourApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

  @StateObject private var loginModel = LoginViewModel()

  var body: some Scene {
    WindowGroup {
            Group {
                if loginModel.isLoggedIn {
                    ContentView()
                } else {
                    LoginView()
                        .environmentObject(loginModel)
                }
            }.onAppear {
                checkSignInStatus()
            }
      
    }
  }
    private func checkSignInStatus() {
        loginModel.isLoggedIn = UserDefaults.standard.bool(forKey: "isUserSignedIn")
    }
}



func submitCourseRequest(image : UIImage){
    guard let imageData = image.jpegData(compressionQuality: 0.75) else {
        return
    }
    let storageRef = Storage.storage().reference().child("BookImage")
    
    storageRef.putData(imageData) { metadata, error in
        if let error = error {
            print("Failed to upload image: \(error.localizedDescription)")
            return
        }
        
        storageRef.downloadURL { url, error in
            guard let imageURL = url?.absoluteString else {
                return
            }
            let data : [String : Any] = ["book1" : imageURL]
            let db = Firestore.firestore()
            db.collection("books").addDocument(data: data ) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Course added successfully")
                }
            }
        }
    }
}





