module Error.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)


view : Model -> Html Msg
view model =
    div
        [ id "page-error"
        , class ""
        ]
        [ text (toString model.location) ]
