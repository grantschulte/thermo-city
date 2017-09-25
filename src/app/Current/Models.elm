module Current.Models exposing (..)


type alias CurrentWeather =
    { humidity : Float
    , icon : String
    , summary : String
    , precipProbability : Float
    , temperature : Float
    }
