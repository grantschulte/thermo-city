module Home.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)


-- VIEW: INDEX


view : Model -> Html Msg
view model =
    div [ class "page-wrapper" ]
        [ Html.h3 [ class "mt0" ]
            [ text model.title
            , span [ class "material-icons color-warn" ] [ text "favorite" ]
            ]
        , infoText model.config
        ]


infoText : Config -> Html Msg
infoText config =
    p [ class "m0" ]
        [ text "Your are running in "
        , em [ class "underline" ] [ text config.nodeEnv ]
        , text " and the api url is "
        , em [ class "underline" ] [ text config.apiUrl ]
        ]
