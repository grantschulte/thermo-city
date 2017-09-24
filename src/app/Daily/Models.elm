module Daily.Models exposing (..)


type alias DailyOutlook =
    { humidity : Float
    , icon : String
    , summary : String
    , precipProbability : Float
    , temperature : Float
    }
