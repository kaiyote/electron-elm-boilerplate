module Main exposing (..)


import Platform.Cmd as Cmd exposing (Cmd)
import Html.App as Html
import Html exposing (div, text, ul, li, button)
import Html.Events exposing (onClick)


type Msg
  = Empty
  | CounterMsg Counter.Msg
  | AppendLog String


-- for elm-hot-loader to trigger a re-render
port swap : (Bool -> Msg) -> Sub Msg


main : Program flags
main =
  Html.program
    { init = init
    , update = update
    , view = view
    , subscriptions = [ swap ]
    }


type alias Model =
  { counter : Counter.Model
  , logs : List String
  }


init : (Model, Cmd Msg)
init =
  (Model Counter.init [], Cmd.none)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Empty ->
      (model, Cmd.none)

    CounterMsg counterMsg ->
      let
        (counterModel, _) = Counter.update counterMsg model.counter
      in
        ( { model | counter = counterModel}
        , Cmd.none
        )

    AppendLog log ->
      ( { model | logs = log :: model.logs }
      , callJSLog log
      )


view : Model -> Html Msg
view model =
  div []
    [ text "counter (Elm.Main):"
    , text "hi pals"
    , text "logs:"
    , button [ onClick AppendLog (getLog model) ] [ text "append log"]
    , ul [] (List.map (\log -> li [] [ text log ]) model.logs)
    ]


getLog : Model -> String
getLog model =
  ("Count = " ++ (toString model.counter))


callJSLog : String -> Cmd Msg
callJSLog log =
  Signal.send logMailbox.address log
    |> Cmd.task
    |> Cmd.map (\_ -> Empty)


logMailbox : Signal.Mailbox String
logMailbox =
  Signal.mailbox ""


port logs : String -> Cmd Msg
