//
//  Movie.swift
//  MVVM-Project
//
//  Created by Ahmet Göktürk Kurt on 29.05.2023.
//

import Foundation

struct Movie : Decodable { // json formatında veri geleceği için structa eşitlememiz gerekiyor bu yüzden bu protokolü kullanıyoruz.
    let results : [MovieResults]?
    
//    enum CodingKeys :String,CodingKey {
//        case page
//        case totalPages = "total_pages" // totalpages olarak yazıldı ama veriyi çekerken total_pages olarak görsün diye
//        case totalResults = "total_results"
//        case results
//    }
    
}

struct MovieResults : Decodable {
    let id : Int?
    let posterPath : String?
    
    enum CodingKeys : String , CodingKey {
        case id
        case posterPath = "poster_path"
    }
    var _posterPath : String { // boş geç
        posterPath ?? ""
    }
    var _id :Int {
        id ?? Int.min
    }
 }
// Encodable dataya çeviriceksek , decodable ediceksek gelen datayı kullanıyoruz.Codable = decodable and encodable
