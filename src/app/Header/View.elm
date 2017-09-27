module Header.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Messages exposing (..)
import Models exposing (..)


view : Model -> Html Msg
view model =
    header
        [ id "header"
        , class "flex items-center px2 pt2"
        ]
        [ div
            [ id "header__logo"
            , class "flex items-center mr-auto left-align"
            ]
            [ a
                [ href "/"
                , class "flex items-center"
                ]
                [ span
                    [ class "weather-icon-sun mr1 h3" ]
                    []
                , span
                    []
                    [ text "Thermo.city" ]
                ]
            ]
        , div
            [ id "header__location"
            , class "center"
            ]
            [ text model.config.address ]
        , div
            [ id "header__buttons"
            , class "ml-auto"
            ]
            [ span
                [ classList
                    [ ( "btn btn-small bg-secondary", True )
                    , ( "active", model.page == CurrentPage )
                    ]
                , onClick (SetPage CurrentPage)
                ]
                [ text "Current" ]
            , span
                [ classList
                    [ ( "btn btn-small bg-secondary ml1", True )
                    , ( "active", model.page == DailyPage )
                    ]
                , onClick (SetPage DailyPage)
                ]
                [ text "Daily" ]
            ]
        ]
