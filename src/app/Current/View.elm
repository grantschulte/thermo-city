module Current.View exposing (..)

import Current.Models exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Loader.View exposing (loader)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)


view : Model -> Html Msg
view model =
    div
        [ id "page-current"
        , class "page"
        ]
        [ page model.current
        ]


page : WebData CurrentWeather -> Html Msg
page current =
    case current of
        NotAsked ->
            loader

        Loading ->
            loader

        Failure error ->
            text (toString error)

        Success current ->
            div [] []
