EmailBaseView = Ember.View.extend

  tagName: "table"

  classNames: "outter-table"

  attributeBindings: ['style','cellpadding','cellspacing','width']

  style:(->
    "width 600px; margin: 30px auto 0 auto; font-family: 'Arial'; text-align: center;"
  ).property()

  width:(->
    600
  ).property()

  cellpadding:(->
    0
  ).property()
  cellspacing:(->
    0
  ).property()

  # attributes: ["style="]

`export default EmailBaseView;`
