SongsController = Ember.ArrayController.extend

  sortProperties: ['rating:desc']

  sortedSongs: Ember.computed.sort('model','sortProperties')

  actions:
    sortBy: (property) ->

      asc  = "#{property}:asc"
      desc = "#{property}:desc"

      if _.indexOf(@get('sortProperties'), asc) > -1
        @set 'sortProperties', [desc]
      else
        @set 'sortProperties', [asc]

`export default SongsController;`
