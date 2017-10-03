module Update exposing (..)

import Daily.Commands exposing (..)
import GeoData.Commands exposing (..)
import Geolocation
import Messages exposing (..)
import Models exposing (..)
import Task


-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CurrentWeatherResponse response ->
            ( { model | current = response }, Cmd.none )

        DailyWeatherResponse response ->
            ( { model | daily = response }, Cmd.none )

        GeoDataResponse response ->
            ( { model | geoData = response }, Cmd.none )

        FetchLocation (Ok result) ->
            ( { model
                | location = Ok (Just result)
                , page = DailyPage
              }
            , Cmd.batch
                [ fetchGeoData model result
                , fetchDailyWeather model result
                ]
            )

        FetchLocation (Err error) ->
            ( { model
                | location = Err error
                , page = ErrorPage
              }
            , Cmd.none
            )

        SetPage page ->
            ( { model | page = page }, setPageCmd model page )


setPageCmd : Model -> Page -> Cmd Msg
setPageCmd model page =
    case page of
        GeoDataPage ->
            Task.attempt FetchLocation Geolocation.now

        _ ->
            Cmd.none
