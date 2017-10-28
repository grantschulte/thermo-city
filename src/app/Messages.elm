module Messages exposing (..)

import Current.Models exposing (..)
import Daily.Models exposing (..)
import GeoData.Models exposing (..)
import Geolocation exposing (..)
import Hourly.Models exposing (..)
import Models exposing (..)
import Page.Models exposing (..)
import RemoteData exposing (..)
import Scale.Models exposing (..)


-- MESSAGES


type Msg
    = CurrentWeatherResponse (WebData CurrentWeather)
    | DailyWeatherResponse (WebData (List DailyWeather))
    | FetchLocation (Result Geolocation.Error Location)
    | GeoDataResponse (WebData GeoData)
    | HourlyWeatherResponse (WebData (List HourlyWeather))
    | SetPage Page
    | SetTempScale Scale
    | ToggleMenu String
