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
            alertsDiv alerts model

        _ ->
            alertsDiv [] model


alertsDiv : List Alert -> Model -> Html Msg
alertsDiv alerts model =
    case List.length alerts of
        _ ->
            div
                [ id "alerts"
                , classList
                    [ ( "active", True ) ]
                ]
                [ div
                    [ id "alerts-top-row"
                    , class "flex items-center p2"
                    ]
                    [ span [ class "material-icons mr1" ] [ text "warning" ]
                    , span [ class "mr-auto" ] [ text "Alerts" ]
                    , span [ class "material-icons" ] [ text "more_horiz" ]
                    ]
                , div
                    [ id "alerts-body"
                    , class "flex flex-column px2 py3"
                    ]
                    [ div
                        [ class "alert-single" ]
                        [ h4 [ class "mb1" ] [ text "This is an alert heading" ]
                        , p [] [ text "This is an alert body." ]
                        ]
                    , div
                        [ class "alert-single" ]
                        [ h4 [ class "mb1" ] [ text "This is an alert heading" ]
                        , p [] [ text "This is an alert body." ]
                        ]
                    ]
                ]
