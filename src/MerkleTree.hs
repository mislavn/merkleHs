module MerkleTree (
    printMerkleTree,
    MerkleTree(),
    ) where

-- binary tree representing a merkle tree
data MerkleTree a = EmptyMerkleTree
                  | MerkleTreeNode a (MerkleTree a) (MerkleTree a)
                  deriving (Eq, Ord, Show, Read)


-- print binary tree in list format
printMerkleTree EmptyMerkleTree               = "root node"
printMerkleTree (MerkleTreeNode a left right) = unlines (printMerkleTree_helper (MerkleTreeNode a left right))

printMerkleTree_helper EmptyMerkleTree               = []
printMerkleTree_helper (MerkleTreeNode a left right) = show a : printMerkleTree_subtree left right
        where
            printMerkleTree_subtree left right =
                ((showTree "+- " "|  ") (printMerkleTree_helper right))
                    ++ (showTree "`- " "   ") (printMerkleTree_helper left)
            showTree first rest = zipWith (++) (first : repeat rest)

