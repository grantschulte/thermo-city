module Daily.Models exposing (..)


type alias DailyWeather =
    { summary : String
    , icon : String
    , precipProbability : Float
    , temperatureHigh : Float
    , temperatureLow : Float
    , humidity : Float
    }
