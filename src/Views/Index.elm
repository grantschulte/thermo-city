module Views.Index exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (ApiUrl, Model, NodeEnv)


-- VIEW: INDEX


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
