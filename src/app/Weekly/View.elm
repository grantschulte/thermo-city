module Weekly.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)


view : Model -> Html Msg
view model =
    div
        [ id "page-seven-day"
        , class "page"
        ]
        [ dailyOutlookRow model
        ]


dailyOutlookRow : Model -> Html Msg
dailyOutlookRow model =
    div [ class "daily-outlook-row p2 border-bottom" ]
        [ text "Seven Day" ]
