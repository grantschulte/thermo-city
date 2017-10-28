module View exposing (..)

import Current.View
import Daily.View exposing (..)
import Error.View exposing (..)
import GeoData.View exposing (..)
import Header.View exposing (..)
import Hourly.View exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import Page.Models exposing (..)


view : Model -> Html Msg
view model =
    div
        [ id "wrapper"
        , classList
            [ ( "theme-night", False )
            ]
        ]
        [ header model
        , div
            [ id "container"
            , class "p0"
            ]
            [ page model ]
        ]


header : Model -> Html Msg
header model =
    case model.page of
        GeoDataPage ->
            div [ class "display-none" ] []

        ErrorPage ->
            div [ class "display-none" ] []

        _ ->
            Header.View.view model


page : Model -> Html Msg
page model =
    case model.page of
        CurrentPage ->
            Current.View.view model

        DailyPage ->
            Daily.View.view model

        HourlyPage ->
            Hourly.View.view model

        ErrorPage ->
            Error.View.view model

        GeoDataPage ->
            GeoData.View.view model
