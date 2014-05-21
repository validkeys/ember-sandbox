EmailBaseView = Ember.View.extend

  tagName: "table"

  classNames: "outter-table"

  attributeBindings: ['style']

  style:(->
    "max-width: 600px; width: 100%; margin: 30px auto 0 auto;"
  ).property()

  # attributes: ["style="]

`export default EmailBaseView;`
