module Models exposing (..)

-- TYPES


type alias Title =
    String


type alias Config =
    { apiUrl : String
    , nodeEnv : String
    }


type alias Model =
    { title : Title
    , config : Config
    }



-- INITIAL MODEL


initialModel : Config -> Model
initialModel config =
    { title = "Elm Web Starter"
    , config = config
    }
