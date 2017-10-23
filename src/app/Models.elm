module Models exposing (..)

import Current.Models exposing (..)
import Daily.Models exposing (..)
import GeoData.Models exposing (..)
import Geolocation exposing (Location)
import Hourly.Models exposing (..)
import Http exposing (..)
import RemoteData exposing (..)


-- TYPES


type Scale
    = C
    | F


type alias Menus =
    { tempScale : Bool
    , view : Bool
    }



-- type alias Menus =
--     { tempScale : TempScaleMenu
--     , view : ViewMenu
--     }
-- type alias TempScaleMenu =
--     { active : Bool
--     , selected : Scale
--     , options : List Scale
--     }
--
--
-- type alias ViewMenu =
--     { active : Bool
--     , selected : Page
--     , options : List Page
--     }


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
    , hourly : WebData (List HourlyWeather)
    , location : Result Geolocation.Error (Maybe Location)
    , menus : Menus
    , page : Page
    , tempScale : Scale
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
    , menus = Menus False False
    , page = GeoDataPage
    , tempScale = F
    }
