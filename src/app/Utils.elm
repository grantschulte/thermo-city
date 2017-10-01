module Utils exposing (..)

import Date exposing (..)
import Geolocation exposing (..)
import Time exposing (..)
import Time.DateTime exposing (..)


locationQuery : Location -> String
locationQuery location =
    "coords=" ++ toString location.latitude ++ "," ++ toString location.longitude


getDay : Time -> String
getDay timeInt =
    fromTimestamp (timeInt * 1000)
        |> weekday
        |> toString
