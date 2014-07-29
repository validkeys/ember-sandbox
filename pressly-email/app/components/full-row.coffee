FullRowComponent = Ember.Component.extend

  tagName:    "tr"
  classNames: ["feature-row"]

  attributeBindings: ['style']

  imageWidth: 600

  style:(->
    "text-align: left;"
  ).property()

`export default FullRowComponent;`
