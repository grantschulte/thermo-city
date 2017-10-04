module Header.View exposing (..)

import GeoData.Models exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)


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
                    [ class "weather-icon-sun mr1 h3" ]
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
                        [ ( "btn btn-small bg-primary", True )
                        , ( "active", model.page == CurrentPage )
                        ]
                    , onClick (SetPage CurrentPage)
                    ]
                    [ text "Current" ]
                , button
                    [ classList
                        [ ( "btn btn-small bg-primary ml1", True )
                        , ( "active", model.page == DailyPage )
                        ]
                    , onClick (SetPage DailyPage)
                    ]
                    [ text "Daily" ]
                , button
                    [ classList
                        [ ( "btn btn-small bg-primary ml1", True )
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
