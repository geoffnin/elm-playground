module Main exposing (..)

import Html.App
import Messages exposing (Msg)
import Models exposing (Model)
import View exposing (view)
import Update exposing (update)

init : ( Model, Cmd Msg )
init =
  ( "Hallo", Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- Main

main : Program Never
main =
  Html.App.program
    { init = init,
      view = view,
      update = update,
      subscriptions = subscriptions
    }
