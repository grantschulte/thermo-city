module Daily.View exposing (..)

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
        [ id "day-list"
        , class "list-reset"
        ]
        (List.map dayRow days)


dayRow : DailyWeather -> Html Msg
dayRow day =
    li [ class "day-list__item" ]
        [ text day.summary ]
