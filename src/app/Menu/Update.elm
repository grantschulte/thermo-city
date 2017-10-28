module Menu.Update exposing (..)

import Menu.Models exposing (..)


toggleMenu : String -> Menus -> Menus
toggleMenu menu menus =
    case menu of
        "tempScale" ->
            { menus | tempScale = setActiveMenuState menus.tempScale }

        "view" ->
            { menus | view = setActiveMenuState menus.view }

        _ ->
            menus


setActiveMenuState : { a | active : Bool } -> { a | active : Bool }
setActiveMenuState menu =
    { menu | active = not menu.active }
