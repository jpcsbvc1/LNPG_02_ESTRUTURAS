import Text.Printf

main :: IO ()
main = do
    putStrLn "Quantidade de jogos vendidos este mês: "
    quantidadeJogos <- readLn :: IO Int

    let valorTotalVendas :: Double
        valorTotalVendas = fromIntegral quantidadeJogos * 19.90

        bonus :: Double
        bonus = (fromIntegral quantidadeJogos / 15) * (0.08 * valorTotalVendas)

        salario :: Double
        salario = 0.5 * valorTotalVendas + bonus

    printf "%.2f\n" valorTotalVendas
    printf "%.2f\n" bonus
    printf "%.2f\n" salario
