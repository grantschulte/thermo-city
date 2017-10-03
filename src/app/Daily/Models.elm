module Daily.Models exposing (..)

import Time exposing (..)


type alias DailyWeather =
    { time : Time
    , summary : String
    , icon : String
    , precipProbability : Float
    , temperatureHigh : Float
    , temperatureLow : Float
    , humidity : Float
    }
