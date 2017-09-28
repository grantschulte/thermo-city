module GeoLocation.Commands exposing (..)

import GeoLocation.Models exposing (..)
import Models exposing (..)


fetchGeoData : Model -> Maybe a
fetchGeoData model =
    Nothing


geoDataUrl : Config -> Coordinates -> String
geoDataUrl config coordinates =
    config.apiUrl ++ "/geodata" ++ makeCoordinates coordinates


makeCoordinates : Coordinates -> String
makeCoordinates coordinates =
    toString coordinates.latitude ++ "," ++ toString coordinates.longitude
