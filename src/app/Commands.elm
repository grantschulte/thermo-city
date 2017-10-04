module Commands exposing (..)


iconClass : String -> String
iconClass name =
    case name of
        "clear-day" ->
            "weather-icon-sun"

        "clear-night" ->
            "weather-icon-moon"

        "rain" ->
            "weather-icon-cloud-rain"

        "snow" ->
            "weather-icon-cloud-snow"

        "sleet" ->
            "weather-icon-cloud-drizzle"

        "wind" ->
            "weather-icon-wind"

        "fog" ->
            "weather-icon-cloud-fog"

        "cloudy" ->
            "weather-icon-cloud"

        "partly-cloudy-day" ->
            "weather-icon-cloud-sun"

        "partly-cloudy-night" ->
            "weather-icon-cloud-moon"

        _ ->
            "weather-icon-cloud"
