import Text.Printf
import Data.List (sort)

main :: IO ()
main = do
    let maxParticipantes = 100
        numQuestoes = 10
    gabarito <- getGabarito numQuestoes
    putStrLn "Agora insira as respostas dos participantes:"
    participantes <- getParticipantes maxParticipantes gabarito
    putStrLn "a) Lista de participantes e suas notas em ordem alfabética:"
    printParticipantes participantes
    putStrLn "b) Melhor e pior pontuação:"
    printMelhorPiorPontuacao participantes
    putStrLn "c) Participante(s) com a melhor pontuação:"
    printMelhoresParticipantes participantes
    putStrLn "d) Participante(s) com a pior pontuação:"
    printPioresParticipantes participantes
    putStrLn "e) Percentual de participantes com mais da metade das questões certas:"
    printPercentual participantes numQuestoes

getGabarito :: Int -> IO [Int]
getGabarito numQuestoes = do
    putStrLn "Insira as respostas do gabarito:"
    sequence [readLn :: IO Int | _ <- [1..numQuestoes]]

getParticipantes :: Int -> [Int] -> IO [(String, Int)]
getParticipantes maxParticipantes gabarito = loop 0 []
  where
    loop n participantes
      | n >= maxParticipantes = return participantes
      | otherwise = do
          putStrLn $ "Nome do participante (ou '*' para terminar):"
          nome <- getLine
          if nome == "*"
              then return participantes
              else do
                  nota <- calcularNota gabarito
                  loop (n+1) ((nome, nota):participantes)

calcularNota :: [Int] -> IO Int
calcularNota gabarito = do
    putStrLn "Respostas do participante:"
    respostas <- sequence [readLn :: IO Int | _ <- gabarito]
    return $ sum [1 | (gab, resp) <- zip gabarito respostas, gab == resp]

printParticipantes :: [(String, Int)] -> IO ()
printParticipantes participantes = mapM_ (\(nome, nota) -> printf "%s: %d\n" nome nota) (sort participantes)

printMelhorPiorPontuacao :: [(String, Int)] -> IO ()
printMelhorPiorPontuacao participantes = do
    let notas = map snd participantes
    printf "Melhor pontuação: %d\n" (maximum notas)
    printf "Pior pontuação: %d\n" (minimum notas)

printMelhoresParticipantes :: [(String, Int)] -> IO ()
printMelhoresParticipantes participantes = do
    let melhorPontuacao = maximum (map snd participantes)
        melhores = [nome | (nome, nota) <- participantes, nota == melhorPontuacao]
    mapM_ putStrLn melhores

printPioresParticipantes :: [(String, Int)] -> IO ()
printPioresParticipantes participantes = do
    let piorPontuacao = minimum (map snd participantes)
        piores = [nome | (nome, nota) <- participantes, nota == piorPontuacao]
    mapM_ putStrLn piores

printPercentual :: [(String, Int)] -> Int -> IO ()
printPercentual participantes numQuestoes = do
    let maisDaMetade = length [() | (_, nota) <- participantes, nota >= div numQuestoes 2]
        percentual :: Double
        percentual = fromIntegral maisDaMetade / fromIntegral (length participantes) * 100
    printf "%.1f%% dos participantes têm mais da metade das questões certas.\n" percentual
