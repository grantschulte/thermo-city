module Current.Commands exposing (..)

import Current.Decoder exposing (..)
import Geolocation exposing (..)
import Http exposing (..)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Utils exposing (..)


fetchCurrentWeather : Model -> Location -> Cmd Msg
fetchCurrentWeather model location =
    Http.get (currentWeatherUrl model.config location) currentWeatherDecoder
        |> RemoteData.sendRequest
        |> Cmd.map CurrentWeatherResponse


currentWeatherUrl : Config -> Location -> String
currentWeatherUrl config location =
    config.apiUrl ++ "/current?" ++ locationQuery location
