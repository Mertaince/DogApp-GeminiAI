//
//  LoginView.swift
//  Dogapp
//
//  Created by Mert ATK on 28.10.2024.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View{
        if viewModel.userIsLoggedIn {
            TabBarView()
        }else{
            content
        }
    }
    
    var content: some View {
        NavigationStack{
            ZStack{
                VStack {
                    Rectangle()
                        .frame(height: 990)
                        .foregroundColor(Color(.systemGreen))
                        .edgesIgnoringSafeArea(.vertical)
                        
                    
                    Spacer()
                }
                ZStack {
                   
                    
                    RoundedRectangle(cornerRadius: 13)
                        .foregroundColor(Color.white)
                        .frame(width: 370, height: 480)
                        .shadow(color: .gray, radius: 20, x: 10, y: 4)
                    VStack{
                        Image(systemName: "leaf.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color(.systemGreen))
                            
                            
                        
                        TextField("Email, Kullanıcı adı veya Telefon numarası", text: $viewModel.email)
                            .modifier(TextFieldModifier())
                            .padding(.vertical,20)
                        
                        ZStack{
                            if viewModel.showPassword{
                                TextField("Şifre", text: $viewModel.password)
                                    .modifier(TextFieldModifier())
                            }else{
                                SecureField("Şifre", text: $viewModel.password)
                                    .modifier(TextFieldModifier())
                            }
                            
                            Button{
                                viewModel.showPassword.toggle()
                            }label:{
                                Image(systemName: viewModel.showPassword ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.gray)
                            }.padding(.leading,300)
                        }
                        HStack{
                            Spacer()
                            Button{
                                
                            }label:{
                                Text("Şifreni mi unuttun?")
                                    .font(.footnote)
                            }.padding(.horizontal,28)
                        }
                        
                        Spacer()
                            .frame(height: 15)
                        
                        Button{
                            viewModel.login()
                        }label:{
                            Text("Giriş Yap")
                                .modifier(ButtonBorderGreen())
                        }
                    }
                }
            }.onAppear{
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        viewModel.userIsLoggedIn.toggle()
                    }else{
                        
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
