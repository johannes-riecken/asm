import Control.Monad.Trans.State
import Control.Monad
import Data.Functor.Identity
import Control.Arrow
import Control.Monad.Trans.Class

evalSed :: [String] -> [String]
evalSed xs = join $ evalStateT (do
    x <- lift xs
    modify $ second (const [x])
    bigG
    ) ([""], undefined)

-- (String, String) ~ (HoldSpace, PatternSpace)
bigG :: Monad m => StateT ([String], [String]) m [String]
bigG = state $ \(h, p) -> (p ++ h, (h, p))

main :: IO ()
main = do
    print $ evalSed ["foo", "bar"]
