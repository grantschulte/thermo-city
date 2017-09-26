module Daily.View exposing (..)

import Commands exposing (iconClass)
import Daily.Models exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)


view : Model -> Html Msg
view model =
    div
        [ id "page-daily"
        , class "page"
        ]
        [ dailyList model.daily
        ]


dailyList : WebData (List DailyWeather) -> Html Msg
dailyList daily =
    case daily of
        NotAsked ->
            text "Initializing"

        Loading ->
            text "Loading"

        Failure error ->
            text (toString error)

        Success days ->
            daysList days


daysList : List DailyWeather -> Html Msg
daysList days =
    ul
        [ id "weather-card-list"
        , class "list-reset mt0 mb0 flex flex-wrap px1"
        , style [ ( "height", "calc(100% - 48px)" ) ]
        ]
        (List.map dayRow days)


dayRow : DailyWeather -> Html Msg
dayRow day =
    li [ class "weather-card col-12 sm-col-6 md-col-6 lg-col-3 p1" ]
        [ div
            [ class "weather-card__inner" ]
            [ div
                [ class "weather-card__icon" ]
                [ span
                    [ classList
                        [ ( iconClass day.icon, True ) ]
                    ]
                    []
                ]
            , p
                [ class "weather-card__summary" ]
                [ text day.summary ]
            ]
        ]
