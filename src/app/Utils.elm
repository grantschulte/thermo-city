module Utils exposing (..)

import Geolocation exposing (..)


locationQuery : Location -> String
locationQuery location =
    "lat=" ++ toString location.latitude ++ "long=" ++ toString location.longitude
