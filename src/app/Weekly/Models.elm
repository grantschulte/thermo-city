module Weekly.Models exposing (..)


type alias WeeklyOutlook =
    { highTemperature : Float
    , humidity : Float
    , icon : String
    , lowTemperature : Float
    , precipProbability : String
    , precipType : String
    }
