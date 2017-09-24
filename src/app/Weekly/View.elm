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
        [ dayRow model
        ]


dayRow : Model -> Html Msg
dayRow model =
    div [ class "daily-outlook-row" ]
        [ text "Weekly" ]
