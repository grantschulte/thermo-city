module Hourly.View exposing (..)

import Hourly.Models exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Loader.View exposing (loader)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)


view : Model -> Html Msg
view model =
    div
        [ id "page-hourly"
        , class "page"
        ]
        [ page model.hourly
        ]


page : WebData (List HourlyWeather) -> Html Msg
page current =
    case current of
        NotAsked ->
            div [ class "flex items-center hc100" ] [ loader ]

        Loading ->
            div [ class "flex items-center hc100" ] [ loader ]

        Failure error ->
            div [ class "flex items-center hc100" ] [ text (toString error) ]

        Success current ->
            div [] []
