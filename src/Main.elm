module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


-- MODEL


type alias ApiUrl =
    String


type alias NodeEnv =
    String


type alias Greeting =
    String


type alias Model =
    { greeting : Greeting
    , apiUrl : ApiUrl
    , nodeEnv : NodeEnv
    }


type alias Flags =
    { apiUrl : ApiUrl
    , nodeEnv : NodeEnv
    }


initModel : Model
initModel =
    { greeting = "Elm Web Starter"
    , apiUrl = ""
    , nodeEnv = ""
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { initModel
        | apiUrl = flags.apiUrl
        , nodeEnv = flags.nodeEnv
      }
    , Cmd.none
    )



-- MESSAGES


type Msg
    = NoOp



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "page-wrapper" ]
        [ Html.h3 [ class "mt0" ]
            [ text model.greeting
            , span [ class "material-icons color-warn" ] [ text "favorite" ]
            ]
        , infoText model.apiUrl model.nodeEnv
        ]


infoText : ApiUrl -> NodeEnv -> Html Msg
infoText apiUrl nodeEnv =
    p [ class "m0" ]
        [ text "Your are running in "
        , em [ class "underline" ] [ text nodeEnv ]
        , text " and the api url is "
        , em [ class "underline" ] [ text apiUrl ]
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
