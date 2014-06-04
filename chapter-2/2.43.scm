;;	exponential increase in time complexity.
;;	Call queen-cols board-size times instead of once.
;;	The recursive calls will themselves call queen-cols
;;	(board-size * board-size) times and so on.
;;	Eventually we should get something like
;;	(board-size ^ board-size) calls to queen-cols, which
;;	is a lot of calls...

;;	The initial number of calls was board-size, so we are
;;	looking at O(T ^ board-size) time complexity here.
