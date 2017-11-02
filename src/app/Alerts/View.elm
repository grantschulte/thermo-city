module Alerts.View exposing (..)

import Alerts.Models exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)


view : Model -> Html Msg
view model =
    case model.alerts of
        Success alerts ->
            alertsDiv alerts

        _ ->
            alertsDiv []


alertsDiv : List Alert -> Html Msg
alertsDiv alerts =
    div
        [ id "alerts"
        , class "p2"
        ]
        [ div [ class "flex items-center" ]
            [ span [ class "material-icons mr1" ] [ text "warning" ]
            , span [] [ text "Alerts" ]
            ]
        ]
