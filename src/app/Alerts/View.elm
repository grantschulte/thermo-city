module Alerts.View exposing (..)

import Alerts.Models exposing (..)
import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)


view : Model -> Html Msg
view model =
    case model.alerts of
        Success alerts ->
            alertsDiv alerts model

        _ ->
            alertsDiv [] model


alertsDiv : List Alert -> Model -> Html Msg
alertsDiv alerts model =
    case List.length alerts of
        0 ->
            text ""

        _ ->
            div
                [ id "alerts"
                , classList
                    [ ( "active", model.alertsOverlay ) ]
                ]
                [ div
                    [ id "alerts__top-row"
                    , class "flex items-center p2"
                    , onClick ToggleAlerts
                    ]
                    [ span [ class "material-icons mr1" ] [ text "warning" ]
                    , span [ class "mr-auto" ] [ text "Alerts" ]
                    , span [ class "material-icons" ] [ text "more_horiz" ]
                    ]
                , div
                    [ id "alerts__body"
                    , class "flex flex-column px2 py3"
                    ]
                    (List.map alertRow alerts)
                ]


alertRow : Alert -> Html Msg
alertRow alert =
    div
        [ class "alert-single" ]
        [ h4 [ class "mb1" ] [ text alert.title ]
        , p [ class "bold" ] [ text (String.join ", " alert.regions) ]
        , p [] [ text alert.description ]
        ]
