module Daily.View exposing (..)

import Commands exposing (iconClass)
import Daily.Models exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Loader.View exposing (loader)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Utils exposing (getDay)


view : Model -> Html Msg
view model =
    div
        [ id "page-daily"
        , class "page"
        ]
        [ page model.daily
        ]


page : WebData (List DailyWeather) -> Html Msg
page daily =
    case daily of
        NotAsked ->
            loader

        Loading ->
            loader

        Failure error ->
            text (toString error)

        Success days ->
            daysList days


daysList : List DailyWeather -> Html Msg
daysList days =
    ul
        [ id "weather-card-list"
        , class "list-reset mt0 mb0 flex flex-wrap p1"
        ]
        (List.map dayRow days)


dayRow : DailyWeather -> Html Msg
dayRow day =
    li [ class "weather-card col-12 sm-col-12 md-col-6 lg-col-3 p1" ]
        [ div
            [ class "weather-card__inner" ]
            [ div
                [ class "weather-card__time mb2 h3" ]
                [ text (getDay day.time) ]
            , div
                [ class "weather-card__icon" ]
                [ span
                    [ classList
                        [ ( iconClass day.icon, True ) ]
                    ]
                    []
                ]
            , p
                [ class "weather-card__summary mt1" ]
                [ span
                    [ class "weather-card__summary__low" ]
                    [ text (toString (ceiling day.temperatureLow)) ]
                , span
                    [ class "weather-card__summary__slash" ]
                    [ text "/" ]
                , span
                    [ class "weather-card__summary__high" ]
                    [ text (toString (ceiling day.temperatureHigh)) ]
                ]
            ]
        ]
