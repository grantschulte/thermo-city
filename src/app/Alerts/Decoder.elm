module Alerts.Decoder exposing (..)

import Alerts.Models exposing (..)
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)


alert : Decode.Decoder Alert
alert =
    decode Alert
        |> required "description" Decode.string
        |> required "regions" Decode.list
        |> required "severity" Decode.string
        |> required "time" Decode.float
        |> required "title" Decode.string


alertsDecoder : Decode.Decoder (List Alert)
alertsDecoder =
    Decode.list alert
