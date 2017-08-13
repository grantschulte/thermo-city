module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (ApiUrl, Flags, Greeting, Model, NodeEnv, initialModel)
import Update exposing (update)
import View exposing (view)


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { initialModel
        | apiUrl = flags.apiUrl
        , nodeEnv = flags.nodeEnv
      }
    , Cmd.none
    )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Flags Model Msg
main =
    Html.programWithFlags
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
