`import sanitizer from "pressly-email/utils/sanitizer"`
BuildsController = Ember.ObjectController.extend

  canGenerateHtml: 0

  emails: "kyle@pressly.com"

  addressList:(->
    addresses   = @get('emails').split(',')
    forDelivery = {}

    addresses.forEach (item, index, e) ->
      forDelivery["Name#{index}"] = addresses[index] = item.trim()

    forDelivery

  ).property('emails')

  canEmail:(->
    @get('emails.length') > 0
  ).property('emails')

  emailTitle: ''

  emailBody: ''

  utmCampaignName: ''
  utmCampaignSource: ''
  utmMedium: ''
  utmContent: ''

  utmString:(->

    strArray = []

    strArray.push("utm_campaign=#{@get('utmCampaignName')}") if !Ember.isEmpty(@get('utmCampaignName'))
    strArray.push("utm_source=#{@get('utmCampaignSource')}") if !Ember.isEmpty(@get('utmCampaignSource'))
    strArray.push("utm_medium=#{@get('utmMedium')}") if !Ember.isEmpty(@get('utmMedium'))
    strArray.push("utm_content=#{@get('utmContent')}") if !Ember.isEmpty(@get('utmContent'))

    strArray.join("&")

  ).property('utmCampaignName','utmCampaignSource','utmMedium','utmContent')

  wrapperHtml:(->

    str = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta name="viewport" content="width=device-width" />

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Email</title>

    </head>

    <body style="font-family: \'Arial\';">
    [[INSERT-EMAIL]]
    </body>
    </html>';

  ).property()

  outterTemplate: (innerHtml) ->
    @get('wrapperHtml').replace('[[INSERT-EMAIL]]', innerHtml)


  html:(->
    if @get('canGenerateHtml')
      frag           = sanitizer.clean_node $('#email-content').get(0)
      sanitizedHtml  = $('<div>').append(frag).get(0).innerHTML

      wrappedHtml = @outterTemplate sanitizedHtml

      cleanHtml = html_beautify(wrappedHtml,{
          max_preserve_newlines: 0
          indent_size: 2
          indent_with_tabs: false
          unescape_strings: true
      })

      cleanHtml = cleanHtml.replace('&amp;','&')
    else
      null

  ).property('canGenerateHtml')

  unwrappedHtml:(->
    if @get('canGenerateHtml')
      frag           = sanitizer.clean_node $('#email-content').get(0)
      sanitizedHtml  = $('<div>').append(frag).get(0).innerHTML

      cleanHtml = html_beautify(sanitizedHtml,{
          max_preserve_newlines: 0
          indent_size: 2
          indent_with_tabs: false
          unescape_strings: true
      })

      cleanHtml = cleanHtml.replace('&amp;','&')
    else
      null
  ).property('canGenerateHtml')

  creds:(->
    tok = "pressly-test:testpressly"
    btoa tok
  ).property()

  actions:
    generate: ->
      @incrementProperty 'canGenerateHtml'
      @send 'showHtml'

    email: ->
      @incrementProperty 'canGenerateHtml'


      body =
        sender:     "sender@gmail.com"
        recipients: @get('addressList')
        subject:    @get('emailTitle')
        template_id: "fad39f43-a733-4e2a-96ce-0412708dac32"
        text_content: "This is an HTML email"
        html_content: @get('unwrappedHtml')
        variables:
          "-title-":   @get('emailTitle')
          "-context-": @get('emailBody')


      Ember.$.ajax
        url: "/mail"
        type: "POST"
        # crossDomain: true
        data: JSON.stringify(body)
        dataType: "json"
        # accepts: "application/json"
        headers:
          'Authorization': 'Basic cHJlc3NseS10ZXN0OnRlc3RwcmVzc2x5'
        success: (response) ->
          alert "SUCCESS"

`export default BuildsController;`
