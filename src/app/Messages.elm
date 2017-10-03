module Messages exposing (..)

import Current.Models exposing (..)
import Daily.Models exposing (..)
import GeoData.Models exposing (..)
import Geolocation exposing (..)
import Http exposing (..)
import Models exposing (..)
import RemoteData exposing (..)


-- MESSAGES


type Msg
    = CurrentWeatherResponse (WebData CurrentWeather)
    | DailyWeatherResponse (WebData (List DailyWeather))
    | GeoDataResponse (WebData GeoData)
    | FetchLocation (Result Geolocation.Error Location)
    | SetPage Page
