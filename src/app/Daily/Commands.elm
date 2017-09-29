module Daily.Commands exposing (..)

import Daily.Decoder exposing (..)
import Geolocation exposing (..)
import Http exposing (..)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Utils exposing (..)


fetchDailyWeather : Model -> Location -> Cmd Msg
fetchDailyWeather model location =
    Http.get (dailyWeatherUrl model.config location) dailyWeatherResponse
        |> RemoteData.sendRequest
        |> Cmd.map DailyWeatherResponse


dailyWeatherUrl : Config -> Location -> String
dailyWeatherUrl config location =
    config.apiUrl ++ "/daily?" ++ locationQuery location
