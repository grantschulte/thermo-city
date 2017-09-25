module Daily.Decoder exposing (..)

import Daily.Models exposing (..)
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Models exposing (..)


dailyWeather : Decode.Decoder DailyWeather
dailyWeather =
    decode DailyWeather
        |> required "highTemperature" Decode.float
        |> required "humidity" Decode.float
        |> required "icon" Decode.string
        |> required "lowTemperature" Decode.float
        |> required "precipProbability" Decode.float
        |> required "precipType" Decode.string


dailyWeatherResponse : Decode.Decoder (List DailyWeather)
dailyWeatherResponse =
    Decode.list dailyWeather



-- dailyWeatherDecoder : Decode.Decoder WeatherResponse
-- dailyWeatherDecoder =
--     let
--         decoder =
--             decode WeatherResponse
--                 |> required "summary" Decode.string
--                 |> required "icon" Decode.string
--                 |> required "data" (Decode.list dailyWeather)
--     in
--     Decode.at [ "daily" ] decoder
