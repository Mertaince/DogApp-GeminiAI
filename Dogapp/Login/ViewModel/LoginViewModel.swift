//
//  LoginViewModel.swift
//  Dogapp
//
//  Created by Mert ATK on 3.11.2024.
//

import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var userIsLoggedIn = false
    @Published var showPassword = false
    @Published var statusMessage = ""
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
                self.statusMessage = "Eposta veya şifre hatalı tekrar deneyiniz."
            }
            else{
                print("Giriş başarılı")
            }
        }
    }
    
    
}
