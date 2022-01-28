public class MoviesSeriesDominioFramework {
    private var llaveApi = "05e3d00ae13d42a1dda51e75a27fcc49"
    
    private var requestToken: String?
    private var sessionId: String?
    private var usuarioId: String?
    
    private let urlBase = "https://api.themoviedb.org/3/"
    
    private let urlMovie = "movie"
    private let urlSeries = "tv"
    private let urlMovies = "movies"
    
    private let urlTop = "top_rated?"
    private let urlRecommendations = "/recommendations?"
    private let urlApiKey = "api_key="
    private let urlAccount = "account/"
    private let urlFavorite = "/favorite/"

    private let urlEndSort = "&sort_by=created_at.asc"
    private let urlEndLang = "&language=en-US"
    private let urlEndPage = "&page=1"
    private let urlEndSession = "&session_id="

    public init(apiKey: String) {
        self.llaveApi = apiKey
        self.requestToken = nil
        self.sessionId = nil
        self.usuarioId = nil
    }
    
    public convenience init(token: String, session: String, usuario: String, apiKey: String) {
        self.init(apiKey: apiKey)
        self.requestToken = token
        self.sessionId = session
        self.usuarioId = usuario
    }
    
    public func registrar(token: String, session: String, usuario: String) {
        self.requestToken = token
        self.sessionId = session
        self.usuarioId = usuario
    }
    
    public func obtenerURLTop(tipo: Contenido) -> String {
        return self.urlBase + self.tipoAURL(tipo: tipo) + "/" + self.urlTop + self.urlApiKey + self.llaveApi + self.urlEndLang + self.urlEndPage
    }
    
    public func obtenerURLRecommendations(tipo: Contenido, pelicula: String) -> String {
        return self.urlBase + self.tipoAURL(tipo: tipo) + "/" + pelicula + self.urlRecommendations + self.urlApiKey + self.llaveApi + self.urlEndLang + self.urlEndPage
    }
    
    public func obtenerURLFavorites (tipo: Contenido) -> String {
        if self.requestToken == nil || self.sessionId == nil || self.usuarioId == nil {
            return ""
        }
        return self.urlBase + self.urlAccount + self.usuarioId! + self.urlFavorite + self.tipoAURL(tipo: tipo) + "?" + self.urlApiKey + self.llaveApi + self.urlEndSession + self.sessionId! + self.urlEndLang + self.urlEndSort + self.urlEndPage
    }
    
    private func tipoAURL(tipo: Contenido) -> String {
        let urlTipo: String
        switch tipo {
        case .Pelicula:
            urlTipo = self.urlMovie
            
        case .SerieTv:
            urlTipo = self.urlSeries
            
        case .Peliculas:
            urlTipo = self.urlMovies
        }
        
        return urlTipo
    }
}

public enum Contenido {
    case Pelicula, SerieTv, Peliculas
}
