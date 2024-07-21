import Exercises

fixture :: [(String, Bool)]
fixture =
    [ ( "change works for 0", change 0 == Right (0, 0, 0, 0) )
    , ( "change detects negatives", change (-50) == Left "amount cannot be negative" )
    , ( "change works for 1", change 1 == Right (0, 0, 0, 1) )
    , ( "change works for 99", change 99 == Right (3, 2, 0, 4) )
    , ( "change works for 42", change 42 == Right (1, 1, 1, 2) )
    , ( "change works for 100000000037", change 100000000037 == Right (4000000001, 1, 0, 2) )
    , ( "change works for 10000000000005", change 10000000000005 == Right (400000000000, 0, 1, 0) )
    ]

main =
    let results = map test fixture in do
        putStrLn $ unlines $ map fst results
        putStrLn $ show (sum $ map snd results) ++ " failure(s)"
        where test (message, condition) =
                ( message ++ ": " ++ (if condition then "SUCCESS" else "FAIL")
                , if condition then 0 else 1
                )
