module View exposing (..)

import Current.View
import Daily.View exposing (..)
import Header.View exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)


view : Model -> Html Msg
view model =
    div
        [ id "wrapper" ]
        [ Header.View.view model
        , div
            [ id "container"
            , class "p0"
            ]
            [ page model ]
        ]


page : Model -> Html Msg
page model =
    case model.page of
        CurrentPage ->
            Current.View.view model

        DailyPage ->
            Daily.View.view model
