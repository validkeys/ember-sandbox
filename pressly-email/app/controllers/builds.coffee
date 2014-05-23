BuildsController = Ember.ObjectController.extend

  canGenerateHtml: false

  emailTitle: ''

  html:(->

    if @get('canGenerateHtml')

      sanitizer = new Sanitize(
        elements: ['a','p','b','u','i','em','h1','h2','h3','h4','h5','h6','blockquote','table','tr','td','img','small','span']
        attributes:
          a: ['href','title','style']
          table: ['style','width','height']
          tr: ['style','width','height']
          td: ['style','width','height','colspan']
          h1: ['style','width','height']
          h2: ['style','width','height']
          p: ['style','width','height']
          img: ['src','width','height','style']
      )

      frag       = sanitizer.clean_node $('#email-content').get(0)
      sanitizedHtml  = $('<div>').append(frag).get(0).innerHTML

      cleanHtml = html_beautify(sanitizedHtml,{
          max_preserve_newlines: 0
          indent_size: 2
          indent_with_tabs: false
      })

      cleanHtml

    else

      null

  ).property('canGenerateHtml')

  actions:
    generate: ->
      console.log "GENERATE!", @toggleProperty('canGenerateHtml')

`export default BuildsController;`
