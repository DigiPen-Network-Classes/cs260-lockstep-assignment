# CS 260 - Computer Networks I
# Assignment 5 - Lockstep Game

In this assignment, you will build on your previous experiences by 
adding socket code to an existing game that is implemented using 
lockstep replication and uses the C-Processing framework 
(adapted for C++). You may then extend that functionality to add 
support for additional players.

You will work as if you were a member of a larger team, meaning 
that your code changes should be targeted and not affect existing code.

## TODO Tasks

When you run the project, you will see the single-player game. 
Press 2 to enter the Lockstep Game flow, enter a port (i.e., 3000), 
and hit ENTER.  The program will appear to attempt to connect to an 
existing game, then host a new one... but if you check the console, 
you’ll see that socket creation is failing with error 10093. 
If you search online for WinSock error codes, you’ll find that 10093 
is WSANOTINITIALISED, which means that WSAStartup was not yet called!

Search the solution code for "TODO".  You will find them in:

*	CS260_Assignment4_Client.cpp
*	LockstepConnectingState.cpp
*	LockstepHostingState.cpp
*	LockstepGame.cpp

Your primary task is to implement each of these TODO sections, in place,
without disturbing the rest of the code. As you do so, remove the word 
TODO from each comment, and leave the rest of the comment in place. 
You may replace "TODO" with some variant of "TODONE" if you wish.
