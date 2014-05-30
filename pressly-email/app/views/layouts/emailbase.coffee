EmailBaseView = Ember.View.extend

  tagName: "table"

  classNames: "outter-table"

  attributeBindings: ['style']

  style:(->
    "width: 600px; margin: 30px auto 0 auto; font-family: 'Arial';"
  ).property()

  # attributes: ["style="]

`export default EmailBaseView;`
