{-# LANGUAGE NoImplicitPrelude #-}

module Algorithm.Anagrams where

import Data.Function(on)
import Data.Char(toLower)
import Data.List(permutations, intersectBy)
import Core

{-

Functions you will need
--
* fmap :: (a -> b) -> IO a -> IO b
* readFile :: FilePath -> IO String
* lines :: String -> [String]
* permutations :: [a] -> [[a]]
* intersectBy :: (a -> a -> Bool) -> [a] -> [a] -> [a]
* toLower :: Char -> Char

Functions that might help
-
* on :: (b -> b -> c) -> (a -> b) -> a -> a -> c

-}


-- Return all anagrams of the given string
-- that appear in the given dictionary file.
anagrams ::
  String
  -> FilePath
  -> IO [String]
anagrams name =
  fmap (intersectBy equalIgnoringCase (permutations name) . lines) . readFile

-- Compare two strings for equality, ignoring case
equalIgnoringCase ::
  String
  -> String
  -> Bool
equalIgnoringCase =
  (==) `on` map toLower
