module Daily.Models exposing (..)

import Time exposing (Time)


type alias DailyWeather =
    { time : Time
    , summary : String
    , icon : String
    , precipProbability : Float
    , temperatureHigh : Float
    , temperatureLow : Float
    , humidity : Float
    }
