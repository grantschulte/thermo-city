module Daily.Models exposing (..)


type alias DailyWeather =
    { highTemperature : Float
    , humidity : Float
    , icon : String
    , lowTemperature : Float
    , precipProbability : Float
    , precipType : String
    }
