module Models exposing (..)

import Current.Models exposing (..)
import Daily.Models exposing (..)
import GeoData.Models exposing (..)
import Geolocation exposing (Location)
import Hourly.Models exposing (..)
import Http exposing (..)
import RemoteData exposing (..)


-- TYPES


type Page
    = CurrentPage
    | DailyPage
    | HourlyPage
    | ErrorPage
    | GeoDataPage


type alias Config =
    { apiUrl : String
    , nodeEnv : String
    }


type alias Model =
    { config : Config
    , current : WebData CurrentWeather
    , daily : WebData (List DailyWeather)
    , geoData : WebData GeoData
    , hourly : WebData HourlyWeather
    , location : Result Geolocation.Error (Maybe Location)
    , page : Page
    }



-- INITIAL MODEL


initialModel : Config -> Model
initialModel config =
    { config = config
    , current = RemoteData.Loading
    , daily = RemoteData.Loading
    , geoData = RemoteData.Loading
    , hourly = RemoteData.Loading
    , location = Ok Nothing
    , page = GeoDataPage
    }
