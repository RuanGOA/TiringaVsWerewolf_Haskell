import Data.Matrix
import Game
import Maps
import System.Exit (exitSuccess)
import System.Process
import System.Random

maps = [m1, m2, m3, m4]

comoJogar :: Matrix Char -> IO ()
comoJogar m = do
  putStrLn "====================================="
  putStrLn "=                                   ="
  putStrLn "=           COMO JOGAR?             ="
  putStrLn "=           -----------             ="
  putStrLn "=                                   ="
  putStrLn "= O JOGO CONSISTE EM FAZER  TIRINGA ="
  putStrLn "= ESCAPAR DA CHÁCARA, ANTES  QUE  O ="
  putStrLn "= LOBISOMEM O PEGUE.                ="
  putStrLn "=                                   ="
  putStrLn "= REPRESENTAÇÃO :                   ="
  putStrLn "=   T - TIRINGA                     ="
  putStrLn "=   W - LOBISOMEM                   ="
  putStrLn "=                                   ="
  putStrLn "= COMANDOS :                        ="
  putStrLn "=   W - CIMA                        ="
  putStrLn "=   A - ESQUERDA                    ="
  putStrLn "=   S - BAIXO                       ="
  putStrLn "=   D - DIREITA                     ="
  putStrLn "=                                   ="
  putStrLn "= M - MENU                          ="
  putStrLn "=                                   ="
  putStrLn "====================================="
  opcaoComoJogar <- getLine
  system "cls"
  redirecionaComoJogar opcaoComoJogar m

redirecionaComoJogar :: String -> Matrix Char -> IO ()
redirecionaComoJogar st m
  | st == "M" = menu m
  | otherwise = comoJogar m

vencedor :: Matrix Char -> IO ()
vencedor m = do
  putStrLn "====================================="
  putStrLn "=                                   ="
  putStrLn "=             VENCEDOR              ="
  putStrLn "=             --------              ="
  putStrLn "=                                   ="
  putStrLn "=    -->  ALGUEM 13:42:36  <--      ="
  putStrLn "=                                   ="
  putStrLn "= M - MENU                          ="
  putStrLn "=                                   ="
  putStrLn "====================================="
  opcaoVencedor <- getLine
  system "cls"
  redirecionaVencedor opcaoVencedor m

redirecionaVencedor :: String -> Matrix Char -> IO ()
redirecionaVencedor st m
  | st == "M" = menu m
  | otherwise = vencedor m

dificuldade :: Matrix Char -> IO ()
dificuldade m = do
  putStrLn "==================================="
  putStrLn "=                                 ="
  putStrLn "=          DIFICULDADE            ="
  putStrLn "=          -----------            ="
  putStrLn "=                                 ="
  putStrLn "= ESCOLHA UMA DIFICULDADE         ="
  putStrLn "=                                 ="
  putStrLn "= 1 - FÁCIL                       ="
  putStrLn "= 2 - DIFÍCIL                     ="
  putStrLn "=                                 ="
  putStrLn "= M - MENU                        ="
  putStrLn "=                                 ="
  putStrLn "==================================="
  opcaoDificuldade <- getLine
  system "cls"
  redirecionaDificuldade opcaoDificuldade m

redirecionaDificuldade :: String -> Matrix Char -> IO ()
redirecionaDificuldade st m
  | st == "M" = menu m
  | otherwise = prepare m st

menu :: Matrix Char -> IO ()
menu m = do
  putStrLn "====================================="
  putStrLn "=                                   ="
  putStrLn "=       TIRINGA VS. WEREWOLF        ="
  putStrLn "=       --------------------        ="
  putStrLn "=                                   ="
  putStrLn "= 1 - INICIAR JOGO                  ="
  putStrLn "= 2 - VENCEDOR                      ="
  putStrLn "= 3 - SELECIONAR DIFICULDADE        ="
  putStrLn "= 4 - COMO JOGAR?                   ="
  putStrLn "= 5 - SAIR                          ="
  putStrLn "=                                   ="
  putStrLn "====================================="

  opcaoMenu <- getLine
  system "cls"
  redirecionaMenu opcaoMenu m

redirecionaMenu :: String -> Matrix Char -> IO ()
redirecionaMenu st m
  | st == "1" = prepare m "1"
  | st == "2" = vencedor m
  | st == "3" = dificuldade m
  | st == "4" = comoJogar m
  | st == "5" = exitSuccess
  | otherwise = menu m

main :: IO ()
main = do
  system "cls"
  indexMap <- randomRIO (0, (Prelude.length maps) - 1) :: IO Int
  menu (maps Prelude.!! indexMap)