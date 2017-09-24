module Models exposing (..)

import Daily.Models exposing (..)
import RemoteData exposing (..)
import Weekly.Models exposing (..)


-- TYPES


type Page
    = DailyPage
    | WeeklyPage


type alias Config =
    { apiUrl : String
    , nodeEnv : String
    }


type alias Model =
    { config : Config
    , daily : WebData DailyOutlook
    , page : Page
    , weekly : WebData WeeklyOutlook
    }



-- INITIAL MODEL


initialModel : Config -> Model
initialModel config =
    { config = config
    , daily = RemoteData.NotAsked
    , page = WeeklyPage
    , weekly = RemoteData.NotAsked
    }
