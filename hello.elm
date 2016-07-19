module App exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.App
import Widget

-- Model
type alias AppModel = { widgetModel : Widget.Model }

initialModel : AppModel
initialModel = { widgetModel = Widget.initialModel }

init : ( AppModel, Cmd Msg )
init = ( initialModel, Cmd.none )

-- Messages
type Msg = WidgetMsg Widget.Msg

-- View
view : AppModel -> Html Msg
view model =
  Html.div []
           [ Html.App.map WidgetMsg (Widget.view model.widgetModel)]


-- Update
update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update message model =
  case message of
    WidgetMsg subMsg ->
      let ( updateWidgetModel, widgetCmd ) =
        Widget.update subMsg model.widgetModel
      in ( { model | widgetModel = updateWidgetModel }, Cmd.map WidgetMsg widgetCmd )

-- Subscriptions
subscriptions : AppModel -> Sub Msg
subscriptions model =
  Sub.none

-- Main
main : Program Never
main =
  Html.App.program {
    init = init,
    view = view,
    update = update,
    subscriptions = subscriptions
  }
