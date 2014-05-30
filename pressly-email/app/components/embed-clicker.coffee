EmbedClickerComponent = Ember.Component.extend

  url: ''

  article: null

  classNameBindings: ['isFeature']

  attributeBindings: ['style']

  style:(->
    "position: relative;"
  ).property()

  defaultImageCellStyle:(->
    "background-image: url(#{@get('article.thumbnail_url')}); padding-bottom: 10px; height: 300px; background-repeat: no-repeat; background-size: cover; background-position: center center;"
  ).property('article.thumbnail_url')

  smartphoneImageBlockStyle:(->
    "background-image: url(#{@get('article.thumbnail_url')}); background-repeat: no-repeat; background-size: cover; background-position: center center;"
  ).property('article.thumbnail_url')

  format:(->
    if @get('layoutStyle') then @get('layoutStyle') else "default"
  ).property('layoutStyle')

  formatPartial:(->
    "layouts/partials/#{@get('format')}"
  ).property('format')

  description:(->
    desc = @get('article.description')

    if desc
      if desc.length > 140
        return desc.slice(0, 140) + "..."

    return desc

  ).property('article.description')

  isFeature:(->
    @get('feature')
  ).property('feature')

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
