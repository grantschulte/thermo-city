module Current.Decoder exposing (..)

import Current.Models exposing (..)
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Models exposing (..)


currentWeather : Decode.Decoder CurrentWeather
currentWeather =
    decode CurrentWeather
        |> required "humidity" Decode.float
        |> required "icon" Decode.string
        |> required "precipProbability" Decode.float
        |> required "summary" Decode.string
        |> required "temperature" Decode.float
        |> required "time" Decode.float
