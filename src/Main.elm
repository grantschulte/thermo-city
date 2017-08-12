module Main exposing (..)

import Html exposing (Html, div, program, text)


-- MODEL


type alias Model =
    { greeting : String
    , apiUrl : String
    }


type alias Flags =
    { apiUrl : String
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { greeting = "Hello", apiUrl = flags.apiUrl }, Cmd.none )



-- MESSAGES


type Msg
    = NoOp



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text model.greeting ]
        , div [] [ text model.apiUrl ]
        ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



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
