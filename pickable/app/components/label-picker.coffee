LabelPickerComponent = Ember.Component.extend

  # init: ->
  #   @_super()
  #   window.test = @

  pickAction: 'pick'
  unpickAction: 'unpick'

  pickables:(->
    selectedItems = @get('selected')

    @get('items').map (item) ->
      Ember.Object.create
        key: item
        isPicked: selectedItems.contains(item)

  ).property('items','selected')

  actions:
    pick: (item) ->
      if item.get('isPicked')
        @sendAction 'unpickAction', item.get('key')
      else
        @sendAction 'pickAction', item.get('key')

`export default LabelPickerComponent;`
