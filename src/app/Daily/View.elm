module Daily.View exposing (..)

import Commands exposing (iconClass)
import Daily.Models exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Json.Encode exposing (string)
import Loader.View exposing (loader)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Scale.Models exposing (..)
import Utils exposing (getDay, makeTemp, tempScaleSymbol)


view : Model -> Html Msg
view model =
    div
        [ id "page-daily"
        , class "page"
        ]
        [ page model.daily model.tempScale
        ]


page : WebData (List DailyWeather) -> Scale -> Html Msg
page daily tempScale =
    case daily of
        NotAsked ->
            div [ class "flex items-center hc100" ] [ loader ]

        Loading ->
            div [ class "flex items-center hc100" ] [ loader ]

        Failure error ->
            div [ class "flex items-center hc100" ] [ text (toString error) ]

        Success days ->
            daysList days tempScale


daysList : List DailyWeather -> Scale -> Html Msg
daysList days tempScale =
    ul
        [ id "weather-card-list"
        , class "list-reset mt0 mb0 flex flex-wrap p1"
        ]
        (List.map (dayRow tempScale) days)


dayRow : Scale -> DailyWeather -> Html Msg
dayRow tempScale day =
    li [ class "daily-card col-12 sm-col-12 md-col-6 lg-col-3 p1" ]
        [ div
            [ class "daily-card__inner" ]
            [ div
                [ class "daily-card__time mb2 h3" ]
                [ text (getDay day.time) ]
            , div
                [ class "daily-card__icon" ]
                [ span
                    [ classList
                        [ ( iconClass day.icon, True ) ]
                    ]
                    []
                ]
            , div
                [ class "daily-card__summary mt1" ]
                [ span
                    [ class "daily-card__summary__low" ]
                    [ text (makeTemp day.temperatureLow tempScale)
                    , span
                        [ class "degrees"
                        , property "innerHTML" (string "&deg;")
                        ]
                        []
                    ]
                , span
                    [ class "daily-card__summary__slash" ]
                    [ text "/" ]
                , span
                    [ class "daily-card__summary__high" ]
                    [ text (makeTemp day.temperatureHigh tempScale)
                    , tempScaleSymbol
                    ]
                ]
            ]
        ]
