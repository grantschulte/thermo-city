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
            , class "flex items-center left-align col-4"
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
            , class "flex items-center justify-center col-4"
            ]
            [ span [ class "address" ]
                [ text "Location name" ]
            ]
        , div
            [ id "header__buttons"
            , class "col-4 flex justify-end"
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
