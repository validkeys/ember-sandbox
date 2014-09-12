EmbedClickerComponent = Ember.Component.extend

  url: ''

  article: null

  classNameBindings: ['isFeature']

  attributeBindings: ['style','width']

  utms: ''

  width: 198

  fontColor: "#000000"
  cc:(->
    "Embed Clicked picked up font color change"
  ).observes("fontColor")

  style:(->
    "position: relative;"
  ).property()

  defaultLinkStyle:(->
    "text-decoration: none; color: #{@get("fontColor")};"
  ).property('fontColor')

  headingStyle:(->
    "text-align: left; font-weight: bold; line-height: 25px;padding: 0px 10px 0 0px; margin: 0;font-size: 19px; color: #{@get('fontColor')};"
  ).property('fontColor')

  descriptionBlockStyle:(->
    "font-size: 13px; font-weight: regular; line-height: 20px; color: #{@get("fontColor")}; padding: 0px 10px 0 0; margin: 5px 0 0 0;"
  ).property('fontColor')

  authorStyle:(->
    "font-size: 12px; line-height: 12px; text-transform: uppercase; letter-spacing: .1em; margin: 0; padding: 0 0 5px; display: block; font-weight: 100; text-decoration: none; color: #{@get('fontColor')};"
  ).property('fontColor')

  imageSource:(->
    width = @get('imageWidth')
    height = width * (9/16)
    "http://imgry.pressly.com/529dfe4b6461733d2e280000/fetch?op=balance&size=#{width}x#{height}&url=" + encodeURIComponent(@get('article.thumbnail_url'))
  ).property('article.thumbnail_url')

  defaultImageCellStyle:(->
    "padding-bottom: 10px; height: 300px; color: #{@get('fontColor')}"
  ).property('article.thumbnail_url','fontColor')

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
