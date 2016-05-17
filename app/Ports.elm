port module Ports exposing (path, pushPath, delay, postDelay, swap)


port path : (String -> msg) -> Sub msg


port pushPath : String -> Cmd msg


port delay : Int -> Cmd msg


port postDelay: (Maybe Bool -> msg) -> Sub msg


port swap : (Bool -> msg) -> Sub msg
