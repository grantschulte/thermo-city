module Current.View exposing (..)

import Commands exposing (iconClass)
import Current.Models exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Json.Encode exposing (string)
import Loader.View exposing (loader)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)


view : Model -> Html Msg
view model =
    div
        [ id "page-current"
        , class "page"
        ]
        [ page model.current
        ]


page : WebData CurrentWeather -> Html Msg
page current =
    case current of
        NotAsked ->
            div [ class "flex items-center hc100" ] [ loader ]

        Loading ->
            div [ class "flex items-center hc100" ] [ loader ]

        Failure error ->
            div [ class "flex items-center hc100" ] [ text (toString error) ]

        Success current ->
            currentView current


currentView : CurrentWeather -> Html Msg
currentView current =
    div
        [ class "flex flex-wrap p2 mt0 mb0 items-center hc100" ]
        [ div
            [ id "current-card"
            , class "col-12 md-col-6 flex flex-column items-center justify-center"
            ]
            [ div
                [ class "mb3 h3" ]
                [ text current.summary ]
            , div
                []
                [ span
                    [ id "current-card__icon"
                    , classList
                        [ ( iconClass current.icon, True ) ]
                    ]
                    []
                ]
            , div
                [ class "mt3" ]
                [ span
                    [ id "current-card__temp" ]
                    [ text (toString (ceiling current.temperature))
                    , span [ property "innerHTML" (string "&deg;") ] []
                    ]
                ]
            ]
        , div
            [ class "col-12 md-col-6 flex items-center justify-center" ]
            []
        ]
