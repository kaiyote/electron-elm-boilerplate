port module Ports exposing (path, pushPath, delay, postDelay)


port path : (String -> msg) -> Sub msg


port pushPath : String -> Cmd msg


port delay : Int -> Cmd msg


port postDelay: (Maybe Bool -> msg) -> Sub msg
