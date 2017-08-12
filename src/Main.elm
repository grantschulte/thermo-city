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
    { greeting = "Hello from Mottoto"
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
    div [ pageWrapper ]
        [ Html.h3 [] [ greetingText model.greeting ]
        , infoText model.apiUrl model.nodeEnv
        ]


greetingText : Greeting -> Html Msg
greetingText greeting =
    span []
        [ text greeting
        , span [ class "material-icons", redStyle ] [ text "favorite" ]
        ]


infoText : ApiUrl -> NodeEnv -> Html Msg
infoText apiUrl nodeEnv =
    p []
        [ text "Your are running in "
        , em [ underlineStyle ] [ text nodeEnv ]
        , text " and the api url is "
        , em [ underlineStyle ] [ text apiUrl ]
        ]


underlineStyle : Attribute msg
underlineStyle =
    style
        [ ( "text-decoration", "underline" )
        ]


redStyle : Attribute msg
redStyle =
    style
        [ ( "color", "red" )
        ]


pageWrapper : Attribute msg
pageWrapper =
    style
        [ ( "padding", "20px" )
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
