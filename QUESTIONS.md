#  Questions

## 1, What (if any) further additions would you like to make to your submission if you had more time?

- Handle errors by the API on completion instead of just a print statement.
- Handle errors thrown by saving favorites.
- Add a loading state to avoid empty views when there's no cache. (eg. loading the quotes for the first time result in displaying "No quotes available for..." during the network request)
- Better placeholder for image loading.
- Pagination for the character list.
- Add search suggestions when typing to the search bar.

## 2, Is there anything you would change about your current implementation?

- Think more about the way `searchResults` and `favoritesOnly` are handled.
- Add Documentation and Comments.
- Add Tests.
- Add a `Repository/Service` layer between the API, File Loading and the ViewModels to make the code easier to test.
