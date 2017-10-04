module Hourly.Models exposing (..)

import Time exposing (Time)


type alias HourlyWeather =
    { humidity : Float
    , icon : String
    , precipProbability : Float
    , summary : String
    , temperature : Float
    , time : Time
    }
