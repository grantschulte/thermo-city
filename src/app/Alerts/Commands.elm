module Alerts.Commands exposing (..)

import Alerts.Decoder exposing (..)
import Geolocation exposing (..)
import Http exposing (..)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Utils exposing (..)


fetchAlerts : Model -> Location -> Cmd Msg
fetchAlerts model location =
    Http.get (alertsUrl model.config location) alertsDecoder
        |> RemoteData.sendRequest
        |> Cmd.map AlertsResponse


alertsUrl : Config -> Location -> String
alertsUrl config location =
    config.apiUrl ++ "/alerts?" ++ locationQuery location
