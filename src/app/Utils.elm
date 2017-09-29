module Utils exposing (..)

import Geolocation exposing (..)


locationQuery : Location -> String
locationQuery location =
    "coords=" ++ toString location.latitude ++ "," ++ toString location.longitude
