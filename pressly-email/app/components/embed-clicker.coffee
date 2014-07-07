EmbedClickerComponent = Ember.Component.extend

  url: ''

  article: null

  classNameBindings: ['isFeature']

  attributeBindings: ['style','width']

  utms: ''

  width: 198

  style:(->
    "position: relative;"
  ).property()

  imageSource:(->
    width = @get('imageWidth')
    height = width * (9/16)
    "http://imgry.pressly.com/529dfe4b6461733d2e280000/fetch?op=balance&size=#{width}x#{height}&url=" + encodeURIComponent(@get('article.thumbnail_url'))
  ).property('article.thumbnail_url')

  defaultImageCellStyle:(->
    "padding-bottom: 10px; height: 300px;"
  ).property('article.thumbnail_url')

  smartphoneImageBlockStyle:(->
    "width: 198px;"
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

  printUrl:(->
    articleUrl = @get('article.url')
    utms       = @get('utms')

    if Ember.isEmpty(utms)
      articleUrl
    else
      if articleUrl.indexOf("?") > -1
        "#{articleUrl}&#{utms}"
      else
        "#{articleUrl}?#{utms}"
  ).property('article.url','utms')

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
