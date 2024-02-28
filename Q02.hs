import Text.Printf

main :: IO ()
main = do
    putStrLn "Digite um número inteiro: "
    n <- readLn :: IO Int
    let s = sum [(-1) ** fromIntegral i / (2 * fromIntegral i + 1) | i <- [0..n-1]]
        piValue = (s * 32) ** (1/3) :: Double
    printf "O valor de pi é: %.5f\n" piValue
