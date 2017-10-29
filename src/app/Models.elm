module Models exposing (..)

import Alerts.Models exposing (..)
import Current.Models exposing (..)
import Daily.Models exposing (..)
import GeoData.Models exposing (..)
import Geolocation exposing (Location)
import Hourly.Models exposing (..)
import Http exposing (..)
import Menu.Models exposing (..)
import Page.Models exposing (..)
import RemoteData exposing (..)
import Scale.Models exposing (..)


-- TYPES


type alias Config =
    { apiUrl : String
    , nodeEnv : String
    }


type alias Model =
    { alerts : WebData (List Alert)
    , config : Config
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
    { alerts = RemoteData.Loading
    , config = config
    , current = RemoteData.Loading
    , daily = RemoteData.Loading
    , geoData = RemoteData.Loading
    , hourly = RemoteData.Loading
    , location = Ok Nothing
    , menus = Menus initTempScaleMenu initViewMenu
    , page = GeoDataPage
    , tempScale = F
    }
