module Header.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Messages exposing (..)
import Models exposing (..)


view : Model -> Html Msg
view model =
    header
        [ id "header"
        , class "flex items-center p2"
        ]
        [ div
            [ id "header__logo"
            , class "flex items-center mr-auto left-align"
            ]
            [ span
                [ class "material-icons mr1 color-primary display-none" ]
                [ text "location_city" ]
            , span
                [ class "color-accent" ]
                [ text "Thermo.city" ]
            ]
        , div
            [ id "header__buttons"
            , class "right-align"
            ]
            [ span
                [ classList
                    [ ( "active", model.page == CurrentPage )
                    ]
                , onClick (SetPage CurrentPage)
                ]
                [ text "Current" ]
            , span
                [ classList
                    [ ( "ml2", True )
                    , ( "active", model.page == DailyPage )
                    ]
                , onClick (SetPage DailyPage)
                ]
                [ text "This Week" ]
            ]
        ]
