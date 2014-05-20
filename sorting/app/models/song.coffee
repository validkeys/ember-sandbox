Song = DS.Model.extend
  title: DS.attr('string')
  rating: DS.attr('number')

Song.reopenClass
  FIXTURES: [
    id: 1
    title: "A"
    rating: 1
  ,
    id: 2
    title: "B"
    rating: 2
  ,
    id: 3
    title: "C"
    rating: 3
  ,
    id: 4
    title: "D"
    rating: 4
  ]

`export default Song;`
