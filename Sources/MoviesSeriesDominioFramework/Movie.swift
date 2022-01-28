//
//  Movie.swift
//  MoviedbFramework
//
//  Created by temp on 26/01/22.
//

import Foundation

public struct Movies: Decodable {
    public let paginas: Int
    public let peliculas: [Movie]
    public let totalPaginas: Int
    public let totalResultados: Int
    
    enum CodingKeys: String, CodingKey {
        case paginas = "page"
        case peliculas = "results"
        case totalPaginas = "total_pages"
        case totalResultados = "total_results"
    }
    
}

public struct Movie: Decodable {
    public let titulo, sinopsis, lanzamiento: String
    public let id: Int
    public var imagen:String?
    
    public init(id: Int, titulo: String, sinopsis: String, lanz: String) {
        self.id = id
        self.titulo = titulo
        self.sinopsis = sinopsis
        self.lanzamiento = lanz
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case titulo = "title"
        case sinopsis = "overview"
        case lanzamiento = "release_date"
        case imagen = "poster_path"
    }
}
