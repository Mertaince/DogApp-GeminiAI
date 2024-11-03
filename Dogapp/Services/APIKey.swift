//
//  APIKey.swift
//  Dogapp
//
//  Created by Mert ATK on 27.10.2024.
//

import Foundation

enum APIKey {
    static var value: String{
        guard let value = Bundle.main.object(forInfoDictionaryKey: "API_Key") as? String else {
            fatalError("Apı Key Bulunamadı")
        }
        return value
    }
}
