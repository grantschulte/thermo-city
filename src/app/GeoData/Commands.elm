module GeoData.Commands exposing (..)

import GeoData.Models exposing (..)
import Geolocation exposing (..)
import Messages exposing (..)
import Models exposing (..)
import Utils exposing (..)


fetchGeoData : Model -> Location -> Cmd Msg
fetchGeoData model location =
    Cmd.none


geoDataUrl : Config -> Location -> String
geoDataUrl config location =
    config.apiUrl ++ "/geocode?" ++ locationQuery location
