module Menu.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Messages exposing (..)
import Models exposing (..)


view : Model -> Html Msg
view model =
    div
        [ id "header__menu"
        , class "flex flex-wrap items-center col-12 sm-col-6 px1 pt1"
        ]
        [ div
            [ class "col-6 pr1 relative" ]
            [ scaleMenu model
            , div
                [ classList
                    [ ( "active", model.menus.tempScale == True )
                    ]
                , class "menu-options pr1"
                ]
                [ scaleMenuOptions model ]
            ]
        , div
            [ class "col-6 pl1" ]
            [ viewMenu model
            ]
        ]


viewMenu : Model -> Html Msg
viewMenu model =
    div
        [ id "header__menu__view"
        , class "flex items-center pl2 pr1 py2 btn-secondary w100 relative radius menu-options__title"
        , onClick (ToggleMenu "view")
        ]
        [ span
            [ class "mr-auto" ]
            [ text (viewName model) ]
        , span
            [ class "material-icons" ]
            [ text "more_horiz" ]
        ]


scaleMenu : Model -> Html Msg
scaleMenu model =
    div
        [ id "header__menu__scale"
        , class "flex items-center pl2 pr1 py2 btn-secondary w100 relative radius menu-options__title"
        , onClick (ToggleMenu "tempScale")
        ]
        [ span
            [ class "mr-auto" ]
            [ text (scaleName model) ]
        , span
            [ class "material-icons" ]
            [ text "more_horiz" ]
        ]


scaleMenuOptions : Model -> Html Msg
scaleMenuOptions model =
    case model.tempScale of
        F ->
            div
                [ class "menu-options__option p2 btn-secondary"
                , onClick (SetTempScale C)
                ]
                [ text "Celsius" ]

        C ->
            div
                [ class "menu-options__option p2 btn-secondary"
                , onClick (SetTempScale F)
                ]
                [ text "Fahrenheit" ]


viewName : Model -> String
viewName model =
    case model.page of
        CurrentPage ->
            "Currently"

        DailyPage ->
            "Daily"

        HourlyPage ->
            "Hourly"

        _ ->
            ""


scaleName : Model -> String
scaleName model =
    case model.tempScale of
        C ->
            "Celsius"

        F ->
            "Fahrenheit"
