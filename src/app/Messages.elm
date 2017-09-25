module Messages exposing (..)

import Daily.Models exposing (..)
import Models exposing (..)
import RemoteData exposing (..)


-- MESSAGES


type Msg
    = SetPage Page
    | DailyWeatherResponse (WebData (List DailyWeather))
