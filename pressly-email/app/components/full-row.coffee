FullRowComponent = Ember.Component.extend

  tagName:    "tr"
  classNames: ["feature-row"]

  attributeBindings: ['style']

  imageWidth: 600

  fontColor: "#000000"

  style:(->
    "vertical-align: top; text-align: left; color: #{@get("fontColor")} !important;"
  ).property("fontColor")

`export default FullRowComponent;`
