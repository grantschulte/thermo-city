module View exposing (..)

import Daily.View
import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import Weekly.View exposing (..)


view : Model -> Html Msg
view model =
    div [ class "page-container" ]
        [ page model ]


page : Model -> Html Msg
page model =
    case model.page of
        WeeklyPage ->
            Weekly.View.view model

        DailyPage ->
            Daily.View.view model
