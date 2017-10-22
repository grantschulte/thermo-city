module Utils exposing (..)

import Date exposing (..)
import Date.Extra exposing (..)
import Geolocation exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
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


getHour : Time -> String
getHour timeInt =
    fromTimestamp (timeInt * 1000)
        |> toISO8601
        |> fromIsoString
        |> getDateFromMaybe


getDateFromMaybe : Maybe Date -> String
getDateFromMaybe h =
    case h of
        Just val ->
            Date.Extra.toFormattedString "E, h:mm a" val

        Nothing ->
            ""


tempScaleSymbol : Html Msg
tempScaleSymbol =
    span
        [ class "degrees"
        ]
        [ text "°" ]


toCelsius : Float -> Float
toCelsius temp =
    (temp - 32) / 1.8


makeTemp : Float -> Scale -> String
makeTemp temp tempScale =
    case tempScale of
        C ->
            temp
                |> toCelsius
                |> Basics.ceiling
                |> toString

        F ->
            temp
                |> Basics.ceiling
                |> toString
