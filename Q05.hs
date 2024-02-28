import Text.Printf (printf)

main :: IO ()
main = do
    let menorIPCA = 1 / 0 -- infinito positivo
        maiorIPCA = -1 / 0 -- infinito negativo
    putStrLn "Digite os valores do IPCA por mês (Digite '*' para encerrar):"
    loop menorIPCA maiorIPCA 0 0 ""

loop :: Double -> Double -> Double -> Int -> String -> IO ()
loop menorIPCA maiorIPCA somaIPCA quantidadeMeses mesMenorIPCA = do
    putStr "Digite o mês e ano (MM/YYYY) seguido do IPCA (utilize vírgula para decimais): "
    entrada <- getLine
    if entrada == "*"
        then do
            let mediaIPCA = somaIPCA / fromIntegral quantidadeMeses
            printf "Menor IPCA: %.2f (%s)\n" menorIPCA mesMenorIPCA
            printf "Maior IPCA: %.2f\n" maiorIPCA
            printf "Média do IPCA: %.2f\n" mediaIPCA
        else do
            let (mesAno, ipca) = readInput entrada
            let menorIPCA' = min menorIPCA ipca
            let maiorIPCA' = max maiorIPCA ipca
            loop menorIPCA' maiorIPCA' (somaIPCA + ipca) (quantidadeMeses + 1) (if ipca < menorIPCA then mesAno else mesMenorIPCA)

readInput :: String -> (String, Double)
readInput entrada = (mesAno, ipca)
    where
        (mesAno, ipcaStr) = break (== ' ') entrada
        ipca = read (tail ipcaStr)
