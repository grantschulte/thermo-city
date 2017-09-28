module Main exposing (..)

-- import Daily.Commands exposing (..)
-- import GeoLocation.Commands exposing (..)

import Html exposing (..)
import Messages exposing (..)
import Models exposing (Config, Model, initialModel)
import Update exposing (update)
import View exposing (view)


-- INIT


init : Config -> ( Model, Cmd Msg )
init config =
    let
        model =
            initialModel config
    in
    ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Config Model Msg
main =
    Html.programWithFlags
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
