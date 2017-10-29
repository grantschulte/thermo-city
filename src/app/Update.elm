module Update exposing (..)

import Current.Commands exposing (..)
import Daily.Commands exposing (..)
import GeoData.Commands exposing (..)
import Geolocation
import Hourly.Commands exposing (..)
import Menu.Models exposing (..)
import Menu.Update exposing (..)
import Messages exposing (..)
import Models exposing (..)
import Page.Models exposing (..)
import Scale.Models exposing (..)
import Task


-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AlertsResponse response ->
            ( { model | alerts = response }, Cmd.none )

        CurrentWeatherResponse response ->
            ( { model | current = response }, Cmd.none )

        DailyWeatherResponse response ->
            ( { model | daily = response }, Cmd.none )

        FetchLocation (Ok result) ->
            ( { model
                | location = Ok (Just result)
                , page = DailyPage
              }
            , Cmd.batch
                [ fetchGeoData model result
                , fetchDailyWeather model result
                , fetchCurrentWeather model result
                , fetchHourlyWeather model result
                ]
            )

        FetchLocation (Err error) ->
            ( { model
                | location = Err error
                , page = ErrorPage
              }
            , Cmd.none
            )

        GeoDataResponse response ->
            ( { model | geoData = response }, Cmd.none )

        HourlyWeatherResponse response ->
            ( { model | hourly = response }, Cmd.none )

        SetPage page ->
            ( { model
                | page = page
                , menus = toggleMenu "view" model.menus
              }
            , setPageCmd model page
            )

        SetTempScale tempScale ->
            ( { model
                | tempScale = tempScale
                , menus = toggleMenu "tempScale" model.menus
              }
            , Cmd.none
            )

        ToggleMenu menu ->
            ( { model | menus = toggleMenu menu model.menus }, Cmd.none )


setPageCmd : Model -> Page -> Cmd Msg
setPageCmd model page =
    case page of
        GeoDataPage ->
            Task.attempt FetchLocation Geolocation.now

        _ ->
            Cmd.none
