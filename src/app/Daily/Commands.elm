module Daily.Commands exposing (..)

import Daily.Decoder exposing (..)
import Http exposing (..)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)


getDailyWeather : Model -> Cmd Msg
getDailyWeather model =
    Http.get (dailyWeatherUrl model.config) dailyWeatherResponse
        |> RemoteData.sendRequest
        |> Cmd.map DailyWeatherResponse


dailyWeatherUrl : Config -> String
dailyWeatherUrl config =
    config.apiUrl ++ "/daily"



-- config.dsApiRoot ++ "/forecast/" ++ config.dsApiKey ++ "/" ++ makeCoordinates config.coordinates ++ "?exclude=[currently,minutely,hourly,flags]"


makeCoordinates : Coordinates -> String
makeCoordinates coordinates =
    toString coordinates.latitude ++ "," ++ toString coordinates.longitude
