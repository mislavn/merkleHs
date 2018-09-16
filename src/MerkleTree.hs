module MerkleTree ( MerkleTree()
    ) where

data MerkleTree a = EmptyMerkleTree
                  | MerkleTreeNode a (MerkleTree a) (MerkleTree a)
                  deriving (Eq, Ord, Show, Read)


