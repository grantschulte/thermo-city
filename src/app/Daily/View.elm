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
        [ div
            [ class "" ]
            [ text "Daily" ]
        ]
