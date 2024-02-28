import Text.Printf

main :: IO ()
main = do
    putStrLn "Quantidade de passageiros: "
    n <- readLn :: IO Int
    processPassengers n

processPassengers :: Int -> IO ()
processPassengers 0 = return ()
processPassengers n = do
    putStrLn "Você possui RG? (Sim ou Nao): "
    possuiRG <- getLine
    putStrLn "Qual sua data de nascimento no RG? (DD/MM/AAAA): "
    dataNascimentoRG <- getLine
    putStrLn "Você possui passagem? (Sim ou Nao): "
    possuiPassagem <- getLine
    putStrLn "E a data de nascimento na passagem? (DD/MM/AAAA): "
    dataNascimentoPassagem <- getLine
    putStrLn "Qual o seu assento? "
    assento <- getLine
    if possuiRG == "Nao"
        then printf "A saída é nessa direção\n"
        else if possuiPassagem == "Nao"
            then printf "A recepção é nessa direção\n"
            else if dataNascimentoRG /= dataNascimentoPassagem
                then printf "Infelizmente terei que chamar a polícia.\n"
                else printf "O seu assento é %s, tenha um ótimo dia\n" assento
    processPassengers (n - 1)
