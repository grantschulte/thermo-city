module Header.View exposing (..)

import Commands exposing (iconClass)
import Current.Models exposing (..)
import GeoData.Models exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Utils exposing (tempScaleSymbol)


view : Model -> Html Msg
view model =
    header
        [ id "header"
        , class "flex flex-wrap items-center px2 pt2"
        ]
        [ div
            [ id "header__logo"
            , class "flex items-center col-12 sm-col-6 left-align"
            ]
            [ a
                [ href "/"
                , class "flex items-center"
                ]
                [ span
                    [ classList
                        [ ( headerIcon model.current, True ) ]
                    , class "mr1 h3"
                    ]
                    []
                , span
                    [ id "header__logo__location-name" ]
                    [ text (address model.geoData) ]
                ]
            ]
        , div
            [ id "header__buttons"
            , class "flex  items-center col-12 sm-col-6"
            ]
            [ div
                [ class "col-12 flex justify-end right-align" ]
                [ button
                    [ classList
                        [ ( "btn btn-small btn-secondary mr1 xs-hide", True )
                        , ( "active", model.tempScale == C )
                        ]
                    , onClick (SetTempScale C)
                    ]
                    [ text "C"
                    , tempScaleSymbol
                    ]
                , button
                    [ classList
                        [ ( "btn btn-small btn-secondary mr1 xs-hide", True )
                        , ( "active", model.tempScale == F )
                        ]
                    , onClick (SetTempScale F)
                    ]
                    [ text "F"
                    , tempScaleSymbol
                    ]
                , button
                    [ classList
                        [ ( "btn btn-small btn-secondary", True )
                        , ( "active", model.page == CurrentPage )
                        ]
                    , onClick (SetPage CurrentPage)
                    ]
                    [ text "Currently" ]
                , button
                    [ classList
                        [ ( "btn btn-small btn-secondary ml1", True )
                        , ( "active", model.page == DailyPage )
                        ]
                    , onClick (SetPage DailyPage)
                    ]
                    [ text "Daily" ]
                , button
                    [ classList
                        [ ( "btn btn-small btn-secondary ml1", True )
                        , ( "active", model.page == HourlyPage )
                        ]
                    , onClick (SetPage HourlyPage)
                    ]
                    [ text "Hourly" ]
                ]
            ]
        ]


address : WebData GeoData -> String
address geoData =
    case geoData of
        NotAsked ->
            ""

        Loading ->
            "Locating..."

        Failure error ->
            ""

        Success data ->
            " " ++ data.address


headerIcon : WebData CurrentWeather -> String
headerIcon current =
    case current of
        Success current ->
            iconClass current.icon

        _ ->
            "weather-icon-sun"
