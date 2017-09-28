module Models exposing (..)

import Current.Models exposing (..)
import Daily.Models exposing (..)
import GeoLocation.Models exposing (..)
import RemoteData exposing (..)


-- TYPES


type Page
    = CurrentPage
    | DailyPage
    | LoadingPage


type alias Config =
    { apiUrl : String
    , nodeEnv : String
    }


type alias Model =
    { config : Config
    , coordinates : Coordinates
    , current : WebData CurrentWeather
    , daily : WebData (List DailyWeather)
    , geoData : GeoData
    , page : Page
    }



-- INITIAL MODEL


initialModel : Config -> Model
initialModel config =
    { config = config
    , coordinates = Coordinates 40.7192833 -73.94524799999999
    , current = RemoteData.Loading
    , daily = RemoteData.Loading
    , geoData = GeoData "442-448 Meeker Ave, Brooklyn, NY 11222"
    , page = LoadingPage
    }
