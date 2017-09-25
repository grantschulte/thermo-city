module Daily.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)


view : Model -> Html Msg
view model =
    div
        [ id "page-daily"
        , class "page"
        ]
        [ dayRow model
        ]


dayRow : Model -> Html Msg
dayRow model =
    div [ class "daily-outlook-row" ]
        [ text "Daily" ]
