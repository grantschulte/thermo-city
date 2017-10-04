module Hourly.Decoder exposing (..)

import Hourly.Models exposing (..)
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Models exposing (..)


hourlyDecoder : Nothing
hourlyDecoder =
    decode HourlyWeather
        |> required "humidity" Decode.float
        |> required "icon" Decode.string
        |> required "precipProbability" Decode.float
        |> required "summary" Decode.string
        |> required "temperature" Decode.float
        |> required "time" Decode.float
