---
created: 2023-06-01
share: true
category: 经验
title: Leetcode
---

### Tree
Solving problems related to trees often involves a good understanding of tree traversal techniques and recursive algorithms. Here are some common approaches and techniques:

1. **Depth-First Search (DFS):** This is a fundamental tree traversal method where you explore as far as possible along each branch before backtracking. There are three types of DFS: Pre-order (visit the root first, then left subtree, then right subtree), In-order (visit the left subtree first, then root, then right subtree), and Post-order (visit the left subtree first, then right subtree, then root). Many tree problems can be solved using one of these DFS traversals.

2. **Breadth-First Search (BFS):** This is another fundamental tree traversal method where you explore the tree level by level. This is commonly used when you want to find the shortest path in a tree, or to solve problems where the solution depends on the nodes on the same level.

3. **Recursion:** Many tree problems can be solved recursively because trees have a recursive structure (each subtree is a tree). You often need to return a value from the recursive call to the parent node and use this value to solve the problem.

4. **Binary Search Trees (BST):** If the tree is a BST, you can use its properties (left child is smaller than the root, and right child is larger than the root) to simplify the problem. In-order traversal of a BST visits the nodes in sorted order.

5. **Dynamic Programming:** Some tree problems require calculating a value based on the values of the subtrees. These can often be solved using a bottom-up dynamic programming approach.

6. **Using a Stack or Queue:** Some tree problems can be solved iteratively using a stack (for DFS) or a queue (for BFS).

Here are some classic tree problems that you can practice on LeetCode:

- "Binary Tree Inorder Traversal" (LeetCode 94)
- "Validate Binary Search Tree" (LeetCode 98)
- "Symmetric Tree" (LeetCode 101)
- "Maximum Depth of Binary Tree" (LeetCode 104)
- "Binary Tree Level Order Traversal" (LeetCode 102)
- "Construct Binary Tree from Preorder and Inorder Traversal" (LeetCode 105)
- "Path Sum" (LeetCode 112)
- "Binary Tree Maximum Path Sum" (LeetCode 124)

Remember, the key to improving your skills is consistent practice and understanding the underlying concepts. Good luck with your practice!

#### Depth-First Search (DFS)
```java
class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;

    TreeNode(int x) {
        val = x;
    }
}

public class BinaryTreeDFS {
    // Pre-order traversal
    public void preOrder(TreeNode root) {
        if (root != null) {
            System.out.print(root.val + " ");
            preOrder(root.left);
            preOrder(root.right);
        }
    }

    // In-order traversal
    public void inOrder(TreeNode root) {
        if (root != null) {
            inOrder(root.left);
            System.out.print(root.val + " ");
            inOrder(root.right);
        }
    }

    // Post-order traversal
    public void postOrder(TreeNode root) {
        if (root != null) {
            postOrder(root.left);
            postOrder(root.right);
            System.out.print(root.val + " ");
        }
    }

    public static void main(String[] args) {
        TreeNode root = new TreeNode(1);
        root.left = new TreeNode(2);
        root.right = new TreeNode(3);
        root.left.left = new TreeNode(4);
        root.left.right = new TreeNode(5);
        root.right.left = new TreeNode(6);
        root.right.right = new TreeNode(7);

        BinaryTreeDFS dfs = new BinaryTreeDFS();
        
        System.out.println("Pre-order traversal:");
        dfs.preOrder(root);
        
        System.out.println("\nIn-order traversal:");
        dfs.inOrder(root);
        
        System.out.println("\nPost-order traversal:");
        dfs.postOrder(root);
    }
}
```

#### Breadth-First Search (BFS)
```java
import java.util.*;

class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;

    TreeNode(int x) {
        val = x;
    }
}

public class BinaryTreeBFS {
    public void levelOrder(TreeNode root) {
        if (root == null) {
            return;
        }

        Queue<TreeNode> queue = new LinkedList<>();
        queue.add(root);

        while (!queue.isEmpty()) {
            TreeNode node = queue.poll();
            System.out.print(node.val + " ");

            if (node.left != null) {
                queue.add(node.left);
            }

            if (node.right != null) {
                queue.add(node.right);
            }
        }
    }

    public static void main(String[] args) {
        TreeNode root = new TreeNode(1);
        root.left = new TreeNode(2);
        root.right = new TreeNode(3);
        root.left.left = new TreeNode(4);
        root.left.right = new TreeNode(5);
        root.right.left = new TreeNode(6);
        root.right.right = new TreeNode(7);

        BinaryTreeBFS bfs = new BinaryTreeBFS();
        bfs.levelOrder(root);
    }
}

```

#### Recursion
##### maximum depth
```java
class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;

    TreeNode(int x) {
        val = x;
    }
}

public class MaxDepthBinaryTree {
    public int maxDepth(TreeNode root) {
        if (root == null) {
            return 0;
        } else {
            int leftDepth = maxDepth(root.left);
            int rightDepth = maxDepth(root.right);
            return Math.max(leftDepth, rightDepth) + 1;
        }
    }

    public static void main(String[] args) {
        TreeNode root = new TreeNode(1);
        root.left = new TreeNode(2);
        root.right = new TreeNode(3);
        root.left.left = new TreeNode(4);
        root.left.right = new TreeNode(5);
        root.right.left = new TreeNode(6);
        root.right.right = new TreeNode(7);

        MaxDepthBinaryTree solution = new MaxDepthBinaryTree();
        int maxDepth = solution.maxDepth(root);
        System.out.println("The maximum depth of the binary tree is: " + maxDepth);
    }
}

```
##### maximum path sum
```java
class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;

    TreeNode(int x) {
        val = x;
    }
}

public class MaxPathSumBinaryTree {
    int maxSum = Integer.MIN_VALUE; // initialize to the smallest possible integer

    public int maxPathSum(TreeNode root) {
        maxGain(root);
        return maxSum;
    }

    private int maxGain(TreeNode node) {
        if (node == null) {
            return 0;
        }

        // maximum gain from the left and right subtrees
        // if the gain is negative, we discard it and return 0 (i.e., don't go down that path)
        int leftGain = Math.max(maxGain(node.left), 0);
        int rightGain = Math.max(maxGain(node.right), 0);

        // the maximum path sum that includes the current node is the current value + maximum gains from left and right
        int newPathSum = node.val + leftGain + rightGain;

        // update maxSum if it's smaller than the new path sum
        maxSum = Math.max(maxSum, newPathSum);

        // for recursion, return the maximum gain that the parent node can get from this node
        return node.val + Math.max(leftGain, rightGain);
    }

    public static void main(String[] args) {
        TreeNode root = new TreeNode(1);
        root.left = new TreeNode(2);
        root.right = new TreeNode(3);
        root.left.left = new TreeNode(4);
        root.left.right = new TreeNode(5);

        MaxPathSumBinaryTree solution = new MaxPathSumBinaryTree();
        int maxPathSum = solution.maxPathSum(root);
        System.out.println("The maximum path sum in the binary tree is: " + maxPathSum);
    }
}

```
#### Binary Search Tree
```java
class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;

    TreeNode(int x) {
        val = x;
    }
}

public class ValidateBST {
    public boolean isValidBST(TreeNode root) {
        return validate(root, Long.MIN_VALUE, Long.MAX_VALUE);
    }

    public boolean validate(TreeNode node, long min, long max) {
        if (node == null) {
            return true;
        } else if (node.val <= min || node.val >= max) {
            return false;
        } else {
            return validate(node.left, min, node.val) && validate(node.right, node.val, max);
        }
    }

    public static void main(String[] args) {
        TreeNode root = new TreeNode(5);
        root.left = new TreeNode(3);
        root.right = new TreeNode(7);
        root.left.left = new TreeNode(2);
        root.left.right = new TreeNode(4);
        root.right.left = new TreeNode(6);
        root.right.right = new TreeNode(8);

        ValidateBST solution = new ValidateBST();
        boolean isValid = solution.isValidBST(root);
        System.out.println("The binary tree is a valid BST: " + isValid);
    }
}

```
#### Dynamic Programming
```java
class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;

    TreeNode(int x) {
    
        val = x;
    }
}

public class HouseRobberIII {
    public int rob(TreeNode root) {
        int[] result = robHelper(root);
        return Math.max(result[0], result[1]);
    }

    public int[] robHelper(TreeNode node) {
        if (node == null) {
            return new int[2];
        }

        int[] left = robHelper(node.left);
        int[] right = robHelper(node.right);
        
        int[] result = new int[2];

        // result[0] is when root is selected, the node itself plus grandchildren nodes
        result[0] = node.val + left[1] + right[1];
        
        // result[1] is when root not selected, the max value from children nodes
        result[1] = Math.max(left[0], left[1]) + Math.max(right[0], right[1]);

        return result;
    }

    public static void main(String[] args) {
        TreeNode root = new TreeNode(3);
        root.left = new TreeNode(2);
        root.right = new TreeNode(3);
        root.left.right = new TreeNode(3);
        root.right.right = new TreeNode(1);

        HouseRobberIII solution = new HouseRobberIII();
        int maxRob = solution.rob(root);
        System.out.println("The maximum amount of money the robber can rob is: " + maxRob);
    }
}

```

### Dynamic Programming
Dynamic Programming (DP) is a problem-solving method commonly used in computer science and mathematics for optimization problems. It involves breaking down a complex problem into simpler sub-problems and solving each sub-problem only once, storing their solutions - ideally in a table structure. This approach is often called "bottom-up".

Dynamic Programming has two main characteristics:

1. **Overlapping Subproblems:** This means that the problem can be broken down into subproblems which are reused several times. A simple example of this is the Fibonacci sequence, where the calculation of a number in the sequence requires the calculation of smaller numbers more than once.

2. **Optimal Substructure:** This means that the optimal solution to the problem can be constructed efficiently from the optimal solutions of its subproblems. For instance, in the shortest path problem in a graph, if we know the shortest path from a point A to point B, then to get the shortest path from A to point C, we just need to append the shortest path from B to C.

An important thing to note about Dynamic Programming is that not every problem can be solved with it. The problem must exhibit the properties of overlapping subproblems and optimal substructure. If we can identify these properties in a problem, we can likely use DP to solve it more efficiently than other methods like brute-force or recursion.

Here are some famous problems that can be solved with DP:

- Fibonacci Sequence
- Longest Common Subsequence
- Shortest Path by Dijkstra
- Knapsack Problem
- Coin Change Problem
- Matrix Chain Multiplication

DP can significantly reduce the computational complexity of problems, especially those with an exponential time complexity due to repeated computations.
#### Fibonacci Sequence
```java
public class Fibonacci {
    public static int fib(int n) {
        if (n <= 1) {
            return n;
        }
        int[] fib = new int[n + 1];
        fib[0] = 0;
        fib[1] = 1;
        for (int i = 2; i <= n; i++) {
            fib[i] = fib[i - 1] + fib[i - 2];
        }
        return fib[n];
    }

    public static void main(String[] args) {
        int n = 10; // Calculate the 10th Fibonacci number
        System.out.println("The " + n + "th Fibonacci number is: " + fib(n));
    }
}

```
#### Longest Common Sequence
```java
public class LCS {
    public static int findLCS(String s1, String s2) {
        int[][] dp = new int[s1.length() + 1][s2.length() + 1];

        for (int i = 0; i <= s1.length(); i++) {
            for (int j = 0; j <= s2.length(); j++) {
                if (i == 0 || j == 0) {
                    dp[i][j] = 0;
                } else if (s1.charAt(i - 1) == s2.charAt(j - 1)) {
                    dp[i][j] = dp[i - 1][j - 1] + 1;
                } else {
                    dp[i][j] = Math.max(dp[i - 1][j], dp[i][j - 1]);
                }
            }
        }

        return dp[s1.length()][s2.length()];
    }

    public static void main(String[] args) {
        String s1 = "AGGTAB";
        String s2 = "GXTXAYB";
        System.out.println("Length of LCS is: " + findLCS(s1, s2));
    }
}

```
#### Knapsack Problem
```java
public class Knapsack {
    // A utility function that returns maximum of two integers
    static int max(int a, int b) {
        return (a > b) ? a : b;
    }

    // Returns the maximum value that can be put in a knapsack of capacity W
    static int knapSack(int W, int wt[], int val[], int n) {
        int i, w;
        int K[][] = new int[n + 1][W + 1];

        // Build table K[][] in bottom up manner
        for (i = 0; i <= n; i++) {
            for (w = 0; w <= W; w++) {
                if (i == 0 || w == 0)
                    K[i][w] = 0;
                else if (wt[i - 1] <= w)
                    K[i][w] = max(val[i - 1] + K[i - 1][w - wt[i - 1]],  K[i - 1][w]);
                else
                    K[i][w] = K[i - 1][w];
            }
        }

        return K[n][W];
    }

    public static void main(String args[]) {
        int val[] = new int[]{60, 100, 120};
        int wt[] = new int[]{10, 20, 30};
        int W = 50;
        int n = val.length;
        System.out.println(knapSack(W, wt, val, n));
    }
}
```

#### Coin Change Problem
The coin change problem is a classic problem in dynamic programming. In this problem, you are given an amount of money and a list of coin denominations. The task is to calculate the number of ways you can make change for the amount given the denominations.
```java
public class CoinChange {
    public static long countWays(int S[], int m, int n) {
        // table[i] will be storing the number of solutions for
        // value i. We need n+1 rows as the table is constructed
        // in bottom up manner using the base case 0 value case (n = 0)
        long[] table = new long[n+1];

        // Initialize all table values as 0
        for(int i = 0; i < n+1; i++) {
            table[i] = 0;
        }

        // Base case (If given value is 0)
        table[0] = 1;

        // Pick all coins one by one and update the table[] values
        // after the index greater than or equal to the value of the
        // picked coin
        for(int i=0; i<m; i++)
            for(int j=S[i]; j<=n; j++)
                table[j] += table[j-S[i]];

        return table[n];
    }

    public static void main(String args[]) {
        int arr[] = {1, 2, 3};
        int m = arr.length;
        int n = 4;
        System.out.println(countWays(arr, m, n));
    }
}

```

#### Matrix Chain Multiplication (MCM)
Matrix Chain Multiplication (MCM) is an optimization problem that can be solved using dynamic programming. The problem statement is as follows: Given a sequence of matrices, the goal is to find the most efficient way to multiply these matrices. The problem is not to perform the multiplications, but to decide the sequence of the matrix multiplications involved.
```java
public class MatrixChainMultiplication {
    static int MatrixChainOrder(int p[], int n)
    {
        int m[][] = new int[n][n];
 
        int i, j, k, L, q;
 
        for (i = 1; i < n; i++)
            m[i][i] = 0;
 
        for (L = 2; L < n; L++) {
            for (i = 1; i < n - L + 1; i++) {
                j = i + L - 1;
                if (j == n)
                    continue;
                m[i][j] = Integer.MAX_VALUE;
                for (k = i; k <= j - 1; k++) {
                    q = m[i][k] + m[k + 1][j] + p[i - 1] * p[k] * p[j];
                    if (q < m[i][j])
                        m[i][j] = q;
                }
            }
        }
 
        return m[1][n - 1];
    }
 
    public static void main(String args[])
    {
        int arr[] = new int[] { 1, 2, 3, 4 };
        int size = arr.length;
 
        System.out.println(
            "Minimum number of multiplications is "
            + MatrixChainOrder(arr, size));
    }
}

```

### greedy algorithm
A greedy algorithm is a simple, intuitive algorithm used in optimization problems. The algorithm makes the optimal choice at each step as it attempts to find the overall optimal way to solve the entire problem. Greedy algorithms are quite successful in some problems, making it a useful strategy for solving a wide range of problems.

Greedy algorithms follow a simple four-function process:

1. A candidate function, which checks whether a candidate can be used to contribute to the solution.
2. A selection function, which indicates the best candidate to be added to the solution.
3. A feasibility function, which is used to determine if a candidate can be used to contribute to a solution.
4. An objective function, which assigns a value to a solution or a partial solution, and the solution is then typically maximized or minimized.

The key principle of a greedy algorithm is to make a locally optimal choice at each decision point with the hope that all these local decisions lead to a global optimum solution for the problem. 

Some examples of problems solved by greedy algorithms include:

- Kruskal’s and Prim's minimum spanning tree algorithms.
- Dijkstra's algorithm for shortest paths from a single source.
- The Huffman coding (data compression).
- The Knapsack problem (though the greedy solution doesn't always yield the best solution, and a dynamic programming approach is typically better).

It's worth noting that while greedy algorithms are simple and can solve a lot of problems quite efficiently, they don't always yield the most optimal solution, especially on problems where the optimal solution requires looking ahead or considering multiple possible paths. In these cases, other techniques, like dynamic programming or backtracking, are more appropriate.

solve the Kruskal’s and Prim's minimum spanning tree algorithms using greedy algorithm, specify which is your candidate function,selection function,feasibility function and objective function.

#### Kruskal’s and Prim's minimum spanning tree algorithms
**Kruskal's Algorithm**:

Kruskal's algorithm is a greedy algorithm that finds the minimum spanning tree for a connected weighted undirected graph. It works by continuously adding the next smallest edge that doesn't form a cycle with the edges built so far until we have a spanning tree.

Here are the functions in the context of Kruskal's algorithm:

- Candidate Function: All the edges in the graph are candidates.
- Selection Function: The edge with the least weight that does not form a cycle with the already included edges is selected.
- Feasibility Function: An edge is feasible if it does not form a cycle with the already included edges.
- Objective Function: Minimize the total weight of the edges in the spanning tree.

**Prim's Algorithm**:

Prim's algorithm is another greedy algorithm that finds the minimum spanning tree for a connected weighted undirected graph. It works by continuously adding the next smallest edge that connects a vertex in the tree built so far to a vertex outside the tree.

Here are the functions in the context of Prim's algorithm:

- Candidate Function: All the edges connecting a vertex inside the tree built so far to a vertex outside the tree are candidates.
- Selection Function: The edge with the least weight connecting a vertex inside the tree to a vertex outside the tree is selected.
- Feasibility Function: An edge is feasible if it connects a vertex inside the tree to a vertex outside the tree.
- Objective Function: Minimize the total weight of the edges in the spanning tree.

In both of these algorithms, the greedy choice is made by choosing the edge with the smallest weight that satisfies the conditions. Both algorithms guarantee finding a minimum spanning tree of a connected weighted graph because they both continuously make locally optimal choices (the smallest edge) that lead to a global optimum (the minimum spanning tree).

[java-spanning-trees-kruskal](https://www.baeldung.com/java-spanning-trees-kruskal)
[java-prim-algorithm](https://www.baeldung.com/java-prim-algorithm)

#### HuffmanNode
In the Huffman Coding algorithm, the basic idea is to map the most frequently occurring characters to the shortest code words. This is done by building a binary tree where the two least frequent characters are placed at the farthest distance from the root.

A PriorityQueue (MinHeap in this case) is often used in the implementation where the node with the least frequency has the highest priority.

Once the tree is complete, the Huffman code can be derived by traversing from the root to each leaf node. Moving to a 'left child' adds a '0' to the code, while moving to a 'right child' adds a '1' to the code.

Note that this is a very basic implementation of Huffman Coding and there might be some additional considerations depending on the specifics of the problem you are trying to solve.

This code may not run as it is because some parts are simplified for explanation. Please consider it as a general guide and you may need to adjust it according to your specific needs and constraints.
```java
// Java program for Huffman Coding with heap
import java.util.PriorityQueue;
import java.util.Scanner;
import java.util.Comparator;

// node class is the basic structure
// of each node present in the huffman - tree.
class HuffmanNode {

  int data;
  char c;

  HuffmanNode left;
  HuffmanNode right;
}

// comparator class helps to compare the node
// on the basis of one of its attribute.
// Here we will be compared
// on the basis of data values of the nodes.
class MyComparator implements Comparator<HuffmanNode> {
  public int compare(HuffmanNode x, HuffmanNode y)
  {
    return x.data - y.data;
  }
}

public class Huffman {

  // recursive function to print the
  // huffman-code through the tree traversal.
  // Here s is the huffman - code generated.
  public static void printCode(HuffmanNode root, String s)
  {
    // base case; if the left and right are null
    // then its a leaf node and we print
    // the character and its huffman code
    if (root.left == null && root.right == null && Character.isLetter(root.c)) {
      System.out.println(root.c + ":" + s);
      return;
    }

    // recursive calls for left and
    // right sub-tree of the generated tree.
    printCode(root.left, s + "0");
    printCode(root.right, s + "1");
  }

  // main function
  public static void main(String[] args)
  {
    Scanner s = new Scanner(System.in);

    // number of characters.
    int n = 6;
    char[] charArray = { 'a', 'b', 'c', 'd', 'e', 'f' };
    int[] charfreq = { 5, 9, 12, 13, 16, 45 };

    // creating a priority queue q.
    // makes a min-priority queue(min-heap).
    PriorityQueue<HuffmanNode> q
        = new PriorityQueue<HuffmanNode>(n, new MyComparator());

    for (int i = 0; i < n; i++) {

      // creating a huffman node object
      // and add it to the priority-queue.
      HuffmanNode hn = new HuffmanNode();

      hn.c = charArray[i];
      hn.data = charfreq[i];

      hn.left = null;
      hn.right = null;

      // add functions adds
      // the huffman node to the queue.
      q.add(hn);
    }

    // create a root node
    HuffmanNode root = null;

    // Here we will extract the two minimum value
    // from the heap each time until
    // its size reduces to 1, extract until
    // all the nodes are extracted.
    while (q.size() > 1) {

      // first min extract.
      HuffmanNode x = q.peek();
      q.poll();

      // second min extract.
      HuffmanNode y = q.peek();
      q.poll();

      // new node f which is equal
      HuffmanNode f = new HuffmanNode();

      // to the sum of the frequency of the two nodes
      // assigning values to the f node.
      f.data = x.data + y.data;
      f.c = '-';

      // first extracted node as left child.
      f.left = x;

      // second extracted node as the right child.
      f.right = y;

      // marking the f node as the root node.
      root = f;

      // add this node to the priority-queue.
      q.add(f);
    }

    // print the codes by traversing the tree
    printCode(root, "");
  }
}
```

