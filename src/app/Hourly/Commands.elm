module Hourly.Commands exposing (..)

import Geolocation exposing (..)
import Hourly.Decoder exposing (..)
import Http exposing (..)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Utils exposing (..)


fetchHourlyWeather : Model -> Location -> Cmd Msg
fetchHourlyWeather model location =
    Http.get (hourlyWeatherUrl model.config location) hourlyListDecoder
        |> RemoteData.sendRequest
        |> Cmd.map HourlyWeatherResponse


hourlyWeatherUrl : Config -> Location -> String
hourlyWeatherUrl config location =
    config.apiUrl ++ "/hourly?" ++ locationQuery location
