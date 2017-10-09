module Hourly.View exposing (..)

import Commands exposing (iconClass)
import Hourly.Models exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Json.Encode exposing (string)
import Loader.View exposing (loader)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Utils exposing (getHour)


view : Model -> Html Msg
view model =
    div
        [ id "page-hourly"
        , class "page"
        ]
        [ page model.hourly
        ]


page : WebData (List HourlyWeather) -> Html Msg
page current =
    case current of
        NotAsked ->
            div [ class "flex items-center hc100" ] [ loader ]

        Loading ->
            div [ class "flex items-center hc100" ] [ loader ]

        Failure error ->
            div [ class "flex items-center hc100" ] [ text (toString error) ]

        Success hourly ->
            hourlyList hourly


hourlyList : List HourlyWeather -> Html Msg
hourlyList hours =
    ul
        [ id "weather-card-list"
        , class "list-reset mt0 mb0 flex flex-wrap p1"
        ]
        (List.map hourRow hours)


hourRow : HourlyWeather -> Html Msg
hourRow hour =
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
                [ span [] [ text (toString (ceiling hour.temperature)) ]
                , span
                    [ class "degrees"
                    , property "innerHTML" (string "&deg;")
                    ]
                    []
                ]
            ]
        ]
