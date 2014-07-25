;;	For the frequencies described in 2.71,
;;		Most frequent symbol : O(1) steps.
;;			- find it in the first go.
;;		Least frequent symbol: O(n^2) steps.
;;			- Search n, n - 1, n - 2, ... elements as the levels descend.
;;				- 1 at the left, others on the right.
;;				- go through all of them in the worst case
