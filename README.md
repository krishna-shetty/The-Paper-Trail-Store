# The Paper Trail Store

## A Case Study of Graph Neural Networks (GNNs) Using Recommender Systems
This project is a book recommendation system that utilizes Graph Neural Networks and a user-friendly Flutter front-end to provide personalized suggestions for books to read.

## Scope
The Scope of project includes: 
- Finding data related to books and the preferences of certain users towards certain books
- Cleaning data to make it fit for the purpose of learning from it.
- Model the data in terms of a graph and to prepare it for a GNN model.
- Develop a functioning algorithm to predict certain books on user attributes.
- Develop an elegant front-end application to display our results in a virtual environment.
- Host our back-end application so that it is accessible from anywhere to devices connected to the internet.

The attributes out of scope for the project are: -
- The algorithm uses a few attributes such as location and age and is probably not best suited to be used in a production environment.
- The front-end application exists solely to demonstrate a potential user experience when using our recommendation system hence it does not contain other functionalities an app may contain such as a checkout system or payment processing systems etc.

## Flutter Implementation
As mentioned earlier, the frontend for the project was deployed using Flutter. We created a landing page which showcases our company logo along with login and sign up buttons. 

For creating an account, it prompts the user to give his age and location along with the usual email and password details. With this information, first and foremost, it makes an API call to the ML model giving it the necessary age and location details. It asynchronously waits for the API to return the JSON file with the list of books recommended. If the call is unsuccessful, it displays the appropriate error message. If successful, it stores the book in the database pertaining to the user. The aforementioned user details also get stored. 

After successfully login in, the user is greeted with a welcome screen which transitions into the user’s home page. It displays the Discover Books section which shows the books recommended by the graph neural network and also the New & Trending section which uses the data retrieved from the API call forgetting the latest books and also. 

A settings page contains an about us, donate a coffee, support/updates and email us with a logout button.
 
Landing page:
Login page:
Registration Page:
Welcome page:
Home Page:
Settings Page:
 
## Authors
* [Krishna Shetty](https://github.com/krishna-shetty)
* [Nishant Rajadhyaksha](https://github.com/nishant42491)
* [Mayank Shetty](https://www.linkedin.com/in/mayank-shetty-a79524249)
