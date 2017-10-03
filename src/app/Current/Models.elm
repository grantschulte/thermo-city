module Current.Models exposing (..)

import Time exposing (Time)


type alias CurrentWeather =
    { humidity : Float
    , icon : String
    , precipProbability : Float
    , summary : String
    , temperature : Float
    , time : Float
    }
