module View exposing (..)

import Home.View exposing (..)
import Html exposing (..)
import Messages exposing (..)
import Models exposing (..)


-- VIEW


view : Model -> Html Msg
view model =
    Home.View.view model
