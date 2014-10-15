`import sanitizer from "pressly-email/utils/sanitizer"`
BuildsController = Ember.ObjectController.extend

  canGenerateHtml: 0

  emails: ""

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

  logoWidth: 0
  onImageChange:(->
    Ember.run.later =>
      naturalWidth = $('img.logo-image')[0].naturalWidth
      newWidth = if naturalWidth > 600 then 600 else naturalWidth
      @set "logoWidth", newWidth
    , 500
  ).observes('logoUrl')

  bgColor:    '#ffffff'
  fontColor:  "#000000"
  logoUrl:    ''
  emailTitle: ''
  emailBody:  ''

  formattedEmailBody:(->
    @get('emailBody').replace(/\n/g, "<br />")
  ).property('emailBody')

  titleStyle:(->
    "border-bottom: #{@get('fontColor')} 1px solid; padding-bottom: 20px; margin-bottom: 20px; font-size: 26px; line-height: 1.3em; color: #{@get('fontColor')};"
  ).property('fontColor')

  bodyStyle:(->
    "font-size: 15px; line-height:1.5em; padding: 10px 0; color: #{@get('fontColor')};"
  ).property('fontColor')

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

    color = @get("bgColor")

    str = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta name="viewport" content="width=device-width" />

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Email</title>

    </head>

    <body style="font-family: \'Arial\'; background-color: ' + color + ';">
    [[INSERT-EMAIL]]
    </body>
    </html>'

    str

  ).property('bgColor')

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
    tok = "postman:m4ilm3"
    btoa tok
  ).property()

  actions:
    generate: ->
      @incrementProperty 'canGenerateHtml'
      @send 'showHtml'

    email: ->
      @incrementProperty 'canGenerateHtml'


      body =
        sender:     "sender@pressly.com"
        recipients: @get('addressList')
        subject:    @get('emailTitle')
        template_id: "fad39f43-a733-4e2a-96ce-0412708dac32"
        text_content: "This is an HTML email"
        html_content: @get('unwrappedHtml')
        variables:
          "-title-":   @get('emailTitle')
          "-context-": @get('emailBody')


      Ember.$.ajax
        url: "http://postman.pressly.io:9797/mail"
        type: "POST"
        data: JSON.stringify(body)
        dataType: "json"
        accepts: "application/json"
        beforeSend: (xhr) =>
          xhr.setRequestHeader "Authorization", "Basic #{@get('creds')}"
        success: (response) ->
          alert "Sent!"

`export default BuildsController;`
