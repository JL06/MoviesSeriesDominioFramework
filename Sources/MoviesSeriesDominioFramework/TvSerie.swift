//
//  TvSerie.swift
//  MoviedbFramework
//
//  Created by temp on 26/01/22.
//

import Foundation

public struct TvSeries: Decodable {
    public let series: [TvSerie]
    public let paginas, totalPaginas, totalResultados: Int
    
    enum CodingKeys: String, CodingKey {
        case paginas = "page"
        case series = "results"
        case totalPaginas = "total_pages"
        case totalResultados = "total_results"
    }
}

public struct TvSerie: Decodable {
    public let titulo, sinopsis, lanzamiento: String
    public let id: Int
    public let votacion: Double
    public var imagen:String?
    
    public init(id: Int, titulo: String, sinopsis: String, lanz: String, votos: Double) {
        self.id = id
        self.titulo = titulo
        self.sinopsis = sinopsis
        self.lanzamiento = lanz
        self.votacion = votos
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case votacion = "vote_average"
        case titulo = "name"
        case sinopsis = "overview"
        case lanzamiento = "first_air_date"
        case imagen = "poster_path"
    }
    
}
