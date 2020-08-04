1. New threads are not added to the tableview.

  Set up breakpoints on the tableview controller to check to see if the method was running, fixed issue by adding .resume to end of data taask on the create message thread, and put the subsequent tableview.reloadData() on the main thread.
  
  
  2. Threads are not being fetched from firebase.
  Added .resume() after data task.  Created MessageBoardTest to check that the fetchMessageThreads was not returning an empty messageThreads array and checked decoding error message.
  Fixed issue by changing the json decoder to decode an array instead of a dictonary.
  
  3. DetailView title doesnt update to thread title.
  Used breakpoints to check what message thread was being sent, realized segue wasnt being triggered because of incorrect identifier.
  
  4. Save and Cancel buttons on MessageDetailViewController dont trigger any action. 
  Cancel function has no associated code so added navigationController.dismiss.
  Set breakpoints to check Send function: message thread not initialized so function returning without creating a message.
  Fixed incorrect segue identifier and changed destination controller to account for the navigation controller first.
  
  5. New message not saving in message thread.
  added navigationController.dismiss to Send button.  Realized problem was internet related.

6. Created unit tests to check that message and message threads were being created.
7. Fixed UI test for creating messages.

  
  
  
  
  
  
  

