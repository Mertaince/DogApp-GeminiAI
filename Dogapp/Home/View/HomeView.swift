//
//  HomeView.swift
//  Dogapp
//
//  Created by Mert ATK on 28.10.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var colorIndex = 0
    let colors: [Color] = [.green.opacity(1), .green.opacity(0.3)]
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Group{
                    VStack{
                        HStack{
                            Image(systemName: "leaf.fill")
                                .resizable()
                                .frame(width: 90, height: 80)
                                .foregroundColor(Color(.systemGreen))
                            Spacer()
                        }.padding(.vertical,1)
                        Group{
                            HStack{
                                Text("Yapay Zeka")
                                Spacer()
                            }
                            HStack{
                                Text("DogApp")
                                    .foregroundColor(colors[colorIndex])
                                    .onAppear(perform: startAnimation)
                                    .animation(.easeInOut(duration: 0.5),value: colorIndex)
                                Spacer()
                            }
                            HStack{
                                Text("Hoşgeldiniz")
                                Spacer()
                            }
                        }.font(.system(size: 50, weight: .heavy, design: .default))
                    }
                }
                .padding(.horizontal,22)
                
                HStack{
                    Text("Uygulamayı ücretsiz kullanmak icin üye ol tuşuna basıp üyelik oluşturunuz.")
                        .padding(.horizontal,22)
                    
                        .foregroundColor(Color(.systemGray2))
                    
                    Spacer()
                }.padding(.vertical,1)
                
                
                Spacer()
                NavigationLink{
                    
                }label:{
                    Text("Üye ol")
                        .padding(12)
                        .frame(width: 350, height: 60)
                        .background(Color(.systemGreen))
                        .cornerRadius(30)
                        .foregroundColor(.white)
                }
               
                
                NavigationLink{
                    LoginView()
                }label:{
                    Text("Giriş yap")
                        .padding(10)
                        .frame(width: 350, height: 60)
                        .background(.white)
                        .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.green, lineWidth:1))
                        .foregroundColor(.green)
                }
            }
        }
        
    }
    func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            withAnimation {
                colorIndex = (colorIndex + 1 ) % colors.count
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
