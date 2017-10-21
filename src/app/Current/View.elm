module Current.View exposing (..)

import Commands exposing (iconClass)
import Current.Models exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Loader.View exposing (loader)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Utils exposing (tempScaleSymbol, toCelsius)


view : Model -> Html Msg
view model =
    div
        [ id "page-current"
        , class "page"
        ]
        [ page model.current model.tempScale
        ]


page : WebData CurrentWeather -> Scale -> Html Msg
page current tempScale =
    case current of
        NotAsked ->
            div [ class "flex items-center hc100" ] [ loader ]

        Loading ->
            div [ class "flex items-center hc100" ] [ loader ]

        Failure error ->
            div [ class "flex items-center hc100" ] [ text (toString error) ]

        Success current ->
            currentView current tempScale


currentView : CurrentWeather -> Scale -> Html Msg
currentView current tempScale =
    div
        [ class "flex flex-wrap p2 mt0 mb0 items-center hc100" ]
        [ div
            [ id "currently-card"
            , class "col-12 md-col-6 flex flex-column items-center justify-center"
            ]
            [ div
                [ class "mb3 h3" ]
                [ text current.summary ]
            , div
                []
                [ span
                    [ id "currently-card__icon"
                    , classList
                        [ ( iconClass current.icon, True ) ]
                    ]
                    []
                ]
            , div
                [ class "mt3" ]
                [ span
                    [ id "currently-card__temp" ]
                    [ text (makeTemp current.temperature tempScale)
                    , tempScaleSymbol
                    ]
                ]
            ]
        , div
            [ class "col-12 md-col-6 flex items-center justify-center" ]
            []
        ]


makeTemp : Float -> Scale -> String
makeTemp temp tempScale =
    case tempScale of
        C ->
            temp
                |> toCelsius
                |> ceiling
                |> toString

        F ->
            temp
                |> ceiling
                |> toString
