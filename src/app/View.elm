module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import Views.Index exposing (..)


-- VIEW


view : Model -> Html Msg
view model =
    Views.Index.view model
