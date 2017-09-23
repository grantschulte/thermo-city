module Home.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)


-- VIEW: INDEX


view : Model -> Html Msg
view model =
    div [ class "p2" ]
        [ div [ class "flex items-center pb2 mb2 border-bottom" ]
            [ span [ class "material-icons mr1 h3" ] [ text "favorite" ]
            , span [] [ text model.title ]
            ]
        , infoText model.config
        ]


infoText : Config -> Html Msg
infoText config =
    div []
        [ p [ class "m0" ]
            [ text "env: "
            , em [ class "underline" ] [ text config.nodeEnv ]
            ]
        , p [ class "m0" ]
            [ text "api: "
            , em [ class "underline" ] [ text config.apiUrl ]
            ]
        ]
