BookmarksController = Ember.ArrayController.extend

  favorites:(->
    @filterBy('favorite',true)
  ).property('@each.favorite')

  regulars:(->
    @filterBy('favorite',false)
  ).property('@each.favorite')  
  
  num_favorites:(->
    @filterBy('favorite',true).get('length')
  ).property('@each.favorite')

  num_regular:(->
    @filterBy('favorite',false).get('length')
  ).property('@each.favorite')  

`export default BookmarksController;`