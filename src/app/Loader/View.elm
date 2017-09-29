module Loader.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)


loader : Html Msg
loader =
    div
        [ id "loader"
        ]
        [ text "Loading..." ]
