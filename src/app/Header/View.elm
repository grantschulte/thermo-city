module Header.View exposing (..)

import Commands exposing (iconClass)
import Current.Models exposing (..)
import GeoData.Models exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Menu.View
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Utils exposing (tempScaleSymbol)


view : Model -> Html Msg
view model =
    header
        [ id "header"
        , class "flex flex-wrap items-center px1 pt1"
        ]
        [ div
            [ id "header__logo"
            , class "flex items-center col-12 sm-col-6 px1 pt1 left-align"
            ]
            [ a
                [ href "/"
                , class "flex items-center"
                ]
                [ span
                    [ classList
                        [ ( headerIcon model.current, True ) ]
                    , class "h3"
                    ]
                    []
                , span
                    [ id "header__logo__location-name"
                    , class "h3 p1"
                    ]
                    [ text (address model.geoData) ]
                ]
            ]
        , Menu.View.view model
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
