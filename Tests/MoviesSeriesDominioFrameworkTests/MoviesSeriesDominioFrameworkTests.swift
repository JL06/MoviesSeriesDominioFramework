import XCTest
@testable import MoviesSeriesDominioFramework

final class MoviesSeriesDominioFrameworkTests: XCTestCase {
    
    func testObtenerTop () {
        let obj = MoviesSeriesDominioFramework(apiKey: "05e3d00ae13d42a1dda51e75a27fcc49")
        
        let url = obj.obtenerURLTop(tipo: .Pelicula)
        XCTAssertEqual(url,"https://api.themoviedb.org/3/movie/top_rated?api_key=05e3d00ae13d42a1dda51e75a27fcc49&language=en-US&page=1")
        
        let urlTv = obj.obtenerURLTop(tipo: .SerieTv)
        XCTAssertEqual(urlTv,"https://api.themoviedb.org/3/tv/top_rated?api_key=05e3d00ae13d42a1dda51e75a27fcc49&language=en-US&page=1")
    }
    
    func testObtenerRecomm () {
        let obj = MoviesSeriesDominioFramework(apiKey: "05e3d00ae13d42a1dda51e75a27fcc49")
        
        let url = obj.obtenerURLRecommendations(tipo: .Pelicula, pelicula: "550")
        XCTAssertEqual(url,"https://api.themoviedb.org/3/movie/550/recommendations?api_key=05e3d00ae13d42a1dda51e75a27fcc49&language=en-US&page=1")
        
        let urlTv = obj.obtenerURLRecommendations(tipo: .SerieTv, pelicula: "550")
        XCTAssertEqual(urlTv,"https://api.themoviedb.org/3/tv/550/recommendations?api_key=05e3d00ae13d42a1dda51e75a27fcc49&language=en-US&page=1")
    }
    
    func testObtenerFavorites () {
        let obj = MoviesSeriesDominioFramework(apiKey: "05e3d00ae13d42a1dda51e75a27fcc49")
        obj.registrar(token: "d1b03087fccdb3d6b807ef02df650e94510ed217", session: "83625650250c588344e1ae277a5eafb653010b94", usuario: "11824124")
        
        let urlMv = obj.obtenerURLFavorites(tipo: .Peliculas)
        XCTAssertEqual(urlMv,"https://api.themoviedb.org/3/account/11824124/favorite/movies?api_key=05e3d00ae13d42a1dda51e75a27fcc49&session_id=83625650250c588344e1ae277a5eafb653010b94&language=en-US&sort_by=created_at.asc&page=1")
        
        let urlTv = obj.obtenerURLFavorites(tipo: .SerieTv)
        XCTAssertEqual(urlTv,"https://api.themoviedb.org/3/account/11824124/favorite/tv?api_key=05e3d00ae13d42a1dda51e75a27fcc49&session_id=83625650250c588344e1ae277a5eafb653010b94&language=en-US&sort_by=created_at.asc&page=1")
        
    }
    
    func testMovie () {
        let peli = Movie(id: 1, titulo: "Club de la Pelea", sinopsis: "Descripcion", lanz: "2000")
        XCTAssertNotNil(peli)
        XCTAssertEqual(peli.titulo, "Club de la Pelea")
    }
    
    func testTvSerie () {
        let serie = TvSerie(id: 1, titulo: "Dexter", sinopsis: "Asesino Serial", lanz: "2002", votos: 7.5)
        XCTAssertNotNil(serie)
        XCTAssertEqual(serie.titulo, "Dexter")
        
    }
    
    func testImage () {
        let obj = MoviesSeriesDominioFramework(apiKey: "05e3d00ae13d42a1dda51e75a27fcc49")
        let urlImg = obj.obtenerURLImage(image: "/cVn8E3Fxbi8HzYYtaSfsblYC4gl.jpg")
        
        XCTAssertEqual(urlImg, "https://image.tmdb.org/t/p/original/cVn8E3Fxbi8HzYYtaSfsblYC4gl.jpg")
    }
}
