module Daily.Decoder exposing (..)

import Daily.Models exposing (..)
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Models exposing (..)


dailyWeather : Decode.Decoder DailyWeather
dailyWeather =
    decode DailyWeather
        |> required "summary" Decode.string
        |> required "icon" Decode.string
        |> required "precipProbability" Decode.float
        |> required "temperatureHigh" Decode.float
        |> required "temperatureLow" Decode.float
        |> required "humidity" Decode.float


dailyWeatherResponse : Decode.Decoder (List DailyWeather)
dailyWeatherResponse =
    Decode.at [ "data" ] (Decode.list dailyWeather)
