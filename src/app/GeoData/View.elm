module GeoData.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Loader.View exposing (loader)
import Messages exposing (..)
import Models exposing (..)


view : Model -> Html Msg
view model =
    div
        [ id "page-loading"
        , class "flex flex-column items-center justify-center overflow-hidden h100"
        ]
        [ loader
        , p
            [ class "max-width-2 h2" ]
            [ text "Finding your location..." ]
        ]
