;;	Dispatch:
;;		- New types
;;			- Modify each operation.
;;		- New operations
;;			- Just implement the operation in one place.
;;	
;;	Data-directed style:
;;		- New types
;;			- Add entries to the table.
;;		- New operations
;;			- Add entries to the table.
;;	
;;	Message-passing:
;;		- New types
;;			- Implement all operations for the new object as well.
;;			- May have to implement the same thing for many types.
;;				- This is where inheritance comes in when one talks about OOP.
;;		- New operations
;;			- A new message.
;;				- Modify all types that accept the message.
;;	
;;	The data-directed style should work well whatever be the case.
;;	Message passing is good for new types, because they can be implemented in one place.
;;	Dispatch is good for new operations, again because they can be implemented in one place.
