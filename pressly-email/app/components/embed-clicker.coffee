EmbedClickerComponent = Ember.Component.extend

  url: ''

  article: null

  description:(->
    desc = @get('article.description')

    if desc
      if desc.length > 140
        return desc.slice(0, 140) + "..."

    return desc


  ).property('article.description')

  showSearchField: true

  performSearch: ->

    unless Ember.isEmpty(@get("url"))

      $.embedly.oembed(@get('url'), maxWidth: 1024)
        .then( (results) =>

          response = results[0]

          if response.error
            alert response.error_message
          else
            @setProperties
              article: response
              url: ''
              showSearchField: false

        , (args...) =>
          alert "ERROR!"
          console.error "Embedly Error:", args
        )

  trackSearch:(->
    Ember.run.debounce @, @performSearch, 300
  ).observes('url')

  actions:
    toggle: ->
      @toggleProperty 'showSearchField'

`export default EmbedClickerComponent;`
