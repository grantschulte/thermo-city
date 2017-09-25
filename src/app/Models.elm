module Models exposing (..)

import Current.Models exposing (..)
import Daily.Models exposing (..)
import RemoteData exposing (..)


-- TYPES


type alias Coordinates =
    { latitude : Float
    , longitude : Float
    }


type Page
    = CurrentPage
    | DailyPage


type alias Config =
    { apiUrl : String
    , coordinates : Coordinates
    , nodeEnv : String
    }


type alias Model =
    { config : Config
    , current : WebData CurrentWeather
    , daily : WebData (List DailyWeather)
    , page : Page
    }



-- INITIAL MODEL


initialModel : Config -> Model
initialModel config =
    { config = config
    , current = RemoteData.Loading
    , daily = RemoteData.Loading
    , page = DailyPage
    }
