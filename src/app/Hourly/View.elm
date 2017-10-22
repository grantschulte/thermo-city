module Hourly.View exposing (..)

import Commands exposing (iconClass)
import Hourly.Models exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Loader.View exposing (loader)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Utils exposing (getHour, makeTemp, tempScaleSymbol)


view : Model -> Html Msg
view model =
    div
        [ id "page-hourly"
        , class "page"
        ]
        [ page model.hourly model.tempScale
        ]


page : WebData (List HourlyWeather) -> Scale -> Html Msg
page current tempScale =
    case current of
        NotAsked ->
            div [ class "flex items-center hc100" ] [ loader ]

        Loading ->
            div [ class "flex items-center hc100" ] [ loader ]

        Failure error ->
            div [ class "flex items-center hc100" ] [ text (toString error) ]

        Success hourly ->
            hourlyList hourly tempScale


hourlyList : List HourlyWeather -> Scale -> Html Msg
hourlyList hours tempScale =
    ul
        [ id "weather-card-list"
        , class "list-reset mt0 mb0 flex flex-wrap p1"
        ]
        (List.map (hourRow tempScale) hours)


hourRow : Scale -> HourlyWeather -> Html Msg
hourRow tempScale hour =
    li [ class "hourly-card col-12 p1" ]
        [ div
            [ class "hourly-card__inner" ]
            [ div
                [ class "hourly-card__time h3 mr-auto" ]
                [ text (getHour hour.time) ]
            , div
                [ class "hourly-card__icon" ]
                [ span
                    [ classList
                        [ ( iconClass hour.icon, True ) ]
                    ]
                    []
                ]
            , div
                [ class "hourly-card__temp ml2" ]
                [ span [] [ text (makeTemp hour.temperature tempScale) ]
                , tempScaleSymbol
                ]
            ]
        ]
